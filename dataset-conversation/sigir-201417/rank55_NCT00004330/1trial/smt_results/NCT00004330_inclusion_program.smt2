;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_acute_intermittent_porphyria_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of acute intermittent porphyria.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of acute intermittent porphyria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of acute intermittent porphyria.","meaning":"Boolean indicating whether the patient currently has a diagnosis of acute intermittent porphyria."}  ;; "acute intermittent porphyria"
(declare-const patient_has_diagnosis_of_hereditary_coproporphyria_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of hereditary coproporphyria.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of hereditary coproporphyria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of hereditary coproporphyria.","meaning":"Boolean indicating whether the patient currently has a diagnosis of hereditary coproporphyria."}  ;; "hereditary coproporphyria"
(declare-const patient_has_diagnosis_of_variegate_porphyria_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of variegate porphyria.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of variegate porphyria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of variegate porphyria.","meaning":"Boolean indicating whether the patient currently has a diagnosis of variegate porphyria."}  ;; "variegate porphyria"
(declare-const patient_has_diagnosis_of_porphyria_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of porphyria (any subtype or acuity).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of porphyria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of porphyria.","meaning":"Boolean indicating whether the patient currently has a diagnosis of porphyria."}  ;; "porphyria"
(declare-const patient_has_diagnosis_of_porphyria_now@@is_acute Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of porphyria is specifically of the acute type.","when_to_set_to_false":"Set to false if the patient's diagnosis of porphyria is not of the acute type (i.e., is chronic or unspecified).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's porphyria diagnosis is acute.","meaning":"Boolean indicating whether the patient's porphyria diagnosis is acute."}  ;; "acute porphyria" qualifier

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Exhaustive subcategories define acute porphyria exactly:
(assert
  (! (= patient_has_diagnosis_of_porphyria_now@@is_acute
        (or patient_has_diagnosis_of_acute_intermittent_porphyria_now
            patient_has_diagnosis_of_hereditary_coproporphyria_now
            patient_has_diagnosis_of_variegate_porphyria_now))
     :named REQ0_AUXILIARY0)) ;; "acute porphyria, defined as acute intermittent porphyria or hereditary coproporphyria or variegate porphyria"

;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_diagnosis_of_porphyria_now@@is_acute
         patient_has_diagnosis_of_porphyria_now)
     :named REQ0_AUXILIARY1)) ;; "acute porphyria" is a subtype of "porphyria"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_diagnosis_of_porphyria_now@@is_acute
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have acute porphyria (with exhaustive subcategories (acute intermittent porphyria OR hereditary coproporphyria OR variegate porphyria))."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently capable of becoming pregnant (e.g., premenopausal, not surgically sterile).","when_to_set_to_false":"Set to false if the patient is currently incapable of becoming pregnant (e.g., postmenopausal, surgically sterile, or other reasons).","when_to_set_to_null":"Set to null if the patient's childbearing potential is unknown, not documented, or cannot be determined at the current time.","meaning":"Indicates whether the patient currently has childbearing potential."} ;; "luteal phase of the menstrual cycle only"
(declare-const patient_has_definite_cyclic_attacks_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has definite cyclic attacks.","when_to_set_to_false":"Set to false if the patient currently does not have definite cyclic attacks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has definite cyclic attacks.","meaning":"Boolean indicating whether the patient currently has definite cyclic attacks."} ;; "definite cyclic attacks"
(declare-const patient_has_definite_cyclic_attacks_now@@occurring_during_luteal_phase_only Bool) ;; {"when_to_set_to_true":"Set to true if the patient's definite cyclic attacks occur only during the luteal phase of the menstrual cycle.","when_to_set_to_false":"Set to false if the patient's definite cyclic attacks do not occur only during the luteal phase of the menstrual cycle.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's definite cyclic attacks occur only during the luteal phase of the menstrual cycle.","meaning":"Boolean indicating whether the patient's definite cyclic attacks occur only during the luteal phase of the menstrual cycle."} ;; "during the luteal phase of the menstrual cycle only"
(declare-const patient_has_definite_cyclic_attacks_now@@with_severe_abdominal_pain_and_other_symptoms_of_porphyria Bool) ;; {"when_to_set_to_true":"Set to true if the patient's definite cyclic attacks are associated with severe abdominal pain and other symptoms of porphyria.","when_to_set_to_false":"Set to false if the patient's definite cyclic attacks are not associated with severe abdominal pain and other symptoms of porphyria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's definite cyclic attacks are associated with severe abdominal pain and other symptoms of porphyria.","meaning":"Boolean indicating whether the patient's definite cyclic attacks are associated with severe abdominal pain and other symptoms of porphyria."} ;; "severe abdominal pain AND other symptoms of porphyria"
(declare-const patient_has_finding_of_abdominal_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of abdominal pain.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of abdominal pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has abdominal pain.","meaning":"Boolean indicating whether the patient currently has abdominal pain."} ;; "abdominal pain"
(declare-const patient_has_finding_of_abdominal_pain_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current abdominal pain is severe.","when_to_set_to_false":"Set to false if the patient's current abdominal pain is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current abdominal pain is severe.","meaning":"Boolean indicating whether the patient's current abdominal pain is severe."} ;; "severe abdominal pain"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as male or other at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Indicates whether the patient's sex is female at the current time."} ;; "luteal phase of the menstrual cycle only"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable (definite cyclic attacks during luteal phase only)
(assert
  (! (=> patient_has_definite_cyclic_attacks_now@@occurring_during_luteal_phase_only
         patient_has_definite_cyclic_attacks_now)
     :named REQ1_AUXILIARY0)) ;; "definite cyclic attacks (with ... ) during the luteal phase of the menstrual cycle only"

;; Qualifier variable implies corresponding stem variable (definite cyclic attacks with severe abdominal pain and other symptoms of porphyria)
(assert
  (! (=> patient_has_definite_cyclic_attacks_now@@with_severe_abdominal_pain_and_other_symptoms_of_porphyria
         patient_has_definite_cyclic_attacks_now)
     :named REQ1_AUXILIARY1)) ;; "definite cyclic attacks (with severe abdominal pain AND other symptoms of porphyria)"

;; Severe abdominal pain qualifier implies abdominal pain
(assert
  (! (=> patient_has_finding_of_abdominal_pain_now@@severe
         patient_has_finding_of_abdominal_pain_now)
     :named REQ1_AUXILIARY2)) ;; "severe abdominal pain"

;; Definite cyclic attacks with severe abdominal pain and other symptoms of porphyria requires severe abdominal pain and porphyria symptoms
(assert
  (! (= patient_has_definite_cyclic_attacks_now@@with_severe_abdominal_pain_and_other_symptoms_of_porphyria
        (and patient_has_finding_of_abdominal_pain_now@@severe
             patient_has_diagnosis_of_porphyria_now))
     :named REQ1_AUXILIARY3)) ;; "severe abdominal pain AND other symptoms of porphyria"

;; Definite cyclic attacks during luteal phase only requires female sex and childbearing potential
(assert
  (! (= patient_has_definite_cyclic_attacks_now@@occurring_during_luteal_phase_only
        (and patient_sex_is_female_now
             patient_has_childbearing_potential_now))
     :named REQ1_AUXILIARY4)) ;; "during the luteal phase of the menstrual cycle only"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must have definite cyclic attacks (with severe abdominal pain AND other symptoms of porphyria) during the luteal phase of the menstrual cycle only.
(assert
  (! (and patient_has_definite_cyclic_attacks_now@@occurring_during_luteal_phase_only
          patient_has_definite_cyclic_attacks_now@@with_severe_abdominal_pain_and_other_symptoms_of_porphyria)
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "definite cyclic attacks (with severe abdominal pain AND other symptoms of porphyria) during the luteal phase of the menstrual cycle only"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_attack_that_resolves_completely_within_5_days_of_onset_of_menses Bool) ;; {"when_to_set_to_true":"Set to true if the patient has attacks that resolve completely within 5 days of onset of menses.","when_to_set_to_false":"Set to false if the patient does not have attacks that resolve completely within 5 days of onset of menses.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has attacks that resolve completely within 5 days of onset of menses.","meaning":"Boolean indicating whether the patient has attacks that resolve completely within 5 days of onset of menses."} ;; "attacks that resolve completely within 5 days of onset of menses"
(declare-const patient_has_symptoms_between_attacks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has symptoms between attacks.","when_to_set_to_false":"Set to false if the patient does not have symptoms between attacks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has symptoms between attacks.","meaning":"Boolean indicating whether the patient has symptoms between attacks."} ;; "no symptoms between attacks"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: attacks must resolve completely within 5 days of onset of menses
(assert
  (! patient_has_attack_that_resolves_completely_within_5_days_of_onset_of_menses
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "attacks that resolve completely within 5 days of onset of menses"

;; Component 1: patient must have no symptoms between attacks
(assert
  (! (not patient_has_symptoms_between_attacks)
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "no symptoms between attacks"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const attack_count_in_6_months_prior_to_entry Real) ;; {"when_to_set_to_value":"Set to the total number of attacks the patient experienced during the 6 months prior to entry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many attacks the patient experienced during the 6 months prior to entry.","meaning":"Numeric variable representing the number of attacks during the 6 months prior to entry (unit: count)."} ;; "at least 4 attacks during the 6 months prior to entry OR at least 5 attacks during the 6 months prior to entry OR at least 6 attacks during the 6 months prior to entry"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (or (>= attack_count_in_6_months_prior_to_entry 4)
         (>= attack_count_in_6_months_prior_to_entry 5)
         (>= attack_count_in_6_months_prior_to_entry 6))
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "at least 4 attacks during the 6 months prior to entry OR at least 5 attacks during the 6 months prior to entry OR at least 6 attacks during the 6 months prior to entry"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const attack_count_meeting_criteria_in_6_months_prior_to_entry Real) ;; {"when_to_set_to_value":"Set to the number of attacks in the 6 months prior to entry that meet all specified criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many attacks in the 6 months prior to entry meet all specified criteria.","meaning":"Numeric variable indicating the number of attacks in the 6 months prior to entry that meet all specified criteria."} ;; "more than half of these attacks meet all of the following criteria"
(declare-const attack_is_readily_distinguishable_from_menstrual_cramps Bool) ;; {"when_to_set_to_true":"Set to true if the attack is readily distinguishable from menstrual cramps.","when_to_set_to_false":"Set to false if the attack is not readily distinguishable from menstrual cramps.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the attack is readily distinguishable from menstrual cramps.","meaning":"Boolean indicating whether a given attack is readily distinguishable from menstrual cramps."} ;; "attacks that are readily distinguishable from menstrual cramps"
(declare-const attack_is_readily_distinguishable_from_premenstrual_syndrome Bool) ;; {"when_to_set_to_true":"Set to true if the attack is readily distinguishable from premenstrual syndrome.","when_to_set_to_false":"Set to false if the attack is not readily distinguishable from premenstrual syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the attack is readily distinguishable from premenstrual syndrome.","meaning":"Boolean indicating whether a given attack is readily distinguishable from premenstrual syndrome."} ;; "attacks that are readily distinguishable from premenstrual syndrome"
(declare-const attack_required_hospitalization_for_narcotic_analgesics Bool) ;; {"when_to_set_to_true":"Set to true if the attack required hospitalization for narcotic analgesics.","when_to_set_to_false":"Set to false if the attack did not require hospitalization for narcotic analgesics.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the attack required hospitalization for narcotic analgesics.","meaning":"Boolean indicating whether a given attack required hospitalization for narcotic analgesics."} ;; "attacks that required hospitalization for narcotic analgesics"
(declare-const attack_required_hospitalization_for_phenothiazines Bool) ;; {"when_to_set_to_true":"Set to true if the attack required hospitalization for phenothiazines.","when_to_set_to_false":"Set to false if the attack did not require hospitalization for phenothiazines.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the attack required hospitalization for phenothiazines.","meaning":"Boolean indicating whether a given attack required hospitalization for phenothiazines."} ;; "attacks that required hospitalization for phenothiazines"
(declare-const attack_required_hospitalization_for_hematin Bool) ;; {"when_to_set_to_true":"Set to true if the attack required hospitalization for hematin.","when_to_set_to_false":"Set to false if the attack did not require hospitalization for hematin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the attack required hospitalization for hematin.","meaning":"Boolean indicating whether a given attack required hospitalization for hematin."} ;; "attacks that required hospitalization for hematin"
(declare-const attack_required_hospitalization_for_intravenous_fluids Bool) ;; {"when_to_set_to_true":"Set to true if the attack required hospitalization for intravenous fluids.","when_to_set_to_false":"Set to false if the attack did not require hospitalization for intravenous fluids.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the attack required hospitalization for intravenous fluids.","meaning":"Boolean indicating whether a given attack required hospitalization for intravenous fluids."} ;; "attacks that required hospitalization for intravenous fluids"
(declare-const attack_required_hospitalization_for_other_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the attack required hospitalization for other treatment.","when_to_set_to_false":"Set to false if the attack did not require hospitalization for other treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the attack required hospitalization for other treatment.","meaning":"Boolean indicating whether a given attack required hospitalization for other treatment."} ;; "attacks that required hospitalization for other treatment"
(declare-const luteal_attack_not_requiring_hospitalization_is_similar_in_symptoms_and_differs_only_in_severity Bool) ;; {"when_to_set_to_true":"Set to true if the luteal attack not requiring hospitalization is similar in symptoms to other attacks and differs only in severity.","when_to_set_to_false":"Set to false if the luteal attack not requiring hospitalization is not similar in symptoms to other attacks or differs in more than severity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the luteal attack not requiring hospitalization is similar in symptoms and differs only in severity.","meaning":"Boolean indicating whether a luteal attack not requiring hospitalization is similar in symptoms to other attacks and differs only in severity."} ;; "luteal attacks not requiring hospitalization must be similar in symptoms and differ only in severity"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Definition: An attack meets all criteria if:
;; (1) Readily distinguishable from menstrual cramps
;; (2) Readily distinguishable from premenstrual syndrome
;; (3) Required hospitalization for any of: narcotic analgesics, phenothiazines, hematin, intravenous fluids, other treatment
;; OR (4) If a luteal attack not requiring hospitalization, must be similar in symptoms and differ only in severity

;; We define a Boolean for "attack_meets_all_criteria" for a given attack (abstracted here as a per-attack property).
;; Since we only have aggregate counts, we do not enumerate per-attack variables, but the aggregate variable is defined as the count of attacks meeting all these criteria.

;; ===================== Constraint Assertions (REQ 4) =====================
;; More than half of the attacks in the 6 months prior to entry must meet all criteria
(assert
  (! (> attack_count_meeting_criteria_in_6_months_prior_to_entry
        (/ attack_count_in_6_months_prior_to_entry 2))
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "more than half of these attacks meet all of the following criteria"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_finding_of_porphyria_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding of porphyria at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a clinical finding of porphyria in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had porphyria in their medical history.","meaning":"Boolean indicating whether the patient has ever had porphyria in their medical history."} ;; "porphyria"
(declare-const patient_has_finding_of_porphyria_inthehistory@@occurred_as_life_threatening_attacks Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of porphyria included life-threatening attacks.","when_to_set_to_false":"Set to false if the patient's history of porphyria did not include life-threatening attacks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's porphyria history included life-threatening attacks.","meaning":"Boolean indicating whether the patient's history of porphyria included life-threatening attacks."} ;; "life-threatening attacks of porphyria"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies the stem variable (if patient has had life-threatening attacks of porphyria, then they have had porphyria in their history)
(assert
  (! (=> patient_has_finding_of_porphyria_inthehistory@@occurred_as_life_threatening_attacks
         patient_has_finding_of_porphyria_inthehistory)
     :named REQ5_AUXILIARY0)) ;; "life-threatening attacks of porphyria" implies "porphyria in history"

;; ===================== Constraint Assertions (REQ 5) =====================
;; The patient must NOT have had life-threatening attacks of porphyria in their history
(assert
  (! (not patient_has_finding_of_porphyria_inthehistory@@occurred_as_life_threatening_attacks)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT have had life-threatening attacks of porphyria."

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_has_finding_of_abdominal_pain_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had abdominal pain at any point in their history.","when_to_set_to_false":"Set to false if the patient has never had abdominal pain at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had abdominal pain in their history.","meaning":"Boolean indicating whether the patient has ever had abdominal pain in their history."} ;; "abdominal pain"
(declare-const patient_has_finding_of_abdominal_pain_inthehistory@@cyclic Bool) ;; {"when_to_set_to_true":"Set to true if the patient's abdominal pain in their history was cyclic.","when_to_set_to_false":"Set to false if the patient's abdominal pain in their history was not cyclic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the abdominal pain in history was cyclic.","meaning":"Boolean indicating whether the patient's abdominal pain in history was cyclic."} ;; "cyclic abdominal pain"
(declare-const patient_has_finding_of_abdominal_pain_inthehistory@@caused_by_porphyria Bool) ;; {"when_to_set_to_true":"Set to true if the patient's cyclic abdominal pain in history was caused by porphyria.","when_to_set_to_false":"Set to false if the patient's cyclic abdominal pain in history was not caused by porphyria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the cyclic abdominal pain in history was caused by porphyria.","meaning":"Boolean indicating whether the patient's cyclic abdominal pain in history was caused by porphyria."} ;; "cyclic abdominal pain was caused by porphyria"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable for cyclic abdominal pain in history implies abdominal pain in history
(assert
  (! (=> patient_has_finding_of_abdominal_pain_inthehistory@@cyclic
         patient_has_finding_of_abdominal_pain_inthehistory)
     :named REQ6_AUXILIARY0)) ;; "cyclic abdominal pain" is a type of "abdominal pain"

;; Qualifier variable for cyclic abdominal pain caused by porphyria implies cyclic abdominal pain in history
(assert
  (! (=> patient_has_finding_of_abdominal_pain_inthehistory@@caused_by_porphyria
         patient_has_finding_of_abdominal_pain_inthehistory@@cyclic)
     :named REQ6_AUXILIARY1)) ;; "cyclic abdominal pain caused by porphyria" is a type of "cyclic abdominal pain"

;; ===================== Constraint Assertions (REQ 6) =====================
;; To be included, the patient must NOT have had cyclic abdominal pain UNLESS the cyclic abdominal pain was caused by porphyria.
(assert
  (! (or (not patient_has_finding_of_abdominal_pain_inthehistory@@cyclic)
         patient_has_finding_of_abdominal_pain_inthehistory@@caused_by_porphyria)
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT have had cyclic abdominal pain UNLESS the cyclic abdominal pain was caused by porphyria."

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const months_since_suppression_of_ovulation_value_recorded_now_in_months Real) ;; {"when_to_set_to_value":"Set to the number of months since the patient's most recent documented suppression of ovulation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many months have passed since the patient's most recent suppression of ovulation.","meaning":"Numeric value indicating the number of months since the patient's most recent documented suppression of ovulation, measured in months."} ;; "at least 6 months since suppression of ovulation"
(declare-const patient_has_finding_of_suppression_of_ovulation_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had suppression of ovulation documented in their history.","when_to_set_to_false":"Set to false if the patient has never had suppression of ovulation documented in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had suppression of ovulation.","meaning":"Boolean indicating whether the patient has ever had suppression of ovulation in their history."} ;; "suppression of ovulation"

;; ===================== Constraint Assertions (REQ 7) =====================
;; The patient must have had at least 6 months since suppression of ovulation.
(assert
  (! (and patient_has_finding_of_suppression_of_ovulation_inthehistory
          (>= months_since_suppression_of_ovulation_value_recorded_now_in_months 6.0))
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have had at least 6 months since suppression of ovulation."

;; ===================== Declarations for the criterion (REQ 8) =====================
(declare-const menstrual_cycle_length_value_recorded_prior_6_months_in_days Real) ;; {"when_to_set_to_value":"Set to the number of days for the patient's menstrual cycle if the cycle length is documented for at least 6 months prior to entry.","when_to_set_to_null":"Set to null if the menstrual cycle length is unknown, not documented, or cannot be determined for at least 6 months prior to entry.","meaning":"Numeric value representing the length in days of the patient's menstrual cycle, as recorded for at least 6 months prior to entry."} ;; "a menstrual cycle of [25-35] days for at least 6 months prior to entry"

;; ===================== Constraint Assertions (REQ 8) =====================
;; The patient must have had a menstrual cycle of 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, or 35 days for at least 6 months prior to entry.
(assert
  (! (or (= menstrual_cycle_length_value_recorded_prior_6_months_in_days 25.0)
         (= menstrual_cycle_length_value_recorded_prior_6_months_in_days 26.0)
         (= menstrual_cycle_length_value_recorded_prior_6_months_in_days 27.0)
         (= menstrual_cycle_length_value_recorded_prior_6_months_in_days 28.0)
         (= menstrual_cycle_length_value_recorded_prior_6_months_in_days 29.0)
         (= menstrual_cycle_length_value_recorded_prior_6_months_in_days 30.0)
         (= menstrual_cycle_length_value_recorded_prior_6_months_in_days 31.0)
         (= menstrual_cycle_length_value_recorded_prior_6_months_in_days 32.0)
         (= menstrual_cycle_length_value_recorded_prior_6_months_in_days 33.0)
         (= menstrual_cycle_length_value_recorded_prior_6_months_in_days 34.0)
         (= menstrual_cycle_length_value_recorded_prior_6_months_in_days 35.0))
     :named REQ8_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "a menstrual cycle of [25-35] days for at least 6 months prior to entry"

;; ===================== Declarations for the criterion (REQ 9) =====================
(declare-const patient_has_undergone_manual_pelvic_examination_inthepast60days_outcome_is_normal Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a manual pelvic examination with a normal outcome within the past 60 days prior to entry.","when_to_set_to_false":"Set to false if the patient has not undergone a manual pelvic examination with a normal outcome within the past 60 days prior to entry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a manual pelvic examination with a normal outcome within the past 60 days prior to entry.","meaning":"Boolean indicating whether the patient has undergone a manual pelvic examination with a normal outcome within the past 60 days prior to entry."} ;; "To be included, the patient must have had a normal pelvic examination within 60 days prior to entry."

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
  (! patient_has_undergone_manual_pelvic_examination_inthepast60days_outcome_is_normal
     :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have had a normal pelvic examination within 60 days prior to entry."

;; ===================== Declarations for the criterion (REQ 10) =====================
(declare-const patient_has_undergone_microscopic_examination_of_cervical_papanicolaou_smear_inthehistory_outcome_is_normal Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a microscopic examination of cervical Papanicolaou smear (Pap smear) in the past and the result was normal (no dysplasia).","when_to_set_to_false":"Set to false if the patient has undergone a Pap smear in the past and the result was not normal (e.g., dysplasia present), or if all available Pap smear results are abnormal.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a Pap smear with a normal result.","meaning":"Boolean indicating whether the patient has ever had a Pap smear in the past with a normal result (no dysplasia)."} ;; "To be included, the patient must have had a normal Papanicolaou smear (no dysplasia)."

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
  (! patient_has_undergone_microscopic_examination_of_cervical_papanicolaou_smear_inthehistory_outcome_is_normal
     :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have had a normal Papanicolaou smear (no dysplasia)."

;; ===================== Declarations for the criterion (REQ 11) =====================
(declare-const patient_has_finding_of_amenorrhea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of amenorrhea.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of amenorrhea.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has amenorrhea.","meaning":"Boolean indicating whether the patient currently has amenorrhea."} ;; "amenorrhea"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
  (! (not patient_has_finding_of_amenorrhea_now)
     :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT have amenorrhea."

;; ===================== Declarations for the criterion (REQ 12) =====================
(declare-const patient_has_finding_of_abnormal_menstrual_cycle_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any abnormality of the menstrual cycle (other than amenorrhea).","when_to_set_to_false":"Set to false if the patient currently does not have any abnormality of the menstrual cycle (other than amenorrhea).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any abnormality of the menstrual cycle (other than amenorrhea).","meaning":"Boolean indicating whether the patient currently has any abnormality of the menstrual cycle (excluding amenorrhea)."} ;; "any other abnormality of the menstrual cycle"

;; ===================== Constraint Assertions (REQ 12) =====================
;; To be included, the patient must NOT have any other abnormality of the menstrual cycle.
(assert
  (! (not patient_has_finding_of_abnormal_menstrual_cycle_now)
     :named REQ12_COMPONENT0_OTHER_REQUIREMENTS))

;; ===================== Declarations for the criterion (REQ 13) =====================
(declare-const patient_has_finding_of_abnormality_of_gynecologic_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any abnormality of the gynecologic system, other than abnormal menstrual cycle.","when_to_set_to_false":"Set to false if the patient currently does not have any abnormality of the gynecologic system, other than abnormal menstrual cycle.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any abnormality of the gynecologic system, other than abnormal menstrual cycle.","meaning":"Boolean indicating whether the patient currently has any abnormality of the gynecologic system, other than abnormal menstrual cycle."} ;; "any other abnormality of the gynecologic system"

;; ===================== Constraint Assertions (REQ 13) =====================
;; To be included, the patient must NOT have any other abnormality of the gynecologic system.
(assert
  (! (not patient_has_finding_of_abnormality_of_gynecologic_system_now)
     :named REQ13_COMPONENT0_OTHER_REQUIREMENTS))

;; ===================== Declarations for the criterion (REQ 14) =====================
(declare-const patient_has_pregnancy_test_result_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented pregnancy test result.","when_to_set_to_false":"Set to false if the patient currently does not have a documented pregnancy test result.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a pregnancy test result.","meaning":"Boolean indicating whether the patient currently has a documented pregnancy test result."} ;; "must have a negative pregnancy test"
(declare-const patient_has_pregnancy_test_result_now@@pregnancy_test_result_is_negative Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current pregnancy test result is negative.","when_to_set_to_false":"Set to false if the patient's current pregnancy test result is not negative (i.e., positive or indeterminate).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current pregnancy test result is negative.","meaning":"Boolean indicating whether the patient's current pregnancy test result is negative."} ;; "must have a negative pregnancy test"
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as determined by a pregnancy test or clinical assessment.","when_to_set_to_false":"Set to false if the patient is currently not pregnant as determined by a negative pregnancy test or clinical assessment.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "must have a negative pregnancy test"

;; ===================== Auxiliary Assertions (REQ 14) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_pregnancy_test_result_now@@pregnancy_test_result_is_negative
         patient_has_pregnancy_test_result_now)
     :named REQ14_AUXILIARY0)) ;; "must have a negative pregnancy test"

;; Negative pregnancy test result implies not currently pregnant
(assert
  (! (=> patient_has_pregnancy_test_result_now@@pregnancy_test_result_is_negative
         (not patient_is_pregnant_now))
     :named REQ14_AUXILIARY1)) ;; "must have a negative pregnancy test"

;; ===================== Constraint Assertions (REQ 14) =====================
;; Component 0: Patient must have a negative pregnancy test
(assert
  (! patient_has_pregnancy_test_result_now@@pregnancy_test_result_is_negative
     :named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "must have a negative pregnancy test"

;; ===================== Declarations for the criterion (REQ 15) =====================
(declare-const patient_has_childbearing_potential_inthepast2months Bool) ;; {"when_to_set_to_true":"Set to true if the patient had childbearing potential at any time during the 2 months prior to study entry.","when_to_set_to_false":"Set to false if the patient did not have childbearing potential at any time during the 2 months prior to study entry.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the patient had childbearing potential during the 2 months prior to study entry.","meaning":"Indicates whether the patient had childbearing potential during the 2 months prior to study entry."} ;; "have used medically approved contraception for ≥ 2 months prior to entry"
(declare-const patient_has_finding_of_contraception_inthepast2months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used medically approved contraception at any time during the 2 months prior to study entry.","when_to_set_to_false":"Set to false if the patient has not used medically approved contraception at any time during the 2 months prior to study entry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient used medically approved contraception during the 2 months prior to study entry.","meaning":"Boolean indicating whether the patient used medically approved contraception during the 2 months prior to study entry."} ;; "contraception for ≥ 2 months prior to entry"
(declare-const patient_has_finding_of_contraception_inthepast2months@@medically_approved Bool) ;; {"when_to_set_to_true":"Set to true if the contraception used by the patient during the 2 months prior to study entry is medically approved.","when_to_set_to_false":"Set to false if the contraception used by the patient during the 2 months prior to study entry is not medically approved.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the contraception used during the 2 months prior to study entry is medically approved.","meaning":"Boolean indicating whether the contraception used during the 2 months prior to study entry is medically approved."} ;; "medically approved contraception for ≥ 2 months prior to entry"
(declare-const patient_has_finding_of_contraception_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using contraception.","when_to_set_to_false":"Set to false if the patient is currently not using contraception.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using contraception.","meaning":"Boolean indicating whether the patient is currently using contraception."} ;; "use medically approved contraception throughout the study"
(declare-const patient_has_finding_of_contraception_now@@medically_approved Bool) ;; {"when_to_set_to_true":"Set to true if the contraception currently used by the patient is medically approved.","when_to_set_to_false":"Set to false if the contraception currently used by the patient is not medically approved.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the contraception currently used is medically approved.","meaning":"Boolean indicating whether the contraception currently used is medically approved."} ;; "use medically approved contraception throughout the study"
(declare-const patient_has_finding_of_contraception_now@@used_throughout_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient uses contraception continuously throughout the study period.","when_to_set_to_false":"Set to false if the patient does not use contraception continuously throughout the study period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient uses contraception continuously throughout the study period.","meaning":"Boolean indicating whether the patient uses contraception continuously throughout the study period."} ;; "use medically approved contraception throughout the study"
(declare-const patient_has_undergone_ligation_of_fallopian_tube_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone ligation of the fallopian tube (tubal ligation) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone ligation of the fallopian tube (tubal ligation).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone ligation of the fallopian tube (tubal ligation).","meaning":"Boolean indicating whether the patient has undergone ligation of the fallopian tube (tubal ligation) at any time in the past."} ;; "tubal ligation"
(declare-const patient_has_undergone_ligation_of_fallopian_tube_inthehistory@@menstrual_cycle_following_procedure Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had at least one menstrual cycle following tubal ligation.","when_to_set_to_false":"Set to false if the patient has not had any menstrual cycles following tubal ligation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had at least one menstrual cycle following tubal ligation.","meaning":"Boolean indicating whether the patient has had at least one menstrual cycle following tubal ligation."} ;; "≥ 1 menstrual cycle following tubal ligation"

;; ===================== Auxiliary Assertions (REQ 15) =====================
;; Medically approved contraception in the past 2 months implies contraception in the past 2 months
(assert
  (! (=> patient_has_finding_of_contraception_inthepast2months@@medically_approved
         patient_has_finding_of_contraception_inthepast2months)
     :named REQ15_AUXILIARY0)) ;; "contraception in the past 2 months is medically approved"

;; Medically approved contraception now implies contraception now
(assert
  (! (=> patient_has_finding_of_contraception_now@@medically_approved
         patient_has_finding_of_contraception_now)
     :named REQ15_AUXILIARY1)) ;; "contraception now is medically approved"

;; Used throughout study implies contraception now
(assert
  (! (=> patient_has_finding_of_contraception_now@@used_throughout_study
         patient_has_finding_of_contraception_now)
     :named REQ15_AUXILIARY2)) ;; "contraception used throughout study implies contraception now"

;; Menstrual cycle following tubal ligation implies tubal ligation in history
(assert
  (! (=> patient_has_undergone_ligation_of_fallopian_tube_inthehistory@@menstrual_cycle_following_procedure
         patient_has_undergone_ligation_of_fallopian_tube_inthehistory)
     :named REQ15_AUXILIARY3)) ;; "menstrual cycle following tubal ligation implies tubal ligation in history"

;; ===================== Constraint Assertions (REQ 15) =====================
;; To be included, the patient must ((have used medically approved contraception for ≥ 2 months prior to entry AND use medically approved contraception throughout the study) OR (have had ≥ 1 menstrual cycle following tubal ligation)).
(assert
  (! (or
        (and
          patient_has_childbearing_potential_inthepast2months
          patient_has_finding_of_contraception_inthepast2months@@medically_approved
          patient_has_finding_of_contraception_now@@medically_approved
          patient_has_finding_of_contraception_now@@used_throughout_study)
        patient_has_undergone_ligation_of_fallopian_tube_inthehistory@@menstrual_cycle_following_procedure)
     :named REQ15_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must ((have used medically approved contraception for ≥ 2 months prior to entry AND use medically approved contraception throughout the study) OR (have had ≥ 1 menstrual cycle following tubal ligation))."

;; ===================== Declarations for the criterion (REQ 16) =====================
(declare-const patient_has_allergy_to_gonadotropin_releasing_hormone_analogues_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an allergy to gonadotropin-releasing hormone analogues.","when_to_set_to_false":"Set to false if the patient currently does not have an allergy to gonadotropin-releasing hormone analogues.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an allergy to gonadotropin-releasing hormone analogues.","meaning":"Boolean indicating whether the patient currently has an allergy to gonadotropin-releasing hormone analogues."} ;; "To be included, the patient must NOT have an allergy to gonadotropin-releasing hormone analogues."

;; ===================== Constraint Assertions (REQ 16) =====================
(assert
  (! (not patient_has_allergy_to_gonadotropin_releasing_hormone_analogues_now)
     :named REQ16_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT have an allergy to gonadotropin-releasing hormone analogues."

;; ===================== Declarations for the criterion (REQ 17) =====================
(declare-const patient_has_finding_of_problem_abnormal_test_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has abnormal results of laboratory tests.","when_to_set_to_false":"Set to false if the patient currently does not have abnormal results of laboratory tests.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has abnormal results of laboratory tests.","meaning":"Boolean indicating whether the patient currently has abnormal results of laboratory tests."} ;; "abnormal results of laboratory tests"
(declare-const patient_has_finding_of_problem_abnormal_test_now@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the abnormal laboratory test results present in the patient are clinically significant.","when_to_set_to_false":"Set to false if the abnormal laboratory test results present in the patient are not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the abnormal laboratory test results are clinically significant.","meaning":"Boolean indicating whether the patient's abnormal laboratory test results are clinically significant."} ;; "clinically significant abnormal results of laboratory tests"

;; ===================== Auxiliary Assertions (REQ 17) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_problem_abnormal_test_now@@clinically_significant
         patient_has_finding_of_problem_abnormal_test_now)
     :named REQ17_AUXILIARY0)) ;; "clinically significant abnormal results of laboratory tests" implies "abnormal results of laboratory tests"

;; ===================== Constraint Assertions (REQ 17) =====================
;; Component 0: To be included, the patient must NOT have clinically significant abnormal results of laboratory tests.
(assert
  (! (not patient_has_finding_of_problem_abnormal_test_now@@clinically_significant)
     :named REQ17_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT have clinically significant abnormal results of laboratory tests."

;; ===================== Declarations for the criterion (REQ 18) =====================
(declare-const patient_has_finding_of_contraindication_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any medical contraindication to protocol treatment.","when_to_set_to_false":"Set to false if the patient currently does not have any medical contraindication to protocol treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any medical contraindication to protocol treatment.","meaning":"Boolean indicating whether the patient currently has any medical contraindication to protocol treatment."} ;; "medical contraindication to protocol treatment"

;; ===================== Constraint Assertions (REQ 18) =====================
(assert
  (! (not patient_has_finding_of_contraindication_now)
     :named REQ18_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT have a medical contraindication to protocol treatment."
