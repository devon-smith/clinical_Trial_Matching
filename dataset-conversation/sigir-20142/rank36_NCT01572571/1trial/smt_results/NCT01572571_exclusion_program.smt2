;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_undergoing_cardiopulmonary_resuscitation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is actively undergoing cardiopulmonary resuscitation at the present time.","when_to_set_to_false":"Set to false if the patient is not undergoing cardiopulmonary resuscitation at the present time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing cardiopulmonary resuscitation.","meaning":"Boolean indicating whether the patient is currently undergoing cardiopulmonary resuscitation."} ;; "cardiopulmonary resuscitation"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_is_undergoing_cardiopulmonary_resuscitation_now)
     :named REQ0_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is undergoing cardiopulmonary resuscitation."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_traumatic_injury_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a traumatic injury.","when_to_set_to_false":"Set to false if the patient currently does not have a traumatic injury.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a traumatic injury.","meaning":"Boolean indicating whether the patient currently has a traumatic injury."} ;; "trauma"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (not patient_has_finding_of_traumatic_injury_now)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has trauma."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_electrocardiographic_diagnosis_of_st_segment_elevation_myocardial_infarction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an electrocardiographic diagnosis of ST segment elevation myocardial infarction (STEMI).","when_to_set_to_false":"Set to false if the patient currently does not have an electrocardiographic diagnosis of ST segment elevation myocardial infarction (STEMI).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an electrocardiographic diagnosis of ST segment elevation myocardial infarction (STEMI).","meaning":"Boolean indicating whether the patient currently has an electrocardiographic diagnosis of ST segment elevation myocardial infarction (STEMI)."} ;; "the patient has an electrocardiographic diagnosis of ST elevation myocardial infarction"
