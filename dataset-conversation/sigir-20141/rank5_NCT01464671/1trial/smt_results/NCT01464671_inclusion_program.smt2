;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as male at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not male at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient's sex is male at the current time."} // "male"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient's sex is female at the current time."} // "female"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 18 years"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: To be included, the patient must be (male OR female).
(assert
  (! (or patient_sex_is_male_now patient_sex_is_female_now)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be (male OR female)."

;; Component 1: To be included, the patient must be aged ≥ 18 years.
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be aged ≥ 18 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_stable_angina_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently presents with stable angina pectoris.","when_to_set_to_false":"Set to false if the patient currently does not present with stable angina pectoris.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently presents with stable angina pectoris.","meaning":"Boolean indicating whether the patient currently presents with stable angina pectoris."} // "stable angina pectoris"
(declare-const patient_has_finding_of_silent_myocardial_ischemia_233823002_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently presents with silent myocardial ischemia.","when_to_set_to_false":"Set to false if the patient currently does not present with silent myocardial ischemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently presents with silent myocardial ischemia.","meaning":"Boolean indicating whether the patient currently presents with silent myocardial ischemia."} // "silent myocardial ischemia"
(declare-const patient_has_finding_of_positive_stress_test_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of a positive stress test.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of a positive stress test.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of a positive stress test.","meaning":"Boolean indicating whether the patient currently has a finding of a positive stress test."} // "positive stress test"
(declare-const patient_has_finding_of_positive_stress_test_now@@without_chest_pain Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current positive stress test occurred without chest pain.","when_to_set_to_false":"Set to false if the patient's current positive stress test did not occur without chest pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current positive stress test occurred without chest pain.","meaning":"Boolean indicating whether the patient's current positive stress test occurred without chest pain."} // "positive stress test without chest pain"
(declare-const patient_has_finding_of_chest_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently presents with chest pain.","when_to_set_to_false":"Set to false if the patient currently does not present with chest pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently presents with chest pain.","meaning":"Boolean indicating whether the patient currently presents with chest pain."} // "chest pain"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable for positive stress test without chest pain implies positive stress test
(assert
  (! (=> patient_has_finding_of_positive_stress_test_now@@without_chest_pain
         patient_has_finding_of_positive_stress_test_now)
     :named REQ1_AUXILIARY0)) ;; "positive stress test without chest pain" implies "positive stress test"

;; Definition: silent myocardial ischemia is defined as positive stress test without chest pain
(assert
  (! (= patient_has_finding_of_silent_myocardial_ischemia_233823002_now
        patient_has_finding_of_positive_stress_test_now@@without_chest_pain)
     :named REQ1_AUXILIARY1)) ;; "silent myocardial ischemia (defined as positive stress test without chest pain)"

;; ===================== Constraint Assertions (REQ 1) =====================
;; To be included, the patient must present with (stable angina pectoris OR silent myocardial ischemia)
(assert
  (! (or patient_has_finding_of_stable_angina_now
         patient_has_finding_of_silent_myocardial_ischemia_233823002_now)
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "must present with (stable angina pectoris OR silent myocardial ischemia (defined as positive stress test without chest pain))"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_will_undergo_coronary_angiography_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is scheduled to undergo coronary angiography in the future.","when_to_set_to_false":"Set to false if the patient is not scheduled to undergo coronary angiography in the future.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is scheduled to undergo coronary angiography in the future.","meaning":"Boolean indicating whether the patient is scheduled to undergo coronary angiography in the future."} // "scheduled for coronary angiography"
(declare-const patient_will_undergo_coronary_angioplasty_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is scheduled to undergo coronary angioplasty in the future.","when_to_set_to_false":"Set to false if the patient is not scheduled to undergo coronary angioplasty in the future.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is scheduled to undergo coronary angioplasty in the future.","meaning":"Boolean indicating whether the patient is scheduled to undergo coronary angioplasty in the future."} // "possible coronary angioplasty"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: To be included, the patient must be scheduled for coronary angiography (with possible coronary angioplasty).
(assert
  (! patient_will_undergo_coronary_angiography_inthefuture
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be scheduled for coronary angiography (with possible coronary angioplasty)."

;; ===================== Declarations for the inclusion criterion (REQ 3) =====================
(declare-const patient_is_able_to_tolerate_dual_antiplatelet_therapy_with_aspirin_and_clopidogrel_for_minimum_duration_30_days Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able to tolerate dual anti-platelet therapy with aspirin and clopidogrel for at least 30 consecutive days.","when_to_set_to_false":"Set to false if the patient is unable to tolerate dual anti-platelet therapy with aspirin and clopidogrel for at least 30 consecutive days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to tolerate dual anti-platelet therapy with aspirin and clopidogrel for at least 30 consecutive days.","meaning":"Boolean indicating whether the patient is able to tolerate dual anti-platelet therapy with aspirin and clopidogrel for a minimum duration of 30 days."} // "the patient must be able to tolerate dual anti-platelet therapy with aspirin and dual anti-platelet therapy with clopidogrel for a minimum of 30 days"
(declare-const patient_is_exposed_to_aspirin_inthepast30days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to aspirin for any duration within the past 30 days.","when_to_set_to_false":"Set to false if the patient has not been exposed to aspirin at all within the past 30 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to aspirin in the past 30 days.","meaning":"Boolean indicating whether the patient has been exposed to aspirin in the past 30 days."} // "aspirin"
(declare-const patient_is_exposed_to_aspirin_inthepast30days@@minimum_duration_30_days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to aspirin for a minimum of 30 consecutive days within the past 30 days.","when_to_set_to_false":"Set to false if the patient has been exposed to aspirin for less than 30 consecutive days within the past 30 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to aspirin for at least 30 consecutive days within the past 30 days.","meaning":"Boolean indicating whether the patient has been exposed to aspirin for at least 30 consecutive days within the past 30 days."} // "aspirin for a minimum of 30 days"
(declare-const patient_is_exposed_to_aspirin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to aspirin (i.e., at the time of percutaneous coronary intervention).","when_to_set_to_false":"Set to false if the patient is not currently exposed to aspirin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to aspirin.","meaning":"Boolean indicating whether the patient is currently exposed to aspirin."} // "must be on aspirin at the time of the percutaneous coronary intervention"
(declare-const patient_is_exposed_to_clopidogrel_inthepast30days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to clopidogrel for any duration within the past 30 days.","when_to_set_to_false":"Set to false if the patient has not been exposed to clopidogrel at all within the past 30 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to clopidogrel in the past 30 days.","meaning":"Boolean indicating whether the patient has been exposed to clopidogrel in the past 30 days."} // "clopidogrel"
(declare-const patient_is_exposed_to_clopidogrel_inthepast30days@@minimum_duration_30_days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to clopidogrel for a minimum of 30 consecutive days within the past 30 days.","when_to_set_to_false":"Set to false if the patient has been exposed to clopidogrel for less than 30 consecutive days within the past 30 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to clopidogrel for at least 30 consecutive days within the past 30 days.","meaning":"Boolean indicating whether the patient has been exposed to clopidogrel for at least 30 consecutive days within the past 30 days."} // "clopidogrel for a minimum of 30 days"
(declare-const patient_is_exposed_to_clopidogrel_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to clopidogrel (i.e., at the time of percutaneous coronary intervention).","when_to_set_to_false":"Set to false if the patient is not currently exposed to clopidogrel.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to clopidogrel.","meaning":"Boolean indicating whether the patient is currently exposed to clopidogrel."} // "must be on clopidogrel at the time of the percutaneous coronary intervention"
(declare-const patient_is_exposed_to_clopidogrel_now@@temporalcontext_within30minutes_after_percutaneous_coronary_intervention Bool) ;; {"when_to_set_to_true":"Set to true if the patient is exposed to clopidogrel during or within 30 minutes after percutaneous coronary intervention.","when_to_set_to_false":"Set to false if the patient is not exposed to clopidogrel during or within 30 minutes after percutaneous coronary intervention.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is exposed to clopidogrel during or within 30 minutes after percutaneous coronary intervention.","meaning":"Boolean indicating whether the patient is exposed to clopidogrel during or within 30 minutes after percutaneous coronary intervention."} // "clopidogrel may be administered during percutaneous coronary intervention or within 30 minutes post percutaneous coronary intervention"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable for aspirin exposure implies base variable
(assert
  (! (=> patient_is_exposed_to_aspirin_inthepast30days@@minimum_duration_30_days
         patient_is_exposed_to_aspirin_inthepast30days)
     :named REQ3_AUXILIARY0)) ;; "aspirin for a minimum of 30 days"

;; Qualifier variable for clopidogrel exposure implies base variable
(assert
  (! (=> patient_is_exposed_to_clopidogrel_inthepast30days@@minimum_duration_30_days
         patient_is_exposed_to_clopidogrel_inthepast30days)
     :named REQ3_AUXILIARY1)) ;; "clopidogrel for a minimum of 30 days"

;; Qualifier variable for clopidogrel exposure at/after PCI implies base variable
(assert
  (! (=> patient_is_exposed_to_clopidogrel_now@@temporalcontext_within30minutes_after_percutaneous_coronary_intervention
         patient_is_exposed_to_clopidogrel_now)
     :named REQ3_AUXILIARY2)) ;; "clopidogrel may be administered during percutaneous coronary intervention or within 30 minutes post percutaneous coronary intervention"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: Patient must be able to tolerate dual anti-platelet therapy with aspirin and clopidogrel for a minimum of 30 days
(assert
  (! patient_is_able_to_tolerate_dual_antiplatelet_therapy_with_aspirin_and_clopidogrel_for_minimum_duration_30_days
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must be able to tolerate dual anti-platelet therapy with aspirin and dual anti-platelet therapy with clopidogrel for a minimum of 30 days"

;; Component 1: Patient must be on aspirin at the time of the percutaneous coronary intervention
(assert
  (! patient_is_exposed_to_aspirin_now
     :named REQ3_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "must be on aspirin at the time of the percutaneous coronary intervention"

;; Component 2: Patient must be on clopidogrel at the time of the percutaneous coronary intervention (may be administered during or within 30 minutes post PCI)
(assert
  (! (or patient_is_exposed_to_clopidogrel_now
         patient_is_exposed_to_clopidogrel_now@@temporalcontext_within30minutes_after_percutaneous_coronary_intervention)
     :named REQ3_COMPONENT2_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "must be on clopidogrel at the time of the percutaneous coronary intervention (clopidogrel may be administered during percutaneous coronary intervention or within 30 minutes post percutaneous coronary intervention)"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_is_able_and_willing_to_conform_to_study_requirements Bool) ;; {"when_to_set_to_true":"Set to true if the patient is both able and willing to conform to all requirements of the study.","when_to_set_to_false":"Set to false if the patient is not able or not willing to conform to all requirements of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able and willing to conform to the requirements of the study.","meaning":"Boolean indicating whether the patient is both able and willing to conform to the requirements of the study."} // "be able and willing to conform to the requirements of the study"
(declare-const patient_has_voluntarily_signed_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has voluntarily signed an informed consent document.","when_to_set_to_false":"Set to false if the patient has not voluntarily signed an informed consent document.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has voluntarily signed an informed consent document.","meaning":"Boolean indicating whether the patient has voluntarily signed an informed consent document."} // "voluntarily sign an informed consent"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: Patient must be able and willing to conform to the requirements of the study
(assert
  (! patient_is_able_and_willing_to_conform_to_study_requirements
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "be able and willing to conform to the requirements of the study"

;; Component 1: Patient must voluntarily sign an informed consent
(assert
  (! patient_has_voluntarily_signed_informed_consent
     :named REQ4_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "voluntarily sign an informed consent"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_finding_of_condition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any form of condition.","when_to_set_to_false":"Set to false if the patient currently does not have any form of condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any form of condition.","meaning":"Boolean indicating whether the patient currently has any form of condition."} // "any form of condition"
(declare-const patient_has_finding_of_condition_now@@impairs_study_results_investigator_opinion Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any form of condition and, in the investigator's opinion, this condition would impair the results of the study.","when_to_set_to_false":"Set to false if the patient currently has any form of condition and, in the investigator's opinion, this condition would not impair the results of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the investigator believes the condition would impair study results.","meaning":"Boolean indicating whether the patient's current condition is judged by the investigator to impair study results."} // "any form of condition that, in the investigator's opinion, would impair the results of the study"
(declare-const patient_has_finding_of_illness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any form of illness.","when_to_set_to_false":"Set to false if the patient currently does not have any form of illness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any form of illness.","meaning":"Boolean indicating whether the patient currently has any form of illness."} // "any form of illness"
(declare-const patient_has_finding_of_illness_now@@impairs_study_results_investigator_opinion Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any form of illness and, in the investigator's opinion, this illness would impair the results of the study.","when_to_set_to_false":"Set to false if the patient currently has any form of illness and, in the investigator's opinion, this illness would not impair the results of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the investigator believes the illness would impair study results.","meaning":"Boolean indicating whether the patient's current illness is judged by the investigator to impair study results."} // "any form of illness that, in the investigator's opinion, would impair the results of the study"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_finding_of_condition_now@@impairs_study_results_investigator_opinion
         patient_has_finding_of_condition_now)
     :named REQ5_AUXILIARY0)) ;; "any form of condition that, in the investigator's opinion, would impair the results of the study"

(assert
  (! (=> patient_has_finding_of_illness_now@@impairs_study_results_investigator_opinion
         patient_has_finding_of_illness_now)
     :named REQ5_AUXILIARY1)) ;; "any form of illness that, in the investigator's opinion, would impair the results of the study"

;; Umbrella term: "any form of illness OR any form of condition" (non-exhaustive, ambiguous context, default to non-exhaustive)
(assert
  (! (=> (or patient_has_finding_of_illness_now patient_has_finding_of_condition_now)
         (or patient_has_finding_of_illness_now patient_has_finding_of_condition_now))
     :named REQ5_AUXILIARY2)) ;; "any form of illness OR any form of condition"

;; ===================== Constraint Assertions (REQ 5) =====================
;; The patient must NOT present with (any form of illness OR any form of condition) that, in the investigator's opinion, would impair the results of the study.
(assert
  (! (not (or patient_has_finding_of_illness_now@@impairs_study_results_investigator_opinion
              patient_has_finding_of_condition_now@@impairs_study_results_investigator_opinion))
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "must NOT present with (any form of illness OR any form of condition) that, in the investigator's opinion, would impair the results of the study"

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently capable of becoming pregnant (i.e., has childbearing potential).","when_to_set_to_false":"Set to false if the patient is currently not capable of becoming pregnant (e.g., postmenopausal, surgically sterile, or other reasons for lack of childbearing potential).","when_to_set_to_null":"Set to null if the patient's childbearing potential status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient currently has childbearing potential."} // "woman of child bearing potential"
(declare-const patient_is_pregnant_inthepast1days Bool) ;; {"when_to_set_to_true":"Set to true if the patient was found to be pregnant by urine pregnancy test within 1 day prior to enrollment.","when_to_set_to_false":"Set to false if the patient was found not to be pregnant by urine pregnancy test within 1 day prior to enrollment.","when_to_set_to_null":"Set to null if the urine pregnancy test result within 1 day prior to enrollment is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient was pregnant within 1 day prior to enrollment, as determined by a urine pregnancy test."} // "negative urine pregnancy test prior to enrollment"
(declare-const patient_is_pregnant_inthepast1days_by_serum_pregnancy_test Bool) ;; {"when_to_set_to_true":"Set to true if the patient was found to be pregnant by serum pregnancy test within 1 day prior to enrollment.","when_to_set_to_false":"Set to false if the patient was found not to be pregnant by serum pregnancy test within 1 day prior to enrollment.","when_to_set_to_null":"Set to null if the serum pregnancy test result within 1 day prior to enrollment is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient was pregnant within 1 day prior to enrollment, as determined by a serum pregnancy test."} // "negative serum pregnancy test prior to enrollment"

;; ===================== Constraint Assertions (REQ 6) =====================
;; If the patient is a woman of childbearing potential, she must have a negative urine OR negative serum pregnancy test prior to enrollment
(assert
  (! (or (not (and patient_sex_is_female_now patient_has_childbearing_potential_now))
         (or (not patient_is_pregnant_inthepast1days)
             (not patient_is_pregnant_inthepast1days_by_serum_pregnancy_test)))
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "if the patient is a woman of child bearing potential, the patient must have (a negative urine pregnancy test prior to enrollment OR a negative serum pregnancy test prior to enrollment)"
