;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 18 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be aged ≥ 18 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_lyme_immunoblot_negative_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently seronegative for antibodies against Borrelia burgdorferi antigens.","when_to_set_to_false":"Set to false if the patient is currently not seronegative for antibodies against Borrelia burgdorferi antigens.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently seronegative for antibodies against Borrelia burgdorferi antigens.","meaning":"Boolean indicating whether the patient is currently seronegative for antibodies against Borrelia burgdorferi antigens."} // "seronegative for antibodies against Borrelia burgdorferi antigens"
(declare-const patient_has_finding_of_lyme_immunoblot_negative_now@@determined_by_western_blot Bool) ;; {"when_to_set_to_true":"Set to true if the patient's seronegativity for antibodies against Borrelia burgdorferi antigens is determined by Western blot.","when_to_set_to_false":"Set to false if the patient's seronegativity for antibodies against Borrelia burgdorferi antigens is not determined by Western blot.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether Western blot was used to determine seronegativity.","meaning":"Boolean indicating whether the seronegativity finding is determined by Western blot."} // "by Western blot"
(declare-const patient_has_finding_of_lyme_immunoblot_negative_now@@present_at_enrollment Bool) ;; {"when_to_set_to_true":"Set to true if the patient's seronegativity for antibodies against Borrelia burgdorferi antigens is present at the time of enrollment.","when_to_set_to_false":"Set to false if the patient's seronegativity for antibodies against Borrelia burgdorferi antigens is not present at the time of enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the seronegativity finding is present at enrollment.","meaning":"Boolean indicating whether the seronegativity finding is present at enrollment."} // "at enrollment"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_lyme_immunoblot_negative_now@@determined_by_western_blot
         patient_has_finding_of_lyme_immunoblot_negative_now)
     :named REQ1_AUXILIARY0)) ;; "seronegativity determined by Western blot"

;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_lyme_immunoblot_negative_now@@present_at_enrollment
         patient_has_finding_of_lyme_immunoblot_negative_now)
     :named REQ1_AUXILIARY1)) ;; "seronegativity present at enrollment"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: patient must be seronegative for antibodies against Borrelia burgdorferi antigens by Western blot at enrollment
