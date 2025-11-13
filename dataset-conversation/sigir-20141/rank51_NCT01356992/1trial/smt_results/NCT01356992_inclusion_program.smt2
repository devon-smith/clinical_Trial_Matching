;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_signed_informed_consent_form Bool) ;; {"when_to_set_to_true":"Set to true if the patient has signed the informed consent form.","when_to_set_to_false":"Set to false if the patient has not signed the informed consent form.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has signed the informed consent form.","meaning":"Boolean indicating whether the patient has signed the informed consent form."} // "To be included, the patient must have signed the informed consent form."
(declare-const patient_has_signed_informed_consent_form@@signed_by_patient Bool) ;; {"when_to_set_to_true":"Set to true if the informed consent form is signed by the patient.","when_to_set_to_false":"Set to false if the informed consent form is not signed by the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the informed consent form is signed by the patient.","meaning":"Boolean indicating whether the informed consent form is signed by the patient."} // "To be included, the patient must have signed the informed consent form."

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_signed_informed_consent_form@@signed_by_patient
         patient_has_signed_informed_consent_form)
     :named REQ0_AUXILIARY0)) ;; "To be included, the patient must have signed the informed consent form."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_signed_informed_consent_form
     :named REQ0_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have signed the informed consent form."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_agrees_to_follow_all_instructions Bool) ;; {"when_to_set_to_true":"Set to true if the patient agrees to follow all instructions provided as part of the study.","when_to_set_to_false":"Set to false if the patient does not agree to follow all instructions provided as part of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient agrees to follow all instructions provided as part of the study.","meaning":"Boolean indicating whether the patient agrees to follow all instructions provided as part of the study."} // "To be included, the patient must agree to follow all instructions."
(declare-const patient_agrees_to_perform_all_procedures Bool) ;; {"when_to_set_to_true":"Set to true if the patient agrees to perform all procedures required by the study.","when_to_set_to_false":"Set to false if the patient does not agree to perform all procedures required by the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient agrees to perform all procedures required by the study.","meaning":"Boolean indicating whether the patient agrees to perform all procedures required by the study."} // "To be included, the patient must agree to perform all procedures."
(declare-const patient_agrees_to_attend_all_study_visits Bool) ;; {"when_to_set_to_true":"Set to true if the patient agrees to attend all study visits required by the study.","when_to_set_to_false":"Set to false if the patient does not agree to attend all study visits required by the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient agrees to attend all study visits required by the study.","meaning":"Boolean indicating whether the patient agrees to attend all study visits required by the study."} // "To be included, the patient must agree to attend all study visits."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_agrees_to_follow_all_instructions
     :named REQ1_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must agree to follow all instructions."

