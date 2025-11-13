;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_sought_medical_assistance_at_respiratory_clinic_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has sought medical assistance at a respiratory clinic at the present time.","when_to_set_to_false":"Set to false if the patient has not sought medical assistance at a respiratory clinic at the present time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has sought medical assistance at a respiratory clinic at the present time.","meaning":"Boolean indicating whether the patient has sought medical assistance at a respiratory clinic at the present time."} // "the patient must seek medical assistance at a respiratory clinic"
(declare-const patient_has_suspicion_of_acute_bronchitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently suspected to have acute bronchitis.","when_to_set_to_false":"Set to false if the patient is currently not suspected to have acute bronchitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently suspected to have acute bronchitis.","meaning":"Boolean indicating whether the patient is currently suspected to have acute bronchitis."} // "symptoms suggesting acute bronchitis"
(declare-const patient_has_suspicion_of_acute_bronchitis_now@@suggested_by_symptoms Bool) ;; {"when_to_set_to_true":"Set to true if the suspicion of acute bronchitis is suggested by symptoms.","when_to_set_to_false":"Set to false if the suspicion of acute bronchitis is not suggested by symptoms.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether symptoms suggest the suspicion of acute bronchitis.","meaning":"Boolean indicating whether the suspicion of acute bronchitis is suggested by symptoms."} // "symptoms suggesting acute bronchitis"

(declare-const patient_has_symptom_of_dyspnea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has dyspnea.","when_to_set_to_false":"Set to false if the patient currently does not have dyspnea.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has dyspnea.","meaning":"Boolean indicating whether the patient currently has dyspnea."} // "dyspnea"
(declare-const patient_has_symptom_of_sputum_production_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has sputum production.","when_to_set_to_false":"Set to false if the patient currently does not have sputum production.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has sputum production.","meaning":"Boolean indicating whether the patient currently has sputum production."} // "sputum production"
(declare-const patient_has_symptom_of_sputum_purulence_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has sputum purulence.","when_to_set_to_false":"Set to false if the patient currently does not have sputum purulence.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has sputum purulence.","meaning":"Boolean indicating whether the patient currently has sputum purulence."} // "sputum purulence"
(declare-const patient_has_symptom_of_wheeze_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has wheeze.","when_to_set_to_false":"Set to false if the patient currently does not have wheeze.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has wheeze.","meaning":"Boolean indicating whether the patient currently has wheeze."} // "wheeze"
(declare-const patient_has_symptom_of_cough_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cough.","when_to_set_to_false":"Set to false if the patient currently does not have cough.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cough.","meaning":"Boolean indicating whether the patient currently has cough."} // "cough"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Non-exhaustive examples imply umbrella term
(assert
  (! (=> (or patient_has_symptom_of_dyspnea_now
             patient_has_symptom_of_sputum_production_now
             patient_has_symptom_of_sputum_purulence_now
             patient_has_symptom_of_wheeze_now
             patient_has_symptom_of_cough_now)
         patient_has_suspicion_of_acute_bronchitis_now@@suggested_by_symptoms)
     :named REQ0_AUXILIARY0)) ;; "with non-exhaustive examples (dyspnea OR sputum production OR sputum purulence OR wheeze OR cough)"

;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_suspicion_of_acute_bronchitis_now@@suggested_by_symptoms
         patient_has_suspicion_of_acute_bronchitis_now)
     :named REQ0_AUXILIARY1)) ;; "symptoms suggesting acute bronchitis"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (and patient_has_sought_medical_assistance_at_respiratory_clinic_now
          patient_has_suspicion_of_acute_bronchitis_now@@suggested_by_symptoms)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must seek medical assistance at a respiratory clinic for symptoms suggesting acute bronchitis"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_medical_history_free_of_chronic_obstructive_pulmonary_disease Bool) ;; {"when_to_set_to_true":"Set to true if the patient's medical history does not include chronic obstructive pulmonary disease.","when_to_set_to_false":"Set to false if the patient's medical history includes chronic obstructive pulmonary disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's medical history includes chronic obstructive pulmonary disease.","meaning":"Boolean indicating whether the patient's medical history is free of chronic obstructive pulmonary disease."} // "medical history free of chronic obstructive pulmonary disease"
(declare-const patient_medical_history_free_of_asthma Bool) ;; {"when_to_set_to_true":"Set to true if the patient's medical history does not include asthma.","when_to_set_to_false":"Set to false if the patient's medical history includes asthma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's medical history includes asthma.","meaning":"Boolean indicating whether the patient's medical history is free of asthma."} // "medical history free of asthma"
(declare-const patient_medical_history_free_of_pneumonia Bool) ;; {"when_to_set_to_true":"Set to true if the patient's medical history does not include pneumonia.","when_to_set_to_false":"Set to false if the patient's medical history includes pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's medical history includes pneumonia.","meaning":"Boolean indicating whether the patient's medical history is free of pneumonia."} // "medical history free of pneumonia"
(declare-const patient_medical_history_free_of_other_chronic_respiratory_diseases Bool) ;; {"when_to_set_to_true":"Set to true if the patient's medical history does not include any other chronic respiratory diseases (excluding chronic obstructive pulmonary disease, asthma, and pneumonia).","when_to_set_to_false":"Set to false if the patient's medical history includes any other chronic respiratory diseases (excluding chronic obstructive pulmonary disease, asthma, and pneumonia).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's medical history includes other chronic respiratory diseases.","meaning":"Boolean indicating whether the patient's medical history is free of other chronic respiratory diseases (excluding chronic obstructive pulmonary disease, asthma, and pneumonia)."} // "medical history free of other chronic respiratory diseases"
(declare-const patient_medical_history_free_of_congestive_cardiac_failure Bool) ;; {"when_to_set_to_true":"Set to true if the patient's medical history does not include congestive cardiac failure.","when_to_set_to_false":"Set to false if the patient's medical history includes congestive cardiac failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's medical history includes congestive cardiac failure.","meaning":"Boolean indicating whether the patient's medical history is free of congestive cardiac failure."} // "medical history free of congestive cardiac failure"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_medical_history_free_of_chronic_obstructive_pulmonary_disease
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "medical history free of chronic obstructive pulmonary disease"
(assert
  (! patient_medical_history_free_of_asthma
     :named REQ1_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "medical history free of asthma"
(assert
  (! patient_medical_history_free_of_pneumonia
     :named REQ1_COMPONENT2_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "medical history free of pneumonia"
(assert
  (! patient_medical_history_free_of_other_chronic_respiratory_diseases
     :named REQ1_COMPONENT3_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "medical history free of other chronic respiratory diseases"
(assert
  (! patient_medical_history_free_of_congestive_cardiac_failure
     :named REQ1_COMPONENT4_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "medical history free of congestive cardiac failure"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const initiation_of_symptoms_time_since_onset_in_hours Real) ;; {"when_to_set_to_value":"Set to the number of hours since the patient first experienced initiation of symptoms, as determined from clinical history or documentation.","when_to_set_to_null":"Set to null if the time since initiation of symptoms is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the number of hours since the patient first experienced initiation of symptoms."} // "initiation of symptoms within the past seventy-two hours"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (<= initiation_of_symptoms_time_since_onset_in_hours 72.0)
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must have had initiation of symptoms within the past seventy-two hours"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_undergone_therapeutic_procedure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone any therapeutic procedure at any time in their history.","when_to_set_to_false":"Set to false if the patient has not undergone any therapeutic procedure at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone any therapeutic procedure in their history.","meaning":"Boolean indicating whether the patient has undergone any therapeutic procedure at any time in their history."} // "therapeutic intervention"
(declare-const patient_has_undergone_therapeutic_procedure_inthehistory@@is_new_intervention Bool) ;; {"when_to_set_to_true":"Set to true if the therapeutic procedure undergone by the patient is considered 'new'.","when_to_set_to_false":"Set to false if the therapeutic procedure undergone by the patient is not considered 'new'.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the therapeutic procedure is 'new'.","meaning":"Boolean indicating whether the therapeutic procedure undergone by the patient is considered 'new'."} // "new therapeutic intervention"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_undergone_therapeutic_procedure_inthehistory@@is_new_intervention
        patient_has_undergone_therapeutic_procedure_inthehistory)
     :named REQ3_AUXILIARY0)) ;; "the therapeutic procedure undergone by the patient is considered 'new'"

;; ===================== Constraint Assertions (REQ 3) =====================
;; The patient must have abstained from any new therapeutic intervention
(assert
  (! (not patient_has_undergone_therapeutic_procedure_inthehistory@@is_new_intervention)
     :named REQ3_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must have abstained from any new therapeutic intervention"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_clinical_signs_of_sign_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any clinical signs.","when_to_set_to_false":"Set to false if the patient currently does not have any clinical signs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any clinical signs.","meaning":"Boolean indicating whether the patient currently has any clinical signs."} // "signs"
(declare-const patient_has_clinical_signs_of_sign_now@@suggestive_of_clinical_condition_requiring_hospitalization Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current clinical signs are suggestive of a clinical condition requiring hospitalization.","when_to_set_to_false":"Set to false if the patient's current clinical signs are not suggestive of a clinical condition requiring hospitalization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current clinical signs are suggestive of a clinical condition requiring hospitalization.","meaning":"Boolean indicating whether the patient's current clinical signs are suggestive of a clinical condition requiring hospitalization."} // "signs suggestive of a clinical condition requiring hospitalization"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_clinical_signs_of_sign_now@@suggestive_of_clinical_condition_requiring_hospitalization
         patient_has_clinical_signs_of_sign_now)
     :named REQ4_AUXILIARY0)) ;; "signs suggestive of a clinical condition requiring hospitalization" implies "signs"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: To be included, the patient must NOT have any signs suggestive of a clinical condition requiring hospitalization.
(assert
  (! (not patient_has_clinical_signs_of_sign_now@@suggestive_of_clinical_condition_requiring_hospitalization)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT have any signs suggestive of a clinical condition requiring hospitalization."
