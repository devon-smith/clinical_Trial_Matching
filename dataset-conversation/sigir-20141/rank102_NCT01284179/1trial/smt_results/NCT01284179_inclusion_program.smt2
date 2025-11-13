;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 18 years AND aged ≤ 80 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 18 years."

(assert
  (! (<= patient_age_value_recorded_now_in_years 80)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≤ 80 years."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_non_cardiac_chest_pain_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of functional (non-cardiac) chest pain.","when_to_set_to_false":"Set to false if the patient does not have a history of functional (non-cardiac) chest pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of functional (non-cardiac) chest pain.","meaning":"Boolean indicating whether the patient has a history of functional (non-cardiac) chest pain."} // "Rome III criteria for functional chest pain of presumed esophageal origin"
(declare-const patient_has_finding_of_non_cardiac_chest_pain_inthehistory@@presumed_esophageal_origin Bool) ;; {"when_to_set_to_true":"Set to true if the patient's functional chest pain is of presumed esophageal origin.","when_to_set_to_false":"Set to false if the patient's functional chest pain is not of presumed esophageal origin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's functional chest pain is of presumed esophageal origin.","meaning":"Boolean indicating whether the patient's functional chest pain is of presumed esophageal origin."} // "Rome III criteria for functional chest pain of presumed esophageal origin"
(declare-const patient_has_finding_of_non_cardiac_chest_pain_inthehistory@@duration_previous_gte_3_months_and_onset_gte_6_months_before_diagnosis Bool) ;; {"when_to_set_to_true":"Set to true if the patient's functional chest pain occurred for the previous ≥ 3 months and symptom onset was ≥ 6 months before diagnosis.","when_to_set_to_false":"Set to false if the patient's functional chest pain did not meet both duration and onset criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's functional chest pain meets both duration and onset criteria.","meaning":"Boolean indicating whether the patient's functional chest pain occurred for the previous ≥ 3 months and symptom onset was ≥ 6 months before diagnosis."} // "Rome III criteria for functional chest pain of presumed esophageal origin for the previous ≥ 3 months (with symptom onset ≥ 6 months before diagnosis)"
(declare-const patient_has_finding_of_central_chest_pain_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of midline (central) chest pain.","when_to_set_to_false":"Set to false if the patient does not have a history of midline (central) chest pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of midline (central) chest pain.","meaning":"Boolean indicating whether the patient has a history of midline (central) chest pain."} // "midline chest pain"
(declare-const patient_has_finding_of_central_chest_pain_inthehistory@@not_of_burning_quality Bool) ;; {"when_to_set_to_true":"Set to true if the patient's midline chest pain is not of burning quality.","when_to_set_to_false":"Set to false if the patient's midline chest pain is of burning quality.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's midline chest pain is of burning quality.","meaning":"Boolean indicating whether the patient's midline chest pain is not of burning quality."} // "midline chest pain that is NOT of burning quality"
(declare-const patient_has_finding_of_central_chest_discomfort_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of midline (central) chest discomfort.","when_to_set_to_false":"Set to false if the patient does not have a history of midline (central) chest discomfort.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of midline (central) chest discomfort.","meaning":"Boolean indicating whether the patient has a history of midline (central) chest discomfort."} // "midline chest discomfort"
(declare-const patient_has_finding_of_central_chest_discomfort_inthehistory@@not_of_burning_quality Bool) ;; {"when_to_set_to_true":"Set to true if the patient's midline chest discomfort is not of burning quality.","when_to_set_to_false":"Set to false if the patient's midline chest discomfort is of burning quality.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's midline chest discomfort is of burning quality.","meaning":"Boolean indicating whether the patient's midline chest discomfort is not of burning quality."} // "midline chest discomfort that is NOT of burning quality"
(declare-const patient_has_evidence_that_gastroesophageal_reflux_is_cause_of_symptom Bool) ;; {"when_to_set_to_true":"Set to true if there is evidence that gastroesophageal reflux is the cause of the patient's symptom.","when_to_set_to_false":"Set to false if there is no evidence that gastroesophageal reflux is the cause of the patient's symptom.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether gastroesophageal reflux is the cause of the patient's symptom.","meaning":"Boolean indicating whether there is evidence that gastroesophageal reflux is the cause of the patient's symptom."} // "NOT have evidence that gastroesophageal reflux is the cause of the symptom"
(declare-const patient_has_histopathology_based_esophageal_motility_disorder Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a histopathology-based esophageal motility disorder.","when_to_set_to_false":"Set to false if the patient does not have a histopathology-based esophageal motility disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a histopathology-based esophageal motility disorder.","meaning":"Boolean indicating whether the patient has a histopathology-based esophageal motility disorder."} // "NOT have histopathology-based esophageal motility disorder"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_finding_of_non_cardiac_chest_pain_inthehistory@@presumed_esophageal_origin
         patient_has_finding_of_non_cardiac_chest_pain_inthehistory)
     :named REQ1_AUXILIARY0)) ;; "Rome III criteria for functional chest pain of presumed esophageal origin"

(assert
  (! (=> patient_has_finding_of_non_cardiac_chest_pain_inthehistory@@duration_previous_gte_3_months_and_onset_gte_6_months_before_diagnosis
         patient_has_finding_of_non_cardiac_chest_pain_inthehistory)
     :named REQ1_AUXILIARY1)) ;; "Rome III criteria for functional chest pain of presumed esophageal origin for the previous ≥ 3 months (with symptom onset ≥ 6 months before diagnosis)"

(assert
  (! (=> patient_has_finding_of_central_chest_pain_inthehistory@@not_of_burning_quality
         patient_has_finding_of_central_chest_pain_inthehistory)
     :named REQ1_AUXILIARY2)) ;; "midline chest pain that is NOT of burning quality"

(assert
  (! (=> patient_has_finding_of_central_chest_discomfort_inthehistory@@not_of_burning_quality
         patient_has_finding_of_central_chest_discomfort_inthehistory)
     :named REQ1_AUXILIARY3)) ;; "midline chest discomfort that is NOT of burning quality"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: Rome III criteria for functional chest pain of presumed esophageal origin for the previous ≥ 3 months (with symptom onset ≥ 6 months before diagnosis)
(assert
  (! (and patient_has_finding_of_non_cardiac_chest_pain_inthehistory@@presumed_esophageal_origin
          patient_has_finding_of_non_cardiac_chest_pain_inthehistory@@duration_previous_gte_3_months_and_onset_gte_6_months_before_diagnosis)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "Rome III criteria for functional chest pain of presumed esophageal origin for the previous ≥ 3 months (with symptom onset ≥ 6 months before diagnosis)"

;; Component 1: (midline chest pain OR midline chest discomfort) (that is NOT of burning quality)
(assert
  (! (or patient_has_finding_of_central_chest_pain_inthehistory@@not_of_burning_quality
         patient_has_finding_of_central_chest_discomfort_inthehistory@@not_of_burning_quality)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "(midline chest pain OR midline chest discomfort) (that is NOT of burning quality)"

;; Component 2: NOT have evidence that gastroesophageal reflux is the cause of the symptom
(assert
  (! (not patient_has_evidence_that_gastroesophageal_reflux_is_cause_of_symptom)
     :named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "NOT have evidence that gastroesophageal reflux is the cause of the symptom"

;; Component 3: NOT have histopathology-based esophageal motility disorder
(assert
  (! (not patient_has_histopathology_based_esophageal_motility_disorder)
     :named REQ1_COMPONENT3_OTHER_REQUIREMENTS)) ;; "NOT have histopathology-based esophageal motility disorder"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_intolerance_of_antidepressant_within_6_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has intolerance of at least one antidepressant within the last 6 months.","when_to_set_to_false":"Set to false if the patient does not have intolerance of at least one antidepressant within the last 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has intolerance of at least one antidepressant within the last 6 months.","meaning":"Boolean indicating whether the patient has intolerance of at least one antidepressant within the last 6 months."} // "intolerance of at least one antidepressant within the last 6 months"
(declare-const patient_has_finding_of_persistent_symptoms_despite_antidepressant_therapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has persistent symptoms despite a trial of antidepressant therapy at any time in the history.","when_to_set_to_false":"Set to false if the patient does not have persistent symptoms despite a trial of antidepressant therapy at any time in the history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has persistent symptoms despite a trial of antidepressant therapy at any time in the history.","meaning":"Boolean indicating whether the patient has persistent symptoms despite a trial of antidepressant therapy at any time in the history."} // "persistent symptoms despite a trial of antidepressant therapy"
(declare-const patient_has_finding_of_persistent_symptoms_despite_antidepressant_therapy_inthehistory@@chest_pain_despite_continuous_4_week_trial_within_6_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has chest pain despite at least a continuous 4-week trial of at least one antidepressant within the last 6 months.","when_to_set_to_false":"Set to false if the patient does not have chest pain despite at least a continuous 4-week trial of at least one antidepressant within the last 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has chest pain despite at least a continuous 4-week trial of at least one antidepressant within the last 6 months.","meaning":"Boolean indicating whether the patient has chest pain despite at least a continuous 4-week trial of at least one antidepressant within the last 6 months."} // "chest pain despite at least a continuous 4-week trial of at least one antidepressant within the last 6 months"
(declare-const patient_has_undergone_antidepressant_therapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone antidepressant therapy at any time in the history.","when_to_set_to_false":"Set to false if the patient has not undergone antidepressant therapy at any time in the history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone antidepressant therapy in the history.","meaning":"Boolean indicating whether the patient has undergone antidepressant therapy at any time in the history."} // "antidepressant therapy"
(declare-const patient_has_undergone_antidepressant_therapy_inthehistory@@temporalcontext_within_6_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone antidepressant therapy within the last 6 months.","when_to_set_to_false":"Set to false if the patient has not undergone antidepressant therapy within the last 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone antidepressant therapy within the last 6 months.","meaning":"Boolean indicating whether the patient has undergone antidepressant therapy within the last 6 months."} // "antidepressant therapy within the last 6 months"
(declare-const patient_has_undergone_antidepressant_therapy_inthehistory@@minimum_duration_continuous_4_weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone antidepressant therapy with at least a continuous 4-week trial.","when_to_set_to_false":"Set to false if the patient has not undergone antidepressant therapy with at least a continuous 4-week trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone antidepressant therapy with at least a continuous 4-week trial.","meaning":"Boolean indicating whether the patient has undergone antidepressant therapy with at least a continuous 4-week trial."} // "antidepressant therapy with at least a continuous 4-week trial"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_persistent_symptoms_despite_antidepressant_therapy_inthehistory@@chest_pain_despite_continuous_4_week_trial_within_6_months
         patient_has_finding_of_persistent_symptoms_despite_antidepressant_therapy_inthehistory)
     :named REQ2_AUXILIARY0)) ;; "chest pain despite at least a continuous 4-week trial of at least one antidepressant within the last 6 months" implies "persistent symptoms despite a trial of antidepressant therapy"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: To be included, the patient must have (persistent symptoms despite a trial of antidepressant therapy, defined as (chest pain despite at least a continuous 4-week trial of at least one antidepressant within the last 6 months) OR (intolerance of at least one antidepressant within the last 6 months)).
(assert
  (! (or patient_has_finding_of_persistent_symptoms_despite_antidepressant_therapy_inthehistory@@chest_pain_despite_continuous_4_week_trial_within_6_months
         patient_has_finding_of_intolerance_of_antidepressant_within_6_months)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "persistent symptoms despite a trial of antidepressant therapy, defined as (chest pain despite at least a continuous 4-week trial of at least one antidepressant within the last 6 months) OR (intolerance of at least one antidepressant within the last 6 months)"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_negative_cardiac_evaluation_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a negative cardiac evaluation at any time in the past, defined as either a negative cardiac stress test or a negative coronary angiogram.","when_to_set_to_false":"Set to false if the patient has not had a negative cardiac evaluation at any time in the past, or if all available cardiac stress tests and coronary angiograms were not negative, or if neither test was performed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a negative cardiac evaluation in the past.","meaning":"Boolean indicating whether the patient has had a negative cardiac evaluation at any time in the past, defined as either a negative cardiac stress test or a negative coronary angiogram."} // "a negative cardiac evaluation, defined as (a negative cardiac stress test OR a negative coronary angiogram)"
(declare-const patient_has_undergone_cardiovascular_stress_testing_inthehistory_outcome_is_negative Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a cardiac stress test at any time in the past and the outcome was negative.","when_to_set_to_false":"Set to false if the patient has undergone a cardiac stress test at any time in the past and the outcome was not negative, or if the patient has not undergone a cardiac stress test.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a cardiac stress test with a negative outcome in the past.","meaning":"Boolean indicating whether the patient has undergone a cardiac stress test in the past with a negative outcome."} // "negative cardiac stress test"
(declare-const patient_has_undergone_coronary_angiography_inthehistory_outcome_is_negative Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a coronary angiogram at any time in the past and the outcome was negative.","when_to_set_to_false":"Set to false if the patient has undergone a coronary angiogram at any time in the past and the outcome was not negative, or if the patient has not undergone a coronary angiogram.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a coronary angiogram with a negative outcome in the past.","meaning":"Boolean indicating whether the patient has undergone a coronary angiogram in the past with a negative outcome."} // "negative coronary angiogram"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Definition in the requirement: "a negative cardiac evaluation, defined as (a negative cardiac stress test OR a negative coronary angiogram)"
(assert
  (! (= patient_has_negative_cardiac_evaluation_in_the_history
        (or patient_has_undergone_cardiovascular_stress_testing_inthehistory_outcome_is_negative
            patient_has_undergone_coronary_angiography_inthehistory_outcome_is_negative))
     :named REQ3_AUXILIARY0)) ;; "a negative cardiac evaluation, defined as (a negative cardiac stress test OR a negative coronary angiogram)"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: "To be included, the patient must have (a negative cardiac evaluation, defined as (a negative cardiac stress test OR a negative coronary angiogram))."
(assert
  (! patient_has_negative_cardiac_evaluation_in_the_history
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS))

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_finding_of_erosive_esophagitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has erosive esophagitis.","when_to_set_to_false":"Set to false if the patient currently does not have erosive esophagitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has erosive esophagitis.","meaning":"Boolean indicating whether the patient currently has erosive esophagitis."} // "erosive esophagitis"
(declare-const patient_has_finding_of_erosive_esophagitis_now@@los_angeles_grade_c Bool) ;; {"when_to_set_to_true":"Set to true if the erosive esophagitis is Los Angeles grade C.","when_to_set_to_false":"Set to false if the erosive esophagitis is not Los Angeles grade C.","when_to_set_to_null":"Set to null if the Los Angeles grade of erosive esophagitis is unknown or indeterminate.","meaning":"Boolean indicating whether the erosive esophagitis is Los Angeles grade C."} // "Los Angeles grade C erosive esophagitis"
(declare-const patient_has_finding_of_erosive_esophagitis_now@@los_angeles_grade_d Bool) ;; {"when_to_set_to_true":"Set to true if the erosive esophagitis is Los Angeles grade D.","when_to_set_to_false":"Set to false if the erosive esophagitis is not Los Angeles grade D.","when_to_set_to_null":"Set to null if the Los Angeles grade of erosive esophagitis is unknown or indeterminate.","meaning":"Boolean indicating whether the erosive esophagitis is Los Angeles grade D."} // "Los Angeles grade D erosive esophagitis"
(declare-const patient_has_negative_gastrointestinal_evaluation_for_cause_of_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a negative gastrointestinal evaluation for the cause of pain.","when_to_set_to_false":"Set to false if the patient currently does not have a negative gastrointestinal evaluation for the cause of pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a negative gastrointestinal evaluation for the cause of pain.","meaning":"Boolean indicating whether the patient currently has a negative gastrointestinal evaluation for the cause of pain."} // "negative gastrointestinal evaluation for cause of pain"
(declare-const patient_has_symptoms_of_chest_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms of chest pain.","when_to_set_to_false":"Set to false if the patient currently does not have symptoms of chest pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptoms of chest pain.","meaning":"Boolean indicating whether the patient currently has symptoms of chest pain."} // "chest pain"
(declare-const patient_has_symptoms_of_chest_pain_now@@on_proton_pump_inhibitor_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient is on proton pump inhibitor therapy at the time of chest pain symptoms.","when_to_set_to_false":"Set to false if the patient is not on proton pump inhibitor therapy at the time of chest pain symptoms.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the patient is on proton pump inhibitor therapy at the time of chest pain symptoms.","meaning":"Boolean indicating whether the patient is on proton pump inhibitor therapy at the time of chest pain symptoms."} // "persistent chest pain on proton pump inhibitor therapy"
(declare-const patient_has_symptoms_of_chest_pain_now@@no_association_with_reflux_on_ambulatory_ph_or_ph_impedance_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient's chest pain has no association with reflux episodes on ambulatory pH or pH-impedance study.","when_to_set_to_false":"Set to false if the patient's chest pain is associated with reflux episodes on ambulatory pH or pH-impedance study.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the patient's chest pain is associated with reflux episodes on ambulatory pH or pH-impedance study.","meaning":"Boolean indicating whether the patient's chest pain has no association with reflux episodes on ambulatory pH or pH-impedance study."} // "no association of chest pain with reflux episodes on ambulatory pH study OR ambulatory pH-impedance study"
(declare-const symptom_index_value_recorded_on_ambulatory_ph_or_ph_impedance_study_percent Real) ;; {"when_to_set_to_value":"Set to the value of the symptom index for chest pain recorded on ambulatory pH or pH-impedance study, in percent.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the symptom index for chest pain recorded on ambulatory pH or pH-impedance study, in percent."} // "symptom index < 50% for chest pain"
(declare-const symptom_association_probability_value_recorded_for_chest_pain_on_ambulatory_ph_or_ph_impedance_study_percent Real) ;; {"when_to_set_to_value":"Set to the value of the symptom association probability for chest pain recorded on ambulatory pH or pH-impedance study, in percent.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the symptom association probability for chest pain recorded on ambulatory pH or pH-impedance study, in percent."} // "symptom association probability < 95% for chest pain"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_finding_of_erosive_esophagitis_now@@los_angeles_grade_c
         patient_has_finding_of_erosive_esophagitis_now)
     :named REQ4_AUXILIARY0)) ;; "Los Angeles grade C erosive esophagitis on endoscopy"

(assert
  (! (=> patient_has_finding_of_erosive_esophagitis_now@@los_angeles_grade_d
         patient_has_finding_of_erosive_esophagitis_now)
     :named REQ4_AUXILIARY1)) ;; "Los Angeles grade D erosive esophagitis on endoscopy"

(assert
  (! (=> patient_has_symptoms_of_chest_pain_now@@on_proton_pump_inhibitor_therapy
         patient_has_symptoms_of_chest_pain_now)
     :named REQ4_AUXILIARY2)) ;; "persistent chest pain on proton pump inhibitor therapy"

(assert
  (! (=> patient_has_symptoms_of_chest_pain_now@@no_association_with_reflux_on_ambulatory_ph_or_ph_impedance_study
         patient_has_symptoms_of_chest_pain_now)
     :named REQ4_AUXILIARY3)) ;; "no association of chest pain with reflux episodes on ambulatory pH study OR ambulatory pH-impedance study"

;; Definition of "no association of chest pain with reflux episodes on ambulatory pH study OR ambulatory pH-impedance study"
(assert
  (! (= patient_has_symptoms_of_chest_pain_now@@no_association_with_reflux_on_ambulatory_ph_or_ph_impedance_study
        (or (< symptom_index_value_recorded_on_ambulatory_ph_or_ph_impedance_study_percent 50.0)
            (< symptom_association_probability_value_recorded_for_chest_pain_on_ambulatory_ph_or_ph_impedance_study_percent 95.0)))
     :named REQ4_AUXILIARY4)) ;; "symptom index < 50% OR symptom association probability < 95% for chest pain"

;; Definition of "negative gastrointestinal evaluation for cause of pain"
(assert
  (! (= patient_has_negative_gastrointestinal_evaluation_for_cause_of_pain_now
        (and (not patient_has_finding_of_erosive_esophagitis_now@@los_angeles_grade_c)
             (not patient_has_finding_of_erosive_esophagitis_now@@los_angeles_grade_d)
             patient_has_symptoms_of_chest_pain_now@@on_proton_pump_inhibitor_therapy
             patient_has_symptoms_of_chest_pain_now@@no_association_with_reflux_on_ambulatory_ph_or_ph_impedance_study))
     :named REQ4_AUXILIARY5)) ;; "negative gastrointestinal evaluation for cause of the pain, defined as (NOT have Los Angeles grade C erosive esophagitis on endoscopy AND NOT have Los Angeles grade D erosive esophagitis on endoscopy AND persistent chest pain on proton pump inhibitor therapy AND (no association of chest pain with reflux episodes on an ambulatory pH study OR ambulatory pH-impedance study, defined as (symptom index < 50% OR symptom association probability < 95% for chest pain)))"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: NOT have Los Angeles grade C erosive esophagitis on endoscopy
(assert
  (! (not patient_has_finding_of_erosive_esophagitis_now@@los_angeles_grade_c)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "NOT have Los Angeles grade C erosive esophagitis on endoscopy"

;; Component 1: NOT have Los Angeles grade D erosive esophagitis on endoscopy
(assert
  (! (not patient_has_finding_of_erosive_esophagitis_now@@los_angeles_grade_d)
     :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "NOT have Los Angeles grade D erosive esophagitis on endoscopy"

;; Component 2: persistent chest pain on proton pump inhibitor therapy
(assert
  (! patient_has_symptoms_of_chest_pain_now@@on_proton_pump_inhibitor_therapy
     :named REQ4_COMPONENT2_OTHER_REQUIREMENTS)) ;; "persistent chest pain on proton pump inhibitor therapy"

;; Component 3: no association of chest pain with reflux episodes on ambulatory pH study OR ambulatory pH-impedance study, defined as (symptom index < 50% OR symptom association probability < 95% for chest pain)
(assert
  (! patient_has_symptoms_of_chest_pain_now@@no_association_with_reflux_on_ambulatory_ph_or_ph_impedance_study
     :named REQ4_COMPONENT3_OTHER_REQUIREMENTS)) ;; "no association of chest pain with reflux episodes on ambulatory pH study OR ambulatory pH-impedance study, defined as (symptom index < 50% OR symptom association probability < 95% for chest pain)"
