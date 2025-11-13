;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_is_undergoing_intubation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently intubated (the intubation procedure is ongoing or in place now).","when_to_set_to_false":"Set to false if the patient is not currently intubated (no intubation procedure ongoing or in place now).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently intubated.","meaning":"Boolean indicating whether the patient is currently intubated."} // "be intubated (with or without mechanical ventilator support)"
(declare-const patient_is_receiving_mechanical_ventilator_support_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving mechanical ventilator support.","when_to_set_to_false":"Set to false if the patient is not currently receiving mechanical ventilator support.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving mechanical ventilator support.","meaning":"Boolean indicating whether the patient is currently receiving mechanical ventilator support."} // "with or without mechanical ventilator support"
(declare-const patient_bronchial_fluid_value_recorded_now_withunit_milliliters_per_hour Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's bronchial secretion volume (in milliliters per hour) is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current bronchial secretion volume in milliliters per hour."} // "bronchial secretion volume ≥ 1.5 milliliters per hour"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: Patient must be intubated (with or without mechanical ventilator support)
(assert
  (! patient_is_undergoing_intubation_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be intubated (with or without mechanical ventilator support)."

;; Component 1: Patient must have bronchial secretion volume ≥ 1.5 milliliters per hour
(assert
  (! (>= patient_bronchial_fluid_value_recorded_now_withunit_milliliters_per_hour 1.5)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have bronchial secretion volume ≥ 1.5 milliliters per hour."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_bronchiectasis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of bronchiectasis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of bronchiectasis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of bronchiectasis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of bronchiectasis."} // "bronchiectasis"
(declare-const patient_has_diagnosis_of_chronic_bronchitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of chronic bronchitis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of chronic bronchitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of chronic bronchitis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of chronic bronchitis."} // "chronic bronchitis"
(declare-const patient_has_diagnosis_of_chronic_obstructive_lung_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of chronic obstructive pulmonary disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of chronic obstructive pulmonary disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of chronic obstructive pulmonary disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of chronic obstructive pulmonary disease."} // "chronic obstructive pulmonary disease"
(declare-const patient_has_diagnosis_of_infectious_disease_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical diagnosis of pulmonary infection.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical diagnosis of pulmonary infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical diagnosis of pulmonary infection.","meaning":"Boolean indicating whether the patient currently has a clinical diagnosis of pulmonary infection."} // "pulmonary infection"
(declare-const patient_has_diagnosis_of_inflammatory_disorder_of_the_respiratory_tract_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of inflammatory disorder of the respiratory tract.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of inflammatory disorder of the respiratory tract.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of inflammatory disorder of the respiratory tract.","meaning":"Boolean indicating whether the patient currently has a diagnosis of inflammatory disorder of the respiratory tract."} // "airway inflammation"
(declare-const patient_has_diagnosis_of_inflammatory_disorder_of_the_respiratory_tract_now@@acute Bool) ;; {"when_to_set_to_true":"Set to true if the patient's inflammatory disorder of the respiratory tract is acute.","when_to_set_to_false":"Set to false if the patient's inflammatory disorder of the respiratory tract is not acute.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disorder is acute.","meaning":"Boolean indicating whether the patient's inflammatory disorder of the respiratory tract is acute."} // "acute airway inflammation disease"
(declare-const patient_has_diagnosis_of_inflammatory_disorder_of_the_respiratory_tract_now@@chronic Bool) ;; {"when_to_set_to_true":"Set to true if the patient's inflammatory disorder of the respiratory tract is chronic.","when_to_set_to_false":"Set to false if the patient's inflammatory disorder of the respiratory tract is not chronic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disorder is chronic.","meaning":"Boolean indicating whether the patient's inflammatory disorder of the respiratory tract is chronic."} // "chronic airway inflammation disease"
(declare-const patient_has_diagnosis_of_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of pneumonia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of pneumonia."} // "pneumonia"
(declare-const patient_has_diagnosis_of_pulmonary_infection_by_radiology_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a radiologic diagnosis of pulmonary infection.","when_to_set_to_false":"Set to false if the patient currently does not have a radiologic diagnosis of pulmonary infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a radiologic diagnosis of pulmonary infection.","meaning":"Boolean indicating whether the patient currently has a radiologic diagnosis of pulmonary infection."} // "radiologic diagnosis of pulmonary infection"
(declare-const patient_has_finding_of_coarse_respiratory_crackles_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of coarse respiratory crackles.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of coarse respiratory crackles.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of coarse respiratory crackles.","meaning":"Boolean indicating whether the patient currently has a finding of coarse respiratory crackles."} // "medium-coarse crackle"
(declare-const patient_has_finding_of_decreased_breath_sounds_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of decreased breath sounds.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of decreased breath sounds.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of decreased breath sounds.","meaning":"Boolean indicating whether the patient currently has a finding of decreased breath sounds."} // "decreased breath sound"
(declare-const patient_has_finding_of_excessive_bronchial_secretion_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of excessive bronchial secretion.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of excessive bronchial secretion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of excessive bronchial secretion.","meaning":"Boolean indicating whether the patient currently has a finding of excessive bronchial secretion."} // "bronchial secretion accumulation"
(declare-const patient_has_finding_of_wheezing_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of wheezing.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of wheezing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of wheezing.","meaning":"Boolean indicating whether the patient currently has a finding of wheezing."} // "wheezing"
(declare-const patient_positive_end_expiratory_pressure_value_recorded_now_withunit_centimeters_of_water Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of positive end-expiratory pressure (PEEP) in centimeters of water is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current positive end-expiratory pressure (PEEP) in centimeters of water."} // "positive end-expiratory pressure"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_diagnosis_of_inflammatory_disorder_of_the_respiratory_tract_now@@acute
         patient_has_diagnosis_of_inflammatory_disorder_of_the_respiratory_tract_now)
     :named REQ1_AUXILIARY0)) ;; "acute airway inflammation disease"

(assert
  (! (=> patient_has_diagnosis_of_inflammatory_disorder_of_the_respiratory_tract_now@@chronic
         patient_has_diagnosis_of_inflammatory_disorder_of_the_respiratory_tract_now)
     :named REQ1_AUXILIARY1)) ;; "chronic airway inflammation disease"

;; Non-exhaustive examples imply chronic airway inflammation disease
(assert
  (! (=> (or patient_has_diagnosis_of_bronchiectasis_now
            patient_has_diagnosis_of_chronic_obstructive_lung_disease_now
            patient_has_diagnosis_of_chronic_bronchitis_now
            patient_has_diagnosis_of_pneumonia_now)
         patient_has_diagnosis_of_inflammatory_disorder_of_the_respiratory_tract_now@@chronic)
     :named REQ1_AUXILIARY2)) ;; "chronic airway inflammation disease with non-exhaustive examples (pneumonia, bronchiectasis, chronic obstructive pulmonary disease, chronic bronchitis)"

;; Non-exhaustive examples imply bronchial secretion accumulation
(assert
  (! (=> (or patient_has_finding_of_coarse_respiratory_crackles_now
            patient_has_finding_of_wheezing_now
            patient_has_finding_of_decreased_breath_sounds_now)
         patient_has_finding_of_excessive_bronchial_secretion_now)
     :named REQ1_AUXILIARY3)) ;; "bronchial secretion accumulation with non-exhaustive examples (medium-coarse crackle, wheezing, persistent rhonchi, decreased breath sound)"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: If the patient is breathing with mechanical ventilation, then the positive end-expiratory pressure level must be < 6 centimeters of water.
(assert
  (! (=> patient_is_receiving_mechanical_ventilator_support_now
         (< patient_positive_end_expiratory_pressure_value_recorded_now_withunit_centimeters_of_water 6.0))
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "positive end-expiratory pressure level must be < 6 centimeters of water"

;; Component 1: If the patient is breathing with mechanical ventilation, then the patient must have at least one of the following:
;; (clinical diagnosis of pulmonary infection) OR (radiologic diagnosis of pulmonary infection) OR (acute airway inflammation disease) OR (chronic airway inflammation disease with non-exhaustive examples (pneumonia, bronchiectasis, chronic obstructive pulmonary disease, chronic bronchitis))
(assert
  (! (=> patient_is_receiving_mechanical_ventilator_support_now
         (or patient_has_diagnosis_of_infectious_disease_of_lung_now
             patient_has_diagnosis_of_pulmonary_infection_by_radiology_now
             patient_has_diagnosis_of_inflammatory_disorder_of_the_respiratory_tract_now@@acute
             patient_has_diagnosis_of_inflammatory_disorder_of_the_respiratory_tract_now@@chronic))
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "at least one of the following: (clinical diagnosis of pulmonary infection) OR (radiologic diagnosis of pulmonary infection) OR (acute airway inflammation disease) OR (chronic airway inflammation disease...)"

;; Component 2: If the patient is breathing with mechanical ventilation, then the patient must have at least one sign of bronchial secretion accumulation
(assert
  (! (=> patient_is_receiving_mechanical_ventilator_support_now
         patient_has_finding_of_excessive_bronchial_secretion_now)
     :named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "at least one sign of bronchial secretion accumulation"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const cardiopulmonary_function_is_stable_for_at_least_2_days_before_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient's cardiopulmonary function has been stable for at least 2 days before the study.","when_to_set_to_false":"Set to false if the patient's cardiopulmonary function has not been stable for at least 2 days before the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's cardiopulmonary function has been stable for at least 2 days before the study.","meaning":"Boolean indicating whether the patient's cardiopulmonary function has been stable for at least 2 days before the study."} // "have stable cardiopulmonary function for ≥ 2 days before the study"
(declare-const vasopressor_drug_received_within_5_days_before_data_collection Bool) ;; {"when_to_set_to_true":"Set to true if the patient received a vasopressor drug within 5 days before data collection.","when_to_set_to_false":"Set to false if the patient did not receive a vasopressor drug within 5 days before data collection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient received a vasopressor drug within 5 days before data collection.","meaning":"Boolean indicating whether the patient received a vasopressor drug within 5 days before data collection."} // "NOT have received vasopressor drug within 5 days before data collection"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! cardiopulmonary_function_is_stable_for_at_least_2_days_before_study
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "have stable cardiopulmonary function for ≥ 2 days before the study"

(assert
  (! (not vasopressor_drug_received_within_5_days_before_data_collection)
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "NOT have received vasopressor drug within 5 days before data collection"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patients_hydration_status_is_normal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hydration status is normal (stable) now.","when_to_set_to_false":"Set to false if the patient's hydration status is not normal (not stable) now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's hydration status is normal now.","meaning":"Boolean indicating whether the patient's hydration status is normal (stable) now."} // "have stable hydration status"
(declare-const patients_fluid_balance_is_positive_inthepast2days Bool) ;; {"when_to_set_to_true":"Set to true if the patient's fluid balance was positive for at least 2 days before data collection.","when_to_set_to_false":"Set to false if the patient's fluid balance was not positive for at least 2 days before data collection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's fluid balance was positive for at least 2 days before data collection.","meaning":"Boolean indicating whether the patient's fluid balance was positive for at least 2 days before data collection."} // "have positive fluid balance for ≥ 2 days before data collection"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: To be included, the patient must ((have stable hydration status) OR (have positive fluid balance for ≥ 2 days before data collection)).
(assert
  (! (or patients_hydration_status_is_normal_now
         patients_fluid_balance_is_positive_inthepast2days)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS))

;; ===================== Declarations for the inclusion criterion (REQ 4) =====================
(declare-const patient_can_breathe_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to breathe spontaneously without assistance.","when_to_set_to_false":"Set to false if the patient is currently unable to breathe spontaneously without assistance.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to breathe spontaneously without assistance.","meaning":"Boolean indicating whether the patient is currently able to breathe spontaneously without assistance."} // "be able to breathe"
(declare-const patient_can_undergo_trial_for_spontaneous_breathing_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient can currently undergo a trial for spontaneous breathing.","when_to_set_to_false":"Set to false if the patient cannot currently undergo a trial for spontaneous breathing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can currently undergo a trial for spontaneous breathing.","meaning":"Boolean indicating whether the patient can currently undergo a trial for spontaneous breathing."} // "be able to tolerate a spontaneously breathing trial"
(declare-const patient_can_undergo_trial_for_spontaneous_breathing_now@@performed_for_at_least_2_minutes Bool) ;; {"when_to_set_to_true":"Set to true if the trial for spontaneous breathing is performed for at least 2 minutes.","when_to_set_to_false":"Set to false if the trial for spontaneous breathing is performed for less than 2 minutes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the trial for spontaneous breathing is performed for at least 2 minutes.","meaning":"Boolean indicating whether the trial for spontaneous breathing is performed for at least 2 minutes."} // "trial with T-piece for ≥ 2 minutes"
(declare-const patient_can_undergo_trial_for_spontaneous_breathing_now@@performed_with_t_piece Bool) ;; {"when_to_set_to_true":"Set to true if the trial for spontaneous breathing is performed with a T-piece.","when_to_set_to_false":"Set to false if the trial for spontaneous breathing is not performed with a T-piece.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the trial for spontaneous breathing is performed with a T-piece.","meaning":"Boolean indicating whether the trial for spontaneous breathing is performed with a T-piece."} // "trial with T-piece"
(declare-const patient_inspired_oxygen_concentration_value_recorded_now_withunit_fraction Real) ;; {"when_to_set_to_value":"Set to the measured fraction value if a numeric measurement of inspired oxygen concentration (FiO2) recorded now is available.","when_to_set_to_null":"Set to null if no such measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current fraction of inspired oxygen (FiO2)."} // "fraction of inspired oxygen < 0.4"
(declare-const patient_has_finding_of_hypoxemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hypoxemia.","when_to_set_to_false":"Set to false if the patient currently does not have hypoxemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypoxemia.","meaning":"Boolean indicating whether the patient currently has hypoxemia."} // "hypoxemia"
(declare-const patient_has_finding_of_hypoxemia_now@@develops_during_trial_for_spontaneous_breathing Bool) ;; {"when_to_set_to_true":"Set to true if hypoxemia develops during the trial for spontaneous breathing.","when_to_set_to_false":"Set to false if hypoxemia does not develop during the trial for spontaneous breathing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether hypoxemia develops during the trial for spontaneous breathing.","meaning":"Boolean indicating whether hypoxemia develops during the trial for spontaneous breathing."} // "without development of hypoxemia"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_can_undergo_trial_for_spontaneous_breathing_now@@performed_for_at_least_2_minutes
         patient_can_undergo_trial_for_spontaneous_breathing_now)
     :named REQ4_AUXILIARY0)) ;; "trial for spontaneous breathing performed for at least 2 minutes" implies "trial for spontaneous breathing"

(assert
  (! (=> patient_can_undergo_trial_for_spontaneous_breathing_now@@performed_with_t_piece
         patient_can_undergo_trial_for_spontaneous_breathing_now)
     :named REQ4_AUXILIARY1)) ;; "trial for spontaneous breathing performed with T-piece" implies "trial for spontaneous breathing"

(assert
  (! (=> patient_has_finding_of_hypoxemia_now@@develops_during_trial_for_spontaneous_breathing
         patient_has_finding_of_hypoxemia_now)
     :named REQ4_AUXILIARY2)) ;; "hypoxemia develops during trial" implies "hypoxemia"

;; ===================== Constraint Assertions (REQ 4) =====================
;; To be included, the patient must ((be able to breathe) OR (be able to tolerate a spontaneously breathing trial with T-piece for ≥ 2 minutes with fraction of inspired oxygen < 0.4 AND without development of hypoxemia)).
(assert
  (! (or
        patient_can_breathe_now
        (and patient_can_undergo_trial_for_spontaneous_breathing_now
             patient_can_undergo_trial_for_spontaneous_breathing_now@@performed_for_at_least_2_minutes
             patient_can_undergo_trial_for_spontaneous_breathing_now@@performed_with_t_piece
             (< patient_inspired_oxygen_concentration_value_recorded_now_withunit_fraction 0.4)
             (not patient_has_finding_of_hypoxemia_now@@develops_during_trial_for_spontaneous_breathing)))
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "be able to breathe OR be able to tolerate a spontaneously breathing trial with T-piece for ≥ 2 minutes with fraction of inspired oxygen < 0.4 AND without development of hypoxemia"

;; ===================== Declarations for the inclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_consciousness_related_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a consciousness-related finding (i.e., is conscious) at the present time.","when_to_set_to_false":"Set to false if the patient currently does not have a consciousness-related finding (i.e., is not conscious) at the present time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a consciousness-related finding at the present time.","meaning":"Boolean indicating whether the patient currently has a consciousness-related finding (i.e., is conscious) now."} // "have good consciousness"
(declare-const patient_has_finding_of_consciousness_related_finding_now@@good_quality Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a consciousness-related finding and the quality of consciousness is 'good'.","when_to_set_to_false":"Set to false if the patient currently has a consciousness-related finding but the quality of consciousness is not 'good'.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the quality of consciousness is 'good'.","meaning":"Boolean indicating whether the patient's current consciousness-related finding is of 'good' quality."} // "have good consciousness"
(declare-const patient_has_finding_of_cooperation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently demonstrates cooperation at the present time.","when_to_set_to_false":"Set to false if the patient currently does not demonstrate cooperation at the present time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently demonstrates cooperation at the present time.","meaning":"Boolean indicating whether the patient currently has cooperation now."} // "have good cooperation"
(declare-const patient_has_finding_of_cooperation_now@@good_quality Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently demonstrates cooperation and the quality of cooperation is 'good'.","when_to_set_to_false":"Set to false if the patient currently demonstrates cooperation but the quality of cooperation is not 'good'.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the quality of cooperation is 'good'.","meaning":"Boolean indicating whether the patient's current cooperation is of 'good' quality."} // "have good cooperation"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable for good consciousness implies consciousness
(assert
  (! (=> patient_has_finding_of_consciousness_related_finding_now@@good_quality
         patient_has_finding_of_consciousness_related_finding_now)
     :named REQ5_AUXILIARY0)) ;; "have good consciousness"

;; Qualifier variable for good cooperation implies cooperation
(assert
  (! (=> patient_has_finding_of_cooperation_now@@good_quality
         patient_has_finding_of_cooperation_now)
     :named REQ5_AUXILIARY1)) ;; "have good cooperation"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Component 0: patient must have good consciousness
(assert
  (! patient_has_finding_of_consciousness_related_finding_now@@good_quality
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "have good consciousness"

;; Component 1: patient must have good cooperation
(assert
  (! patient_has_finding_of_cooperation_now@@good_quality
     :named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "have good cooperation"