(assert
  (! patient_agrees_to_perform_all_procedures
     :named REQ1_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must agree to perform all procedures."

(assert
  (! patient_agrees_to_attend_all_study_visits
     :named REQ1_COMPONENT2_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must agree to attend all study visits."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 18 years AND aged < 75 years"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female (e.g., male, other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is female."} // "male OR female"
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as male.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not male (e.g., female, other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is male."} // "male OR female"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (and (or patient_sex_is_male_now patient_sex_is_female_now)
          (>= patient_age_value_recorded_now_in_years 18.0)
          (< patient_age_value_recorded_now_in_years 75.0))
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be (male OR female) AND (aged ≥ 18 years AND aged < 75 years)."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const angina_at_rest_episode_minimum_duration_value_last_24_hours_in_minutes Real) ;; {"when_to_set_to_value":"Set to the minimum duration in minutes of any episode of angina at rest experienced by the patient in the last 24 hours at the beginning of the observation period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined what the minimum duration in minutes of any episode of angina at rest in the last 24 hours is.","meaning":"Numeric value representing the minimum duration in minutes of any episode of angina at rest in the last 24 hours at the beginning of the observation period."} // "minimum duration of 20 minutes in the last 24 hours at the beginning"
(declare-const angina_at_rest_episode_total_duration_value_in_days Real) ;; {"when_to_set_to_value":"Set to the total duration in days for which the patient has experienced angina at rest episodes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined what the total duration in days of angina at rest episodes is.","meaning":"Numeric value representing the total duration in days for which the patient has experienced angina at rest episodes."} // "at least for 10 days"
(declare-const patient_has_finding_of_angina_decubitus_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had angina at rest (angina decubitus) in their history, regardless of duration or timing.","when_to_set_to_false":"Set to false if the patient has never had angina at rest (angina decubitus) in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had angina at rest (angina decubitus) in their history.","meaning":"Boolean indicating whether the patient has ever had angina at rest (angina decubitus) in their history."} // "history of angina at rest"
(declare-const patient_has_finding_of_angina_decubitus_inthehistory@@minimum_duration_20_minutes_last_24_hours_and_at_least_10_days Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of angina at rest includes episode(s) with a minimum duration of 20 minutes in the last 24 hours at the beginning and lasted at least for 10 days.","when_to_set_to_false":"Set to false if the patient's history of angina at rest does not include episode(s) meeting these duration and timing criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of angina at rest meets these duration and timing criteria.","meaning":"Boolean indicating whether the patient's history of angina at rest meets the minimum duration and timing constraints specified in the requirement."} // "history of angina at rest with a minimum duration of 20 minutes in the last 24 hours at the beginning and at least for 10 days"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_finding_of_angina_decubitus_inthehistory@@minimum_duration_20_minutes_last_24_hours_and_at_least_10_days
         patient_has_finding_of_angina_decubitus_inthehistory)
     :named REQ3_AUXILIARY0)) ;; "history of angina at rest with a minimum duration of 20 minutes in the last 24 hours at the beginning and at least for 10 days" implies "history of angina at rest"

;; Definition of qualifier variable in terms of numeric constraints
(assert
  (! (= patient_has_finding_of_angina_decubitus_inthehistory@@minimum_duration_20_minutes_last_24_hours_and_at_least_10_days
        (and patient_has_finding_of_angina_decubitus_inthehistory
             (>= angina_at_rest_episode_minimum_duration_value_last_24_hours_in_minutes 20.0)
             (>= angina_at_rest_episode_total_duration_value_in_days 10.0)))
     :named REQ3_AUXILIARY1)) ;; "history of angina at rest with a minimum duration of 20 minutes in the last 24 hours at the beginning and at least for 10 days" defined by numeric constraints

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_has_finding_of_angina_decubitus_inthehistory@@minimum_duration_20_minutes_last_24_hours_and_at_least_10_days
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a history of angina at rest with a minimum duration of 20 minutes in the last 24 hours at the beginning and at least for 10 days."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_time_from_arrival_at_emergency_sector_to_randomization_in_hours Real) ;; {"when_to_set_to_value":"Set to the number of hours elapsed from the patient's arrival at the emergency sector to the time of randomization.","when_to_set_to_null":"Set to null if the time of arrival at the emergency sector or the time of randomization is unknown, not documented, or cannot be determined.","meaning":"Numeric value in hours representing the time from arrival at emergency sector to randomization."} // "To be included, the patient must be randomized within ≤ 6 hours after arrival at the emergency sector."

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (<= patient_time_from_arrival_at_emergency_sector_to_randomization_in_hours 6.0)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be randomized within ≤ 6 hours after arrival at the emergency sector."

;; ===================== Declarations for the inclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_acute_non_st_segment_elevation_myocardial_infarction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of acute non-ST segment elevation myocardial infarction.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of acute non-ST segment elevation myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of acute non-ST segment elevation myocardial infarction.","meaning":"Boolean indicating whether the patient currently has acute non-ST segment elevation myocardial infarction."} // "evidence of non ST segment elevation myocardial infarction"
(declare-const patient_has_finding_of_angina_pectoris_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of angina pectoris.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of angina pectoris.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of angina pectoris.","meaning":"Boolean indicating whether the patient currently has angina pectoris."} // "angina"
(declare-const patient_has_finding_of_angina_pectoris_now@@unstable Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has angina pectoris and the angina is unstable.","when_to_set_to_false":"Set to false if the patient currently has angina pectoris and the angina is not unstable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the angina is unstable.","meaning":"Boolean indicating whether the patient currently has unstable angina pectoris."} // "unstable angina"
(declare-const patient_has_finding_of_angina_pectoris_now@@meets_instability_criteria Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has angina pectoris and the instability is defined by at least one of the specified clinical, ECG, biochemical, or associated features.","when_to_set_to_false":"Set to false if the patient currently has angina pectoris but does not meet any of the specified instability criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the instability criteria are met.","meaning":"Boolean indicating whether the patient currently has angina pectoris with instability defined by at least one of the specified criteria."} // "evidence of unstable angina due to at least one of the following criteria"
(declare-const patient_has_finding_of_dynamic_t_wave_alteration_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has dynamic alterations on the T-wave.","when_to_set_to_false":"Set to false if the patient currently does not have dynamic alterations on the T-wave.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has dynamic alterations on the T-wave.","meaning":"Boolean indicating whether the patient currently has dynamic alterations on the T-wave."} // "dynamic alterations on the T-wave"
(declare-const st_segment_depression_value_recorded_now_withunit_millimeter Real) ;; {"when_to_set_to_value":"Set to the value of the patient's current ST-segment depression in millimeters.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined what the patient's current ST-segment depression value is.","meaning":"Numeric value indicating the current ST-segment depression in millimeters."} // "ST-segment depression > 1 millimeter"
(declare-const st_segment_elevation_value_recorded_now_withunit_millimeter Real) ;; {"when_to_set_to_value":"Set to the value of the patient's current ST-segment elevation in millimeters.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined what the patient's current ST-segment elevation value is.","meaning":"Numeric value indicating the current ST-segment elevation in millimeters."} // "ST-segment elevation > 1 millimeter"
(declare-const patient_has_finding_of_dynamic_t_wave_alteration_now@@resolved_at_least_partially_when_symptoms_are_relieved Bool) ;; {"when_to_set_to_true":"Set to true if the patient's dynamic T-wave inversions are resolved at least partially when the symptoms are relieved.","when_to_set_to_false":"Set to false if the patient's dynamic T-wave inversions are not resolved at least partially when the symptoms are relieved.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's dynamic T-wave inversions are resolved at least partially when the symptoms are relieved.","meaning":"Boolean indicating whether the patient's dynamic T-wave inversions are resolved at least partially when the symptoms are relieved."} // "T-wave inversions which are solved at least partially when the symptoms are relieved"
(declare-const patient_has_finding_of_uneven_st_segment_depression_in_transitional_way_under_continuous_ecg_leads_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has unevenly ST-segment depression in a transitional way under continuous ECG leads.","when_to_set_to_false":"Set to false if the patient currently does not have unevenly ST-segment depression in a transitional way under continuous ECG leads.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has unevenly ST-segment depression in a transitional way under continuous ECG leads.","meaning":"Boolean indicating whether the patient currently has unevenly ST-segment depression in a transitional way under continuous ECG leads."} // "unevenly ST-segment depression in a transitional way under continuous electrocardiogram (ECG) leads"
(declare-const patient_has_finding_of_uneven_st_segment_depression_in_transitional_way_under_continuous_ecg_leads_now@@lead_v1_plus_v2_or_v3_plus_v4_or_v5_plus_v6_or_lead_i_plus_avl_or_lead_ii_plus_lead_iii_plus_avf Bool) ;; {"when_to_set_to_true":"Set to true if the patient's unevenly ST-segment depression in a transitional way under continuous ECG leads is present in any of the specified lead combinations.","when_to_set_to_false":"Set to false if the patient's unevenly ST-segment depression in a transitional way under continuous ECG leads is not present in any of the specified lead combinations.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's unevenly ST-segment depression in a transitional way under continuous ECG leads is present in any of the specified lead combinations.","meaning":"Boolean indicating whether the patient's unevenly ST-segment depression in a transitional way under continuous ECG leads is present in any of the specified lead combinations."} // "V1 plus V2 OR V3 plus V4 OR V5 plus V6 OR lead I plus augmented vector left (aVL) OR lead II plus lead III plus augmented vector foot (aVF)"
(declare-const patient_has_finding_of_uneven_st_segment_elevation_in_transitional_way_under_continuous_ecg_leads_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has unevenly ST-segment elevation in a transitional way under continuous ECG leads.","when_to_set_to_false":"Set to false if the patient currently does not have unevenly ST-segment elevation in a transitional way under continuous ECG leads.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has unevenly ST-segment elevation in a transitional way under continuous ECG leads.","meaning":"Boolean indicating whether the patient currently has unevenly ST-segment elevation in a transitional way under continuous ECG leads."} // "unevenly ST-segment elevation in a transitional way under continuous ECG leads"
(declare-const patient_has_finding_of_uneven_st_segment_elevation_in_transitional_way_under_continuous_ecg_leads_now@@lead_v1_plus_v2_or_v3_plus_v4_or_v5_plus_v6_or_lead_i_plus_avl_or_lead_ii_plus_lead_iii_plus_avf Bool) ;; {"when_to_set_to_true":"Set to true if the patient's unevenly ST-segment elevation in a transitional way under continuous ECG leads is present in any of the specified lead combinations.","when_to_set_to_false":"Set to false if the patient's unevenly ST-segment elevation in a transitional way under continuous ECG leads is not present in any of the specified lead combinations.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's unevenly ST-segment elevation in a transitional way under continuous ECG leads is present in any of the specified lead combinations.","meaning":"Boolean indicating whether the patient's unevenly ST-segment elevation in a transitional way under continuous ECG leads is present in any of the specified lead combinations."} // "V1 plus V2 OR V3 plus V4 OR V5 plus V6 OR lead I plus aVL OR lead II plus lead III plus aVF"
(declare-const patient_is_exposed_to_creatine_kinase_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to creatine kinase (creatine phosphokinase) (i.e., creatine kinase is present/measured in the patient).","when_to_set_to_false":"Set to false if the patient is currently not exposed to creatine kinase (creatine phosphokinase) (i.e., creatine kinase is not present/measured in the patient).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to creatine kinase (creatine phosphokinase).","meaning":"Boolean indicating whether the patient is currently exposed to creatine kinase (creatine phosphokinase)."} // "creatine phosphokinase"
(declare-const patient_is_exposed_to_creatine_kinase_now@@altered_with_enzymatic_curve_characterizing_myocardial_injury Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to creatine kinase and the creatine kinase is altered with the appearance of an enzymatic curve, characterizing myocardial injury.","when_to_set_to_false":"Set to false if the patient is currently exposed to creatine kinase but the creatine kinase is not altered with the appearance of an enzymatic curve, characterizing myocardial injury.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the creatine kinase is altered with the appearance of an enzymatic curve, characterizing myocardial injury.","meaning":"Boolean indicating whether the patient is currently exposed to creatine kinase and the creatine kinase is altered with the appearance of an enzymatic curve, characterizing myocardial injury."} // "biochemical alteration on the myocardial necrosis markers (creatine kinase MB mass ...), with the appearance of enzymatic curve, characterizing myocardial injury"
(declare-const patient_is_exposed_to_troponin_i_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to troponin I (i.e., troponin I is present/measured in the patient).","when_to_set_to_false":"Set to false if the patient is currently not exposed to troponin I (i.e., troponin I is not present/measured in the patient).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to troponin I.","meaning":"Boolean indicating whether the patient is currently exposed to troponin I."} // "troponin I"
(declare-const patient_is_exposed_to_troponin_i_now@@altered_with_enzymatic_curve_characterizing_myocardial_injury Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to troponin I and the troponin I is altered with the appearance of an enzymatic curve, characterizing myocardial injury.","when_to_set_to_false":"Set to false if the patient is currently exposed to troponin I but the troponin I is not altered with the appearance of an enzymatic curve, characterizing myocardial injury.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the troponin I is altered with the appearance of an enzymatic curve, characterizing myocardial injury.","meaning":"Boolean indicating whether the patient is currently exposed to troponin I and the troponin I is altered with the appearance of an enzymatic curve, characterizing myocardial injury."} // "biochemical alteration on the myocardial necrosis markers (... troponin I ...), with the appearance of enzymatic curve, characterizing myocardial injury"
(declare-const patient_is_exposed_to_troponin_t_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to troponin T (i.e., troponin T is present/measured in the patient).","when_to_set_to_false":"Set to false if the patient is currently not exposed to troponin T (i.e., troponin T is not present/measured in the patient).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to troponin T.","meaning":"Boolean indicating whether the patient is currently exposed to troponin T."} // "troponin T"
(declare-const patient_is_exposed_to_troponin_t_now@@altered_with_enzymatic_curve_characterizing_myocardial_injury Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to troponin T and the troponin T is altered with the appearance of an enzymatic curve, characterizing myocardial injury.","when_to_set_to_false":"Set to false if the patient is currently exposed to troponin T but the troponin T is not altered with the appearance of an enzymatic curve, characterizing myocardial injury.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the troponin T is altered with the appearance of an enzymatic curve, characterizing myocardial injury.","meaning":"Boolean indicating whether the patient is currently exposed to troponin T and the troponin T is altered with the appearance of an enzymatic curve, characterizing myocardial injury."} // "biochemical alteration on the myocardial necrosis markers (... troponin T ...), with the appearance of enzymatic curve, characterizing myocardial injury"
(declare-const patient_has_finding_of_injury_of_heart_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of injury of heart (myocardial injury).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of injury of heart (myocardial injury).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of injury of heart (myocardial injury).","meaning":"Boolean indicating whether the patient currently has injury of heart (myocardial injury)."} // "characterizing myocardial injury"
(declare-const patient_has_finding_of_pulmonary_edema_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of pulmonary edema.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of pulmonary edema.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of pulmonary edema.","meaning":"Boolean indicating whether the patient currently has pulmonary edema."} // "pulmonary edema"
(declare-const patient_has_finding_of_angina_pectoris_now@@associated_to_murmur_of_mitral_regurgitation Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has angina pectoris and the angina is associated to murmur of mitral regurgitation.","when_to_set_to_false":"Set to false if the patient currently has angina pectoris and the angina is not associated to murmur of mitral regurgitation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the angina is associated to murmur of mitral regurgitation.","meaning":"Boolean indicating whether the patient currently has angina pectoris associated to murmur of mitral regurgitation."} // "angina associated to murmur of mitral regurgitation"
(declare-const patient_has_finding_of_angina_pectoris_now@@associated_with_heart_sound_to_cardiac_auscultation Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has angina pectoris and the angina is associated with heart sound to cardiac auscultation.","when_to_set_to_false":"Set to false if the patient currently has angina pectoris and the angina is not associated with heart sound to cardiac auscultation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the angina is associated with heart sound to cardiac auscultation.","meaning":"Boolean indicating whether the patient currently has angina pectoris associated with heart sound to cardiac auscultation."} // "angina with heart sound to cardiac auscultation"
(declare-const patient_has_finding_of_angina_pectoris_now@@associated_with_throes Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has angina pectoris and the angina is associated with throes.","when_to_set_to_false":"Set to false if the patient currently has angina pectoris and the angina is not associated with throes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the angina is associated with throes.","meaning":"Boolean indicating whether the patient currently has angina pectoris associated with throes."} // "angina with throes"
(declare-const patient_has_finding_of_angina_pectoris_now@@associated_with_hypotension Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has angina pectoris and the angina is associated with hypotension.","when_to_set_to_false":"Set to false if the patient currently has angina pectoris and the angina is not associated with hypotension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the angina is associated with hypotension.","meaning":"Boolean indicating whether the patient currently has angina pectoris associated with hypotension."} // "angina with hypotension"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_finding_of_angina_pectoris_now@@unstable
         patient_has_finding_of_angina_pectoris_now)
     :named REQ5_AUXILIARY0)) ;; "unstable angina" implies "angina"

(assert
  (! (=> patient_has_finding_of_angina_pectoris_now@@meets_instability_criteria
         patient_has_finding_of_angina_pectoris_now)
     :named REQ5_AUXILIARY1)) ;; "angina pectoris with instability criteria" implies "angina pectoris"

(assert
  (! (=> patient_has_finding_of_dynamic_t_wave_alteration_now@@resolved_at_least_partially_when_symptoms_are_relieved
         patient_has_finding_of_dynamic_t_wave_alteration_now)
     :named REQ5_AUXILIARY2)) ;; "T-wave inversions resolved at least partially when symptoms are relieved" implies "dynamic T-wave alteration"

(assert
  (! (=> patient_has_finding_of_uneven_st_segment_depression_in_transitional_way_under_continuous_ecg_leads_now@@lead_v1_plus_v2_or_v3_plus_v4_or_v5_plus_v6_or_lead_i_plus_avl_or_lead_ii_plus_lead_iii_plus_avf
         patient_has_finding_of_uneven_st_segment_depression_in_transitional_way_under_continuous_ecg_leads_now)
     :named REQ5_AUXILIARY3)) ;; "uneven ST-segment depression in specified leads" implies "uneven ST-segment depression in transitional way under continuous ECG leads"

(assert
  (! (=> patient_has_finding_of_uneven_st_segment_elevation_in_transitional_way_under_continuous_ecg_leads_now@@lead_v1_plus_v2_or_v3_plus_v4_or_v5_plus_v6_or_lead_i_plus_avl_or_lead_ii_plus_lead_iii_plus_avf
         patient_has_finding_of_uneven_st_segment_elevation_in_transitional_way_under_continuous_ecg_leads_now)
     :named REQ5_AUXILIARY4)) ;; "uneven ST-segment elevation in specified leads" implies "uneven ST-segment elevation in transitional way under continuous ECG leads"

(assert
  (! (=> patient_is_exposed_to_creatine_kinase_now@@altered_with_enzymatic_curve_characterizing_myocardial_injury
         (and patient_is_exposed_to_creatine_kinase_now patient_has_finding_of_injury_of_heart_now))
     :named REQ5_AUXILIARY5)) ;; "creatine kinase altered with enzymatic curve" implies "exposed to creatine kinase" and "myocardial injury"

(assert
  (! (=> patient_is_exposed_to_troponin_i_now@@altered_with_enzymatic_curve_characterizing_myocardial_injury
         (and patient_is_exposed_to_troponin_i_now patient_has_finding_of_injury_of_heart_now))
     :named REQ5_AUXILIARY6)) ;; "troponin I altered with enzymatic curve" implies "exposed to troponin I" and "myocardial injury"

(assert
  (! (=> patient_is_exposed_to_troponin_t_now@@altered_with_enzymatic_curve_characterizing_myocardial_injury
         (and patient_is_exposed_to_troponin_t_now patient_has_finding_of_injury_of_heart_now))
     :named REQ5_AUXILIARY7)) ;; "troponin T altered with enzymatic curve" implies "exposed to troponin T" and "myocardial injury"

;; Instability criteria for unstable angina: at least one of the following
(assert
  (! (= patient_has_finding_of_angina_pectoris_now@@meets_instability_criteria
        (or
          ;; Dynamic T-wave alterations: (ST depression >1mm OR ST elevation >1mm OR T-wave inversions resolved at least partially)
          (or
            (> st_segment_depression_value_recorded_now_withunit_millimeter 1.0)
            (> st_segment_elevation_value_recorded_now_withunit_millimeter 1.0)
            patient_has_finding_of_dynamic_t_wave_alteration_now@@resolved_at_least_partially_when_symptoms_are_relieved)
          ;; Uneven ST-segment depression in transitional way under continuous ECG leads (in specified leads)
          patient_has_finding_of_uneven_st_segment_depression_in_transitional_way_under_continuous_ecg_leads_now@@lead_v1_plus_v2_or_v3_plus_v4_or_v5_plus_v6_or_lead_i_plus_avl_or_lead_ii_plus_lead_iii_plus_avf
          ;; Uneven ST-segment elevation in transitional way under continuous ECG leads (in specified leads)
          patient_has_finding_of_uneven_st_segment_elevation_in_transitional_way_under_continuous_ecg_leads_now@@lead_v1_plus_v2_or_v3_plus_v4_or_v5_plus_v6_or_lead_i_plus_avl_or_lead_ii_plus_lead_iii_plus_avf
          ;; Biochemical alteration on myocardial necrosis markers (creatine kinase, troponin T, troponin I) with enzymatic curve (myocardial injury)
          patient_is_exposed_to_creatine_kinase_now@@altered_with_enzymatic_curve_characterizing_myocardial_injury
          patient_is_exposed_to_troponin_t_now@@altered_with_enzymatic_curve_characterizing_myocardial_injury
          patient_is_exposed_to_troponin_i_now@@altered_with_enzymatic_curve_characterizing_myocardial_injury
          ;; Pulmonary edema
          patient_has_finding_of_pulmonary_edema_now
          ;; Angina associated to murmur of mitral regurgitation
          patient_has_finding_of_angina_pectoris_now@@associated_to_murmur_of_mitral_regurgitation
          ;; Angina with heart sound to cardiac auscultation
          patient_has_finding_of_angina_pectoris_now@@associated_with_heart_sound_to_cardiac_auscultation
          ;; Angina with throes
          patient_has_finding_of_angina_pectoris_now@@associated_with_throes
          ;; Angina with hypotension
          patient_has_finding_of_angina_pectoris_now@@associated_with_hypotension
        ))
     :named REQ5_AUXILIARY8)) ;; "evidence of unstable angina due to at least one of the following criteria"

;; Unstable angina is defined as angina pectoris with instability criteria
(assert
  (! (= patient_has_finding_of_angina_pectoris_now@@unstable
        (and patient_has_finding_of_angina_pectoris_now
             patient_has_finding_of_angina_pectoris_now@@meets_instability_criteria))
     :named REQ5_AUXILIARY9)) ;; "unstable angina" is "angina pectoris" with instability criteria

;; ===================== Constraint Assertions (REQ 5) =====================
;; Inclusion: (evidence of non ST segment elevation MI) OR (evidence of unstable angina due to at least one instability criterion)
(assert
  (! (or patient_has_finding_of_acute_non_st_segment_elevation_myocardial_infarction_now
         patient_has_finding_of_angina_pectoris_now@@unstable)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (evidence of non ST segment elevation myocardial infarction) OR (evidence of unstable angina due to at least one of the following criteria: ... )"