(declare-const patient_has_electrocardiographic_diagnosis_of_non_st_segment_elevation_myocardial_infarction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an electrocardiographic diagnosis of non-ST segment elevation myocardial infarction (NSTEMI).","when_to_set_to_false":"Set to false if the patient currently does not have an electrocardiographic diagnosis of non-ST segment elevation myocardial infarction (NSTEMI).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an electrocardiographic diagnosis of non-ST segment elevation myocardial infarction (NSTEMI).","meaning":"Boolean indicating whether the patient currently has an electrocardiographic diagnosis of non-ST segment elevation myocardial infarction (NSTEMI)."} ;; "the patient has an electrocardiographic diagnosis of non-ST elevation myocardial infarction"
(declare-const patient_has_clinical_diagnosis_of_st_segment_elevation_myocardial_infarction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical diagnosis of ST segment elevation myocardial infarction (STEMI).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical diagnosis of ST segment elevation myocardial infarction (STEMI).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical diagnosis of ST segment elevation myocardial infarction (STEMI).","meaning":"Boolean indicating whether the patient currently has a clinical diagnosis of ST segment elevation myocardial infarction (STEMI)."} ;; "the patient has a clinical diagnosis of ST elevation myocardial infarction"
(declare-const patient_has_clinical_diagnosis_of_non_st_segment_elevation_myocardial_infarction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical diagnosis of non-ST segment elevation myocardial infarction (NSTEMI).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical diagnosis of non-ST segment elevation myocardial infarction (NSTEMI).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical diagnosis of non-ST segment elevation myocardial infarction (NSTEMI).","meaning":"Boolean indicating whether the patient currently has a clinical diagnosis of non-ST segment elevation myocardial infarction (NSTEMI)."} ;; "the patient has a clinical diagnosis of non-ST elevation myocardial infarction"
(declare-const patient_has_diagnosis_of_acute_st_segment_elevation_myocardial_infarction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of acute ST segment elevation myocardial infarction (STEMI), whether by clinical or electrocardiographic means.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of acute ST segment elevation myocardial infarction (STEMI).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of acute ST segment elevation myocardial infarction (STEMI).","meaning":"Boolean indicating whether the patient currently has a diagnosis of acute ST segment elevation myocardial infarction (STEMI), regardless of diagnostic modality."} ;; "ST elevation myocardial infarction"
(declare-const patient_has_diagnosis_of_acute_non_st_segment_elevation_myocardial_infarction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of acute non-ST segment elevation myocardial infarction (NSTEMI), whether by clinical or electrocardiographic means.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of acute non-ST segment elevation myocardial infarction (NSTEMI).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of acute non-ST segment elevation myocardial infarction (NSTEMI).","meaning":"Boolean indicating whether the patient currently has a diagnosis of acute non-ST segment elevation myocardial infarction (NSTEMI), regardless of diagnostic modality."} ;; "non-ST elevation myocardial infarction"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; The umbrella variable for STEMI is true if either clinical or ECG diagnosis is present
(assert
(! (= patient_has_diagnosis_of_acute_st_segment_elevation_myocardial_infarction_now
     (or patient_has_electrocardiographic_diagnosis_of_st_segment_elevation_myocardial_infarction_now
         patient_has_clinical_diagnosis_of_st_segment_elevation_myocardial_infarction_now))
:named REQ2_AUXILIARY0)) ;; "ST elevation myocardial infarction" = (electrocardiographic diagnosis of STEMI OR clinical diagnosis of STEMI)

;; The umbrella variable for NSTEMI is true if either clinical or ECG diagnosis is present
(assert
(! (= patient_has_diagnosis_of_acute_non_st_segment_elevation_myocardial_infarction_now
     (or patient_has_electrocardiographic_diagnosis_of_non_st_segment_elevation_myocardial_infarction_now
         patient_has_clinical_diagnosis_of_non_st_segment_elevation_myocardial_infarction_now))
:named REQ2_AUXILIARY1)) ;; "non-ST elevation myocardial infarction" = (electrocardiographic diagnosis of NSTEMI OR clinical diagnosis of NSTEMI)

;; Qualifier variables imply corresponding umbrella variables
(assert
(! (=> patient_has_electrocardiographic_diagnosis_of_st_segment_elevation_myocardial_infarction_now
       patient_has_diagnosis_of_acute_st_segment_elevation_myocardial_infarction_now)
:named REQ2_AUXILIARY2)) ;; "electrocardiographic diagnosis of ST elevation myocardial infarction" implies "ST elevation myocardial infarction"

(assert
(! (=> patient_has_clinical_diagnosis_of_st_segment_elevation_myocardial_infarction_now
       patient_has_diagnosis_of_acute_st_segment_elevation_myocardial_infarction_now)
:named REQ2_AUXILIARY3)) ;; "clinical diagnosis of ST elevation myocardial infarction" implies "ST elevation myocardial infarction"

(assert
(! (=> patient_has_electrocardiographic_diagnosis_of_non_st_segment_elevation_myocardial_infarction_now
       patient_has_diagnosis_of_acute_non_st_segment_elevation_myocardial_infarction_now)
:named REQ2_AUXILIARY4)) ;; "electrocardiographic diagnosis of non-ST elevation myocardial infarction" implies "non-ST elevation myocardial infarction"

(assert
(! (=> patient_has_clinical_diagnosis_of_non_st_segment_elevation_myocardial_infarction_now
       patient_has_diagnosis_of_acute_non_st_segment_elevation_myocardial_infarction_now)
:named REQ2_AUXILIARY5)) ;; "clinical diagnosis of non-ST elevation myocardial infarction" implies "non-ST elevation myocardial infarction"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_electrocardiographic_diagnosis_of_st_segment_elevation_myocardial_infarction_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an electrocardiographic diagnosis of ST elevation myocardial infarction."

(assert
(! (not patient_has_electrocardiographic_diagnosis_of_non_st_segment_elevation_myocardial_infarction_now)
:named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an electrocardiographic diagnosis of non-ST elevation myocardial infarction."

(assert
(! (not patient_has_clinical_diagnosis_of_st_segment_elevation_myocardial_infarction_now)
:named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a clinical diagnosis of ST elevation myocardial infarction."

(assert
(! (not patient_has_clinical_diagnosis_of_non_st_segment_elevation_myocardial_infarction_now)
:named REQ2_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a clinical diagnosis of non-ST elevation myocardial infarction."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_hemorrhage_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hemorrhage.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hemorrhage.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of hemorrhage.","meaning":"Boolean indicating whether the patient currently has hemorrhage."} ;; "hemorrhage"
(declare-const patient_has_finding_of_gastrointestinal_hemorrhage_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of gastrointestinal hemorrhage (gastrointestinal bleeding).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of gastrointestinal hemorrhage.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of gastrointestinal hemorrhage.","meaning":"Boolean indicating whether the patient currently has gastrointestinal hemorrhage."} ;; "gastrointestinal bleeding"
(declare-const patient_has_finding_of_drug_overdose_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of drug overdose.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of drug overdose.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of drug overdose.","meaning":"Boolean indicating whether the patient currently has drug overdose."} ;; "drug overdose"
(declare-const patient_has_finding_of_shock_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of shock.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of shock.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of shock.","meaning":"Boolean indicating whether the patient currently has shock."} ;; "shock"
(declare-const patient_has_finding_of_shock_now@@has_clear_cause_needing_immediate_intervention Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current shock has a clear cause that requires immediate intervention (e.g., hemorrhage, gastrointestinal bleeding, drug overdose).","when_to_set_to_false":"Set to false if the patient's current shock does not have a clear cause needing immediate intervention.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current shock has a clear cause needing immediate intervention.","meaning":"Boolean indicating whether the patient's current shock has a clear cause that needs immediate intervention."} ;; "shock has a clear cause that needs immediate intervention"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_hemorrhage_now
          patient_has_finding_of_gastrointestinal_hemorrhage_now
          patient_has_finding_of_drug_overdose_now)
    patient_has_finding_of_shock_now@@has_clear_cause_needing_immediate_intervention)
:named REQ3_AUXILIARY0)) ;; "with non-exhaustive examples (hemorrhage, gastrointestinal bleeding, drug overdose)"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_shock_now@@has_clear_cause_needing_immediate_intervention
    patient_has_finding_of_shock_now)
:named REQ3_AUXILIARY1)) ;; "shock has a clear cause needing immediate intervention" implies "shock"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_shock_now@@has_clear_cause_needing_immediate_intervention)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a clear cause of shock that needs immediate intervention with non-exhaustive examples (hemorrhage, gastrointestinal bleeding, drug overdose)."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_shock_now@@late_evolution_phase Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has shock and the shock is in a late evolution phase.","when_to_set_to_false":"Set to false if the patient currently has shock but it is not in a late evolution phase, or if the patient does not have shock.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the shock is in a late evolution phase.","meaning":"Boolean indicating whether the patient's current shock is in a late evolution phase."} ;; "the patient has a late evolution of shock state"
(declare-const patient_has_been_treated_with_diagnostic_tests_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has already been treated with diagnostic tests in the history.","when_to_set_to_false":"Set to false if the patient has not been treated with diagnostic tests in the history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has already been treated with diagnostic tests in the history.","meaning":"Boolean indicating whether the patient has already been treated with diagnostic tests in the history."} ;; "the patient has already been treated with diagnostic tests"
(declare-const patient_has_been_treated_with_diagnostic_tests_in_the_history@@known Bool) ;; {"when_to_set_to_true":"Set to true if the patient has already been treated with diagnostic tests in the history and the diagnostic tests are known.","when_to_set_to_false":"Set to false if the patient has already been treated with diagnostic tests in the history but the diagnostic tests are not known, or if the patient has not been treated with diagnostic tests in the history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnostic tests are known.","meaning":"Boolean indicating whether the patient has already been treated with diagnostic tests in the history and the diagnostic tests are known."} ;; "the patient has already been treated with known diagnostic tests"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_been_treated_with_diagnostic_tests_in_the_history@@known
       patient_has_been_treated_with_diagnostic_tests_in_the_history)
   :named REQ4_AUXILIARY0)) ;; "the patient has already been treated with known diagnostic tests""

;; Qualifier variable for shock implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_shock_now@@late_evolution_phase
       patient_has_finding_of_shock_now)
   :named REQ4_AUXILIARY1)) ;; "the patient has a late evolution of shock state"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Exclusion: patient must NOT have BOTH late evolution of shock state AND already been treated with known diagnostic tests
(assert
(! (not (and patient_has_finding_of_shock_now@@late_evolution_phase
             patient_has_been_treated_with_diagnostic_tests_in_the_history@@known))
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a late evolution of shock state) AND (the patient has already been treated with known diagnostic tests)."
