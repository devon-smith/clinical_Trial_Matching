;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "age ≥ 1 year AND age ≤ 18 years"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: To be included, the patient must be age ≥ 1 year.
(assert
  (! (>= patient_age_value_recorded_now_in_years 1)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be age ≥ 1 year."

;; Component 1: To be included, the patient must be age ≤ 18 years.
(assert
  (! (<= patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be age ≤ 18 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_clinical_sign_or_symptom_of_obstructive_sleep_apnea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has at least one clinical sign or symptom of obstructive sleep apnea.","when_to_set_to_false":"Set to false if the patient currently does not have any clinical sign or symptom of obstructive sleep apnea.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any clinical sign or symptom of obstructive sleep apnea.","meaning":"Boolean indicating whether the patient currently has at least one clinical sign or symptom of obstructive sleep apnea."} ;; "clinical sign or symptom of obstructive sleep apnea"
(declare-const patient_has_diagnosis_of_obstructive_sleep_apnea_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of obstructive sleep apnea syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of obstructive sleep apnea syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of obstructive sleep apnea syndrome.","meaning":"Boolean indicating whether the patient currently has a diagnosis of obstructive sleep apnea syndrome."} ;; "obstructive sleep apnea"
(declare-const patient_has_finding_of_cyanosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of cyanosis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of cyanosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of cyanosis.","meaning":"Boolean indicating whether the patient currently has the clinical finding of cyanosis."} ;; "cyanosis"
(declare-const patient_has_finding_of_daytime_somnolence_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of daytime somnolence.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of daytime somnolence.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of daytime somnolence.","meaning":"Boolean indicating whether the patient currently has the clinical finding of daytime somnolence."} ;; "daytime somnolence"
(declare-const patient_has_finding_of_restless_sleep_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of restless sleep.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of restless sleep.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of restless sleep.","meaning":"Boolean indicating whether the patient currently has the clinical finding of restless sleep."} ;; "restless sleeping"
(declare-const patient_has_finding_of_snoring_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of snoring.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of snoring.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of snoring.","meaning":"Boolean indicating whether the patient currently has the clinical finding of snoring."} ;; "snoring"
(declare-const patient_has_finding_of_witnessed_apneas_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of witnessed apneas.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of witnessed apneas.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of witnessed apneas.","meaning":"Boolean indicating whether the patient currently has the clinical finding of witnessed apneas."} ;; "witnessed apneas"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Non-exhaustive examples imply the umbrella term
(assert
  (! (=> (or patient_has_finding_of_snoring_now
            patient_has_finding_of_witnessed_apneas_now
            patient_has_finding_of_daytime_somnolence_now
            patient_has_finding_of_restless_sleep_now
            patient_has_finding_of_cyanosis_now)
         patient_has_clinical_sign_or_symptom_of_obstructive_sleep_apnea_now)
     :named REQ1_AUXILIARY0)) ;; "such as snoring, witnessed apneas, daytime somnolence, restless sleeping, or cyanosis" (non-exhaustive examples)

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_clinical_sign_or_symptom_of_obstructive_sleep_apnea_now
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "must have at least one clinical sign or symptom of obstructive sleep apnea"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_mild_obstructive_sleep_apnea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has mild obstructive sleep apnea.","when_to_set_to_false":"Set to false if the patient currently does not have mild obstructive sleep apnea.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has mild obstructive sleep apnea.","meaning":"Boolean indicating whether the patient currently has mild obstructive sleep apnea."} ;; "mild obstructive sleep apnea"
(declare-const patient_has_finding_of_moderate_obstructive_sleep_apnea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has moderate obstructive sleep apnea.","when_to_set_to_false":"Set to false if the patient currently does not have moderate obstructive sleep apnea.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has moderate obstructive sleep apnea.","meaning":"Boolean indicating whether the patient currently has moderate obstructive sleep apnea."} ;; "moderate obstructive sleep apnea"
(declare-const patient_has_finding_of_severe_obstructive_sleep_apnea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has severe obstructive sleep apnea.","when_to_set_to_false":"Set to false if the patient currently does not have severe obstructive sleep apnea.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has severe obstructive sleep apnea.","meaning":"Boolean indicating whether the patient currently has severe obstructive sleep apnea."} ;; "severe obstructive sleep apnea"
(declare-const patient_has_undergone_polysomnography_now_outcome_is_abnormal Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone polysomnography now and the outcome was abnormal.","when_to_set_to_false":"Set to false if the patient has undergone polysomnography now and the outcome was not abnormal, or if the patient has not undergone polysomnography now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone polysomnography now and the outcome was abnormal.","meaning":"Boolean indicating whether the patient has undergone polysomnography now and the outcome was abnormal."} ;; "abnormal polysomnogram"
(declare-const patient_has_undergone_polysomnography_now_outcome_is_abnormal@@includes_carbon_dioxide_measures Bool) ;; {"when_to_set_to_true":"Set to true if the patient's abnormal polysomnography included carbon dioxide measures.","when_to_set_to_false":"Set to false if the patient's abnormal polysomnography did not include carbon dioxide measures.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether carbon dioxide measures were included in the abnormal polysomnography.","meaning":"Boolean indicating whether the patient's abnormal polysomnography included carbon dioxide measures."} ;; "including carbon dioxide measures"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Umbrella term: abnormal polysomnogram (with subcategories: mild, moderate, severe OSA)
(assert
  (! (= patient_has_undergone_polysomnography_now_outcome_is_abnormal
        (or patient_has_finding_of_mild_obstructive_sleep_apnea_now
            patient_has_finding_of_moderate_obstructive_sleep_apnea_now
            patient_has_finding_of_severe_obstructive_sleep_apnea_now))
     :named REQ2_AUXILIARY0)) ;; "abnormal polysomnogram (mild obstructive sleep apnea OR moderate obstructive sleep apnea OR severe obstructive sleep apnea)"

;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_undergone_polysomnography_now_outcome_is_abnormal@@includes_carbon_dioxide_measures
         patient_has_undergone_polysomnography_now_outcome_is_abnormal)
     :named REQ2_AUXILIARY1)) ;; "including carbon dioxide measures"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_undergone_polysomnography_now_outcome_is_abnormal@@includes_carbon_dioxide_measures
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have an abnormal polysomnogram (mild obstructive sleep apnea OR moderate obstructive sleep apnea OR severe obstructive sleep apnea) including carbon dioxide measures."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_failed_trial_of_continuous_positive_airway_pressure_therapy_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has failed a trial of continuous positive airway pressure therapy at any time in the history.","when_to_set_to_false":"Set to false if the patient has not failed a trial of continuous positive airway pressure therapy at any time in the history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has failed a trial of continuous positive airway pressure therapy in the history.","meaning":"Boolean indicating whether the patient has failed a trial of continuous positive airway pressure therapy in the history."} ;; "failed a trial of continuous positive airway pressure therapy"
(declare-const patient_has_refused_trial_of_continuous_positive_airway_pressure_therapy_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has refused a trial of continuous positive airway pressure therapy at any time in the history.","when_to_set_to_false":"Set to false if the patient has not refused a trial of continuous positive airway pressure therapy at any time in the history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has refused a trial of continuous positive airway pressure therapy in the history.","meaning":"Boolean indicating whether the patient has refused a trial of continuous positive airway pressure therapy in the history."} ;; "refused a trial of continuous positive airway pressure therapy"
(declare-const continuous_positive_airway_pressure_therapy_was_not_recommended_by_pulmonologist_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if continuous positive airway pressure therapy was not recommended by the patient's pulmonologist at any time in the history.","when_to_set_to_false":"Set to false if continuous positive airway pressure therapy was recommended by the patient's pulmonologist at any time in the history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether continuous positive airway pressure therapy was not recommended by the patient's pulmonologist in the history.","meaning":"Boolean indicating whether continuous positive airway pressure therapy was not recommended by the patient's pulmonologist in the history."} ;; "continuous positive airway pressure therapy was not recommended by their pulmonologist"
(declare-const continuous_positive_airway_pressure_therapy_was_not_recommended_by_primary_care_doctor_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if continuous positive airway pressure therapy was not recommended by the patient's primary care doctor at any time in the history.","when_to_set_to_false":"Set to false if continuous positive airway pressure therapy was recommended by the patient's primary care doctor at any time in the history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether continuous positive airway pressure therapy was not recommended by the patient's primary care doctor in the history.","meaning":"Boolean indicating whether continuous positive airway pressure therapy was not recommended by the patient's primary care doctor in the history."} ;; "continuous positive airway pressure therapy was not recommended by their primary care doctor"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: To be included, the patient must have (failed a trial of continuous positive airway pressure therapy OR refused a trial of continuous positive airway pressure therapy OR continuous positive airway pressure therapy was not recommended by their pulmonologist OR continuous positive airway pressure therapy was not recommended by their primary care doctor).
(assert
  (! (or patient_has_failed_trial_of_continuous_positive_airway_pressure_therapy_in_the_history
         patient_has_refused_trial_of_continuous_positive_airway_pressure_therapy_in_the_history
         continuous_positive_airway_pressure_therapy_was_not_recommended_by_pulmonologist_in_the_history
         continuous_positive_airway_pressure_therapy_was_not_recommended_by_primary_care_doctor_in_the_history)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "failed a trial of continuous positive airway pressure therapy OR refused a trial of continuous positive airway pressure therapy OR continuous positive airway pressure therapy was not recommended by their pulmonologist OR continuous positive airway pressure therapy was not recommended by their primary care doctor"