(assert
  (! (and patient_has_finding_of_lyme_immunoblot_negative_now@@determined_by_western_blot
          patient_has_finding_of_lyme_immunoblot_negative_now@@present_at_enrollment)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "seronegative for antibodies against Borrelia burgdorferi antigens by Western blot at enrollment"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_acute_lyme_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of acute Lyme disease.","when_to_set_to_false":"Set to false if the patient does not have a history of acute Lyme disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of acute Lyme disease.","meaning":"Boolean indicating whether the patient has a history of acute Lyme disease."} // "a history of acute Lyme disease"
(declare-const patient_has_finding_of_acute_lyme_disease_inthehistory@@documented Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of acute Lyme disease is documented in the medical record.","when_to_set_to_false":"Set to false if the patient's history of acute Lyme disease is not documented in the medical record.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of acute Lyme disease is documented.","meaning":"Boolean indicating whether the patient's history of acute Lyme disease is documented."} // "documented history of acute Lyme disease"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_acute_lyme_disease_inthehistory@@documented
         patient_has_finding_of_acute_lyme_disease_inthehistory)
     :named REQ2_AUXILIARY0)) ;; "documented history of acute Lyme disease" means history of acute Lyme disease is present

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_finding_of_acute_lyme_disease_inthehistory@@documented
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a documented history of acute Lyme disease."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_finding_of_erythema_chronica_migrans_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of erythema migrans (bullseye rash).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of erythema migrans (bullseye rash).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has erythema migrans.","meaning":"Boolean indicating whether the patient currently has erythema migrans (bullseye rash)."} // "a rash (erythema migrans) that resembles a bullseye"
(declare-const patient_has_finding_of_erythema_chronica_migrans_now@@occurs_after_tick_bite Bool) ;; {"when_to_set_to_true":"Set to true if the patient's erythema migrans (bullseye rash) occurs after a tick bite.","when_to_set_to_false":"Set to false if the patient's erythema migrans does not occur after a tick bite.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the erythema migrans occurs after a tick bite.","meaning":"Boolean indicating whether the patient's erythema migrans occurs after a tick bite."} // "that usually occurs after a tick bite"
(declare-const patient_has_finding_of_erythema_chronica_migrans_now@@occurs_in_late_spring_summer_or_early_fall Bool) ;; {"when_to_set_to_true":"Set to true if the patient's erythema migrans (bullseye rash) occurs in late spring, summer, or early fall.","when_to_set_to_false":"Set to false if the patient's erythema migrans does not occur in late spring, summer, or early fall.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the erythema migrans occurs in late spring, summer, or early fall.","meaning":"Boolean indicating whether the patient's erythema migrans occurs in late spring, summer, or early fall."} // "in late spring OR summer OR early fall"
(declare-const patient_has_finding_of_erythema_chronica_migrans_now@@accompanied_by_fatigue_fever_headache_mild_stiff_neck_arthralgia_or_myalgia Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has erythema migrans (bullseye rash) and the rash is sometimes accompanied by at least one of the following: fatigue, fever, headache, mild stiff neck, arthralgia, or myalgia.","when_to_set_to_false":"Set to false if the patient currently has erythema migrans (bullseye rash) and the rash is not accompanied by any of the following: fatigue, fever, headache, mild stiff neck, arthralgia, or myalgia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's erythema migrans is accompanied by any of the following: fatigue, fever, headache, mild stiff neck, arthralgia, or myalgia.","meaning":"Boolean indicating whether the patient's erythema migrans is sometimes accompanied by fatigue, fever, headache, mild stiff neck, arthralgia, or myalgia."} // "sometimes accompanied by (fatigue OR fever OR headache OR mild stiff neck OR arthralgia OR myalgia)"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_finding_of_erythema_chronica_migrans_now@@occurs_after_tick_bite
         patient_has_finding_of_erythema_chronica_migrans_now)
     :named REQ3_AUXILIARY0)) ;; "that usually occurs after a tick bite"

(assert
  (! (=> patient_has_finding_of_erythema_chronica_migrans_now@@occurs_in_late_spring_summer_or_early_fall
         patient_has_finding_of_erythema_chronica_migrans_now)
     :named REQ3_AUXILIARY1)) ;; "in late spring OR summer OR early fall"

(assert
  (! (=> patient_has_finding_of_erythema_chronica_migrans_now@@accompanied_by_fatigue_fever_headache_mild_stiff_neck_arthralgia_or_myalgia
         patient_has_finding_of_erythema_chronica_migrans_now)
     :named REQ3_AUXILIARY2)) ;; "sometimes accompanied by (fatigue OR fever OR headache OR mild stiff neck OR arthralgia OR myalgia)"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: All required features must be present for inclusion
(assert
  (! (and patient_has_finding_of_erythema_chronica_migrans_now
          patient_has_finding_of_erythema_chronica_migrans_now@@occurs_after_tick_bite
          patient_has_finding_of_erythema_chronica_migrans_now@@occurs_in_late_spring_summer_or_early_fall
          patient_has_finding_of_erythema_chronica_migrans_now@@accompanied_by_fatigue_fever_headache_mild_stiff_neck_arthralgia_or_myalgia)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "a rash (erythema migrans) that resembles a bullseye AND that usually occurs after a tick bite in late spring OR summer OR early fall AND that is sometimes accompanied by (fatigue OR fever OR headache OR mild stiff neck OR arthralgia OR myalgia)"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_finding_of_clinical_feature_typical_of_lyme_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has at least one clinical feature typical of Lyme disease.","when_to_set_to_false":"Set to false if the patient currently does not have any clinical feature typical of Lyme disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any clinical feature typical of Lyme disease.","meaning":"Boolean indicating whether the patient currently has at least one clinical feature typical of Lyme disease."} // "at least one clinical feature typical of Lyme disease"
(declare-const patient_has_finding_of_clinical_feature_typical_of_lyme_disease_now@@acquired_in_the_united_states Bool) ;; {"when_to_set_to_true":"Set to true if the patient's clinical feature typical of Lyme disease was acquired in the United States.","when_to_set_to_false":"Set to false if the patient's clinical feature typical of Lyme disease was not acquired in the United States.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's clinical feature typical of Lyme disease was acquired in the United States.","meaning":"Boolean indicating whether the patient's clinical feature typical of Lyme disease was acquired in the United States."} // "acquired in the United States"
(declare-const patient_has_finding_of_lyme_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of Lyme disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of Lyme disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of Lyme disease.","meaning":"Boolean indicating whether the patient currently has Lyme disease."} // "Lyme disease"
(declare-const patient_has_finding_of_lyme_disease_now@@acquired_in_the_united_states Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current Lyme disease was acquired in the United States.","when_to_set_to_false":"Set to false if the patient's current Lyme disease was not acquired in the United States.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current Lyme disease was acquired in the United States.","meaning":"Boolean indicating whether the patient's current Lyme disease was acquired in the United States."} // "Lyme disease acquired in the United States"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_clinical_feature_typical_of_lyme_disease_now@@acquired_in_the_united_states
         patient_has_finding_of_clinical_feature_typical_of_lyme_disease_now)
     :named REQ4_AUXILIARY0)) ;; "clinical feature typical of Lyme disease acquired in the United States"

;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_lyme_disease_now@@acquired_in_the_united_states
         patient_has_finding_of_lyme_disease_now)
     :named REQ4_AUXILIARY1)) ;; "Lyme disease acquired in the United States"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: Must have at least one clinical feature typical of Lyme disease acquired in the United States
(assert
  (! patient_has_finding_of_clinical_feature_typical_of_lyme_disease_now@@acquired_in_the_united_states
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "at least one clinical feature typical of Lyme disease acquired in the United States"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_finding_of_musculoskeletal_pain_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had musculoskeletal pain at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had musculoskeletal pain in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had musculoskeletal pain in the past.","meaning":"Boolean indicating whether the patient has had musculoskeletal pain at any time in the past."} // "widespread musculoskeletal pain"
(declare-const patient_has_finding_of_musculoskeletal_pain_inthehistory@@widespread Bool) ;; {"when_to_set_to_true":"Set to true if the musculoskeletal pain is widespread.","when_to_set_to_false":"Set to false if the musculoskeletal pain is not widespread.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the musculoskeletal pain is widespread.","meaning":"Boolean indicating whether the musculoskeletal pain is widespread."} // "widespread musculoskeletal pain"
(declare-const patient_has_finding_of_musculoskeletal_pain_inthehistory@@duration_at_least_6_months_and_less_than_12_years Bool) ;; {"when_to_set_to_true":"Set to true if the musculoskeletal pain has persisted for at least 6 months and less than 12 years.","when_to_set_to_false":"Set to false if the musculoskeletal pain has persisted for less than 6 months or 12 years or more.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined how long the musculoskeletal pain has persisted.","meaning":"Boolean indicating whether the musculoskeletal pain has persisted for at least 6 months and less than 12 years."} // "duration ≥ 6 months AND duration < 12 years"
(declare-const patient_has_finding_of_musculoskeletal_pain_inthehistory@@not_attributable_to_another_cause_or_condition Bool) ;; {"when_to_set_to_true":"Set to true if the musculoskeletal pain is not attributable to another cause or condition.","when_to_set_to_false":"Set to false if the musculoskeletal pain is attributable to another cause or condition.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the musculoskeletal pain is attributable to another cause or condition.","meaning":"Boolean indicating whether the musculoskeletal pain is not attributable to another cause or condition."} // "not attributable to another cause or condition"

(declare-const patient_has_finding_of_fatigue_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had fatigue at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had fatigue in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had fatigue in the past.","meaning":"Boolean indicating whether the patient has had fatigue at any time in the past."} // "widespread fatigue"
(declare-const patient_has_finding_of_fatigue_inthehistory@@widespread Bool) ;; {"when_to_set_to_true":"Set to true if the fatigue is widespread.","when_to_set_to_false":"Set to false if the fatigue is not widespread.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the fatigue is widespread.","meaning":"Boolean indicating whether the fatigue is widespread."} // "widespread fatigue"
(declare-const patient_has_finding_of_fatigue_inthehistory@@began_coincident_with_or_within_6_months_following_initial_infection_with_borrelia_burgdorferi Bool) ;; {"when_to_set_to_true":"Set to true if the fatigue began coincident with or within 6 months following initial infection with Borrelia burgdorferi.","when_to_set_to_false":"Set to false if the fatigue did not begin coincident with or within 6 months following initial infection with Borrelia burgdorferi.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined when the fatigue began relative to initial infection with Borrelia burgdorferi.","meaning":"Boolean indicating whether the fatigue began coincident with or within 6 months following initial infection with Borrelia burgdorferi."} // "fatigue that began coincident with OR within 6 months following initial infection with Borrelia burgdorferi"
(declare-const patient_has_finding_of_fatigue_inthehistory@@duration_at_least_6_months_and_less_than_12_years Bool) ;; {"when_to_set_to_true":"Set to true if the fatigue has persisted for at least 6 months and less than 12 years.","when_to_set_to_false":"Set to false if the fatigue has persisted for less than 6 months or 12 years or more.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined how long the fatigue has persisted.","meaning":"Boolean indicating whether the fatigue has persisted for at least 6 months and less than 12 years."} // "duration ≥ 6 months AND duration < 12 years"
(declare-const patient_has_finding_of_fatigue_inthehistory@@not_attributable_to_another_cause_or_condition Bool) ;; {"when_to_set_to_true":"Set to true if the fatigue is not attributable to another cause or condition.","when_to_set_to_false":"Set to false if the fatigue is attributable to another cause or condition.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the fatigue is attributable to another cause or condition.","meaning":"Boolean indicating whether the fatigue is not attributable to another cause or condition."} // "not attributable to another cause or condition"

(declare-const patient_has_finding_of_neurological_symptom_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had neurologic symptoms at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had neurologic symptoms in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had neurologic symptoms in the past.","meaning":"Boolean indicating whether the patient has had neurologic symptoms at any time in the past."} // "neurologic symptoms"
(declare-const patient_has_finding_of_neurological_symptom_inthehistory@@began_within_6_months_following_initial_infection_with_borrelia_burgdorferi Bool) ;; {"when_to_set_to_true":"Set to true if the neurologic symptoms began within 6 months following initial infection with Borrelia burgdorferi.","when_to_set_to_false":"Set to false if the neurologic symptoms did not begin within 6 months following initial infection with Borrelia burgdorferi.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined when the neurologic symptoms began relative to initial infection with Borrelia burgdorferi.","meaning":"Boolean indicating whether the neurologic symptoms began within 6 months following initial infection with Borrelia burgdorferi."} // "neurologic symptoms ... beginning within 6 months following initial infection with Borrelia burgdorferi"
(declare-const patient_has_finding_of_neurological_symptom_inthehistory@@duration_at_least_6_months_and_less_than_12_years Bool) ;; {"when_to_set_to_true":"Set to true if the neurologic symptoms have persisted for at least 6 months and less than 12 years.","when_to_set_to_false":"Set to false if the neurologic symptoms have persisted for less than 6 months or 12 years or more.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined how long the neurologic symptoms have persisted.","meaning":"Boolean indicating whether the neurologic symptoms have persisted for at least 6 months and less than 12 years."} // "duration ≥ 6 months AND duration < 12 years"
(declare-const patient_has_finding_of_neurological_symptom_inthehistory@@not_attributable_to_another_cause_or_condition Bool) ;; {"when_to_set_to_true":"Set to true if the neurologic symptoms are not attributable to another cause or condition.","when_to_set_to_false":"Set to false if the neurologic symptoms are attributable to another cause or condition.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the neurologic symptoms are attributable to another cause or condition.","meaning":"Boolean indicating whether the neurologic symptoms are not attributable to another cause or condition."} // "not attributable to another cause or condition"

(declare-const patient_has_finding_of_memory_impairment_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had memory impairment at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had memory impairment in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had memory impairment in the past.","meaning":"Boolean indicating whether the patient has had memory impairment at any time in the past."} // "memory impairment"
(declare-const patient_has_finding_of_memory_impairment_inthehistory@@began_within_6_months_following_initial_infection_with_borrelia_burgdorferi Bool) ;; {"when_to_set_to_true":"Set to true if the memory impairment began within 6 months following initial infection with Borrelia burgdorferi.","when_to_set_to_false":"Set to false if the memory impairment did not begin within 6 months following initial infection with Borrelia burgdorferi.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined when the memory impairment began relative to initial infection with Borrelia burgdorferi.","meaning":"Boolean indicating whether the memory impairment began within 6 months following initial infection with Borrelia burgdorferi."} // "memory impairment ... beginning within 6 months following initial infection with Borrelia burgdorferi"
(declare-const patient_has_finding_of_memory_impairment_inthehistory@@duration_at_least_6_months_and_less_than_12_years Bool) ;; {"when_to_set_to_true":"Set to true if the memory impairment has persisted for at least 6 months and less than 12 years.","when_to_set_to_false":"Set to false if the memory impairment has persisted for less than 6 months or 12 years or more.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined how long the memory impairment has persisted.","meaning":"Boolean indicating whether the memory impairment has persisted for at least 6 months and less than 12 years."} // "duration ≥ 6 months AND duration < 12 years"
(declare-const patient_has_finding_of_memory_impairment_inthehistory@@not_attributable_to_another_cause_or_condition Bool) ;; {"when_to_set_to_true":"Set to true if the memory impairment is not attributable to another cause or condition.","when_to_set_to_false":"Set to false if the memory impairment is attributable to another cause or condition.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the memory impairment is attributable to another cause or condition.","meaning":"Boolean indicating whether the memory impairment is not attributable to another cause or condition."} // "not attributable to another cause or condition"

(declare-const patient_has_finding_of_neuralgia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had nerve pain at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had nerve pain in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had nerve pain in the past.","meaning":"Boolean indicating whether the patient has had nerve pain at any time in the past."} // "nerve pain"
(declare-const patient_has_finding_of_neuralgia_inthehistory@@began_within_6_months_following_initial_infection_with_borrelia_burgdorferi Bool) ;; {"when_to_set_to_true":"Set to true if the nerve pain began within 6 months following initial infection with Borrelia burgdorferi.","when_to_set_to_false":"Set to false if the nerve pain did not begin within 6 months following initial infection with Borrelia burgdorferi.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined when the nerve pain began relative to initial infection with Borrelia burgdorferi.","meaning":"Boolean indicating whether the nerve pain began within 6 months following initial infection with Borrelia burgdorferi."} // "nerve pain ... beginning within 6 months following initial infection with Borrelia burgdorferi"
(declare-const patient_has_finding_of_neuralgia_inthehistory@@not_attributable_to_another_cause_or_condition Bool) ;; {"when_to_set_to_true":"Set to true if the nerve pain is not attributable to another cause or condition.","when_to_set_to_false":"Set to false if the nerve pain is attributable to another cause or condition.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the nerve pain is attributable to another cause or condition.","meaning":"Boolean indicating whether the nerve pain is not attributable to another cause or condition."} // "not attributable to another cause or condition"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Non-exhaustive examples: memory impairment and nerve pain are examples of neurologic symptoms
(assert
  (! (=> (or patient_has_finding_of_memory_impairment_inthehistory
            patient_has_finding_of_neuralgia_inthehistory)
         patient_has_finding_of_neurological_symptom_inthehistory)
     :named REQ5_AUXILIARY0)) ;; "neurologic symptoms with non-exhaustive examples (memory impairment OR nerve pain)"

;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_finding_of_musculoskeletal_pain_inthehistory@@widespread
         patient_has_finding_of_musculoskeletal_pain_inthehistory)
     :named REQ5_AUXILIARY1)) ;; "widespread musculoskeletal pain"

(assert
  (! (=> patient_has_finding_of_fatigue_inthehistory@@widespread
         patient_has_finding_of_fatigue_inthehistory)
     :named REQ5_AUXILIARY2)) ;; "widespread fatigue"

(assert
  (! (=> patient_has_finding_of_fatigue_inthehistory@@began_coincident_with_or_within_6_months_following_initial_infection_with_borrelia_burgdorferi
         patient_has_finding_of_fatigue_inthehistory)
     :named REQ5_AUXILIARY3)) ;; "fatigue that began coincident with OR within 6 months following initial infection with Borrelia burgdorferi"

(assert
  (! (=> patient_has_finding_of_memory_impairment_inthehistory@@began_within_6_months_following_initial_infection_with_borrelia_burgdorferi
         patient_has_finding_of_memory_impairment_inthehistory)
     :named REQ5_AUXILIARY4)) ;; "memory impairment ... beginning within 6 months following initial infection with Borrelia burgdorferi"

(assert
  (! (=> patient_has_finding_of_neuralgia_inthehistory@@began_within_6_months_following_initial_infection_with_borrelia_burgdorferi
         patient_has_finding_of_neuralgia_inthehistory)
     :named REQ5_AUXILIARY5)) ;; "nerve pain ... beginning within 6 months following initial infection with Borrelia burgdorferi"

(assert
  (! (=> patient_has_finding_of_neurological_symptom_inthehistory@@began_within_6_months_following_initial_infection_with_borrelia_burgdorferi
         patient_has_finding_of_neurological_symptom_inthehistory)
     :named REQ5_AUXILIARY6)) ;; "neurologic symptoms ... beginning within 6 months following initial infection with Borrelia burgdorferi"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Component 0: At least one of the following (A or B) must be true, and all required qualifiers must be satisfied:
;; (A) widespread musculoskeletal pain AND widespread fatigue that began coincident with OR within 6 months following initial infection with Borrelia burgdorferi
;; (B) neurologic symptoms (including memory impairment OR nerve pain) beginning within 6 months following initial infection with Borrelia burgdorferi
;; For each, duration and not attributable qualifiers must be satisfied.

(assert
  (!
    (or
      ;; (A) musculoskeletal pain + fatigue arm
      (and patient_has_finding_of_musculoskeletal_pain_inthehistory
           patient_has_finding_of_musculoskeletal_pain_inthehistory@@widespread
           patient_has_finding_of_musculoskeletal_pain_inthehistory@@duration_at_least_6_months_and_less_than_12_years
           patient_has_finding_of_musculoskeletal_pain_inthehistory@@not_attributable_to_another_cause_or_condition

           patient_has_finding_of_fatigue_inthehistory
           patient_has_finding_of_fatigue_inthehistory@@widespread
           patient_has_finding_of_fatigue_inthehistory@@began_coincident_with_or_within_6_months_following_initial_infection_with_borrelia_burgdorferi
           patient_has_finding_of_fatigue_inthehistory@@duration_at_least_6_months_and_less_than_12_years
           patient_has_finding_of_fatigue_inthehistory@@not_attributable_to_another_cause_or_condition)

      ;; (B) neurologic symptoms arm
      (and patient_has_finding_of_neurological_symptom_inthehistory
           patient_has_finding_of_neurological_symptom_inthehistory@@began_within_6_months_following_initial_infection_with_borrelia_burgdorferi
           patient_has_finding_of_neurological_symptom_inthehistory@@duration_at_least_6_months_and_less_than_12_years
           patient_has_finding_of_neurological_symptom_inthehistory@@not_attributable_to_another_cause_or_condition)
    )
    :named REQ5_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE))

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_has_undergone_antibiotic_therapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone antibiotic therapy at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone antibiotic therapy at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone antibiotic therapy.","meaning":"Boolean indicating whether the patient has ever undergone antibiotic therapy at any time in the past."} // "prior antibiotic treatment"
(declare-const patient_has_undergone_antibiotic_therapy_inthehistory@@physician_documented Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of antibiotic therapy is documented by a physician.","when_to_set_to_false":"Set to false if the patient's history of antibiotic therapy is not documented by a physician.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the antibiotic therapy is physician-documented.","meaning":"Boolean indicating whether the patient's history of antibiotic therapy is physician-documented."} // "physician-documented history"
(declare-const patient_has_undergone_antibiotic_therapy_inthehistory@@with_currently_recommended_antibiotic_regimen Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of antibiotic therapy was with a currently recommended antibiotic regimen.","when_to_set_to_false":"Set to false if the patient's history of antibiotic therapy was not with a currently recommended antibiotic regimen.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the antibiotic therapy was with a currently recommended regimen.","meaning":"Boolean indicating whether the patient's history of antibiotic therapy was with a currently recommended antibiotic regimen."} // "with a currently recommended antibiotic regimen"
(declare-const patient_has_undergone_antibiotic_therapy_inthehistory@@physician_documented@@with_currently_recommended_antibiotic_regimen Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a physician-documented history of prior antibiotic therapy with a currently recommended antibiotic regimen.","when_to_set_to_false":"Set to false if the patient does not have a physician-documented history of prior antibiotic therapy with a currently recommended antibiotic regimen.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a physician-documented history of prior antibiotic therapy with a currently recommended antibiotic regimen.","meaning":"Boolean indicating whether the patient has a physician-documented history of prior antibiotic therapy with a currently recommended antibiotic regimen."} // "physician-documented history of prior antibiotic treatment with a currently recommended antibiotic regimen"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_undergone_antibiotic_therapy_inthehistory@@physician_documented
         patient_has_undergone_antibiotic_therapy_inthehistory)
     :named REQ6_AUXILIARY0)) ;; "physician-documented history of prior antibiotic treatment"

(assert
  (! (=> patient_has_undergone_antibiotic_therapy_inthehistory@@with_currently_recommended_antibiotic_regimen
         patient_has_undergone_antibiotic_therapy_inthehistory)
     :named REQ6_AUXILIARY1)) ;; "prior antibiotic treatment with a currently recommended antibiotic regimen"

;; The triple-qualifier variable is true iff all three conditions are true
(assert
  (! (= patient_has_undergone_antibiotic_therapy_inthehistory@@physician_documented@@with_currently_recommended_antibiotic_regimen
        (and patient_has_undergone_antibiotic_therapy_inthehistory
             patient_has_undergone_antibiotic_therapy_inthehistory@@physician_documented
             patient_has_undergone_antibiotic_therapy_inthehistory@@with_currently_recommended_antibiotic_regimen))
     :named REQ6_AUXILIARY2)) ;; "physician-documented history of prior antibiotic treatment with a currently recommended antibiotic regimen"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! patient_has_undergone_antibiotic_therapy_inthehistory@@physician_documented@@with_currently_recommended_antibiotic_regimen
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have had a physician-documented history of prior antibiotic treatment with a currently recommended antibiotic regimen."
