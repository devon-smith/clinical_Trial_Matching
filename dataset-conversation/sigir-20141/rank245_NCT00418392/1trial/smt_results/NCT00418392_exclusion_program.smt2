;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_asthma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has asthma.","when_to_set_to_false":"Set to false if the patient currently does not have asthma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has asthma.","meaning":"Boolean indicating whether the patient currently has asthma."} ;; "asthma"
(declare-const patient_has_finding_of_bronchiectasis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has bronchiectasis.","when_to_set_to_false":"Set to false if the patient currently does not have bronchiectasis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has bronchiectasis.","meaning":"Boolean indicating whether the patient currently has bronchiectasis."} ;; "bronchiectasis"
(declare-const patient_has_finding_of_chronic_obstructive_lung_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chronic obstructive lung disease (COPD).","when_to_set_to_false":"Set to false if the patient currently does not have chronic obstructive lung disease (COPD).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chronic obstructive lung disease (COPD).","meaning":"Boolean indicating whether the patient currently has chronic obstructive lung disease (COPD)."} ;; "chronic obstructive pulmonary disease"
(declare-const patient_has_finding_of_disorder_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disorder of the lung (pulmonary disease).","when_to_set_to_false":"Set to false if the patient currently does not have any disorder of the lung (pulmonary disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any disorder of the lung (pulmonary disease).","meaning":"Boolean indicating whether the patient currently has any disorder of the lung (pulmonary disease)."} ;; "underlying pulmonary disease"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_asthma_now
           patient_has_finding_of_chronic_obstructive_lung_disease_now
           patient_has_finding_of_bronchiectasis_now)
       patient_has_finding_of_disorder_of_lung_now)
   :named REQ0_AUXILIARY0)) ;; "with non-exhaustive examples (asthma, chronic obstructive pulmonary disease, bronchiectasis)"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_disorder_of_lung_now)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has underlying pulmonary disease with non-exhaustive examples (asthma, chronic obstructive pulmonary disease, bronchiectasis)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_hemothorax_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hemothorax.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hemothorax.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hemothorax.","meaning":"Boolean indicating whether the patient currently has hemothorax."} ;; "hemothorax"
(declare-const patient_has_finding_of_tension_pneumothorax_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of tension pneumothorax.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of tension pneumothorax.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has tension pneumothorax.","meaning":"Boolean indicating whether the patient currently has tension pneumothorax."} ;; "tension pneumothorax"
(declare-const patient_has_finding_of_tension_pneumothorax_now@@requires_chest_tube_insertion Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current tension pneumothorax requires chest tube insertion.","when_to_set_to_false":"Set to false if the patient's current tension pneumothorax does not require chest tube insertion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current tension pneumothorax requires chest tube insertion.","meaning":"Boolean indicating whether the patient's current tension pneumothorax requires chest tube insertion."} ;; "tension pneumothorax requiring chest tube insertion"
(declare-const patient_has_finding_of_tension_pneumothorax_now@@requires_operation Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current tension pneumothorax requires operation.","when_to_set_to_false":"Set to false if the patient's current tension pneumothorax does not require operation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current tension pneumothorax requires operation.","meaning":"Boolean indicating whether the patient's current tension pneumothorax requires operation."} ;; "tension pneumothorax requiring operation"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_tension_pneumothorax_now@@requires_chest_tube_insertion
      patient_has_finding_of_tension_pneumothorax_now)
:named REQ1_AUXILIARY0)) ;; "tension pneumothorax requiring chest tube insertion"

(assert
(! (=> patient_has_finding_of_tension_pneumothorax_now@@requires_operation
      patient_has_finding_of_tension_pneumothorax_now)
:named REQ1_AUXILIARY1)) ;; "tension pneumothorax requiring operation"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_hemothorax_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hemothorax."

(assert
(! (not patient_has_finding_of_tension_pneumothorax_now@@requires_chest_tube_insertion)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has tension pneumothorax requiring chest tube insertion."

(assert
(! (not patient_has_finding_of_tension_pneumothorax_now@@requires_operation)
:named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has tension pneumothorax requiring operation."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_pneumothorax_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with pneumothorax at any time in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with pneumothorax at any time in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with pneumothorax.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of pneumothorax in their history."} ;; "history of previous pneumothorax"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_diagnosis_of_pneumothorax_inthehistory)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of previous pneumothorax."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_undergone_surgical_procedure_on_thorax_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a surgical procedure on the thorax (thoracic operation) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone a surgical procedure on the thorax (thoracic operation) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a surgical procedure on the thorax (thoracic operation).","meaning":"Boolean indicating whether the patient has ever undergone a surgical procedure on the thorax (thoracic operation) at any time in the past."} ;; "history of previous thoracic operation"
(declare-const patient_has_undergone_surgical_procedure_on_thorax_inthehistory@@ipsilateral Bool) ;; {"when_to_set_to_true":"Set to true if the surgical procedure on the thorax (thoracic operation) was performed on the same side (ipsilateral) as the relevant reference.","when_to_set_to_false":"Set to false if the surgical procedure on the thorax was not performed on the same side (ipsilateral) as the relevant reference.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the surgical procedure on the thorax was performed on the same side (ipsilateral) as the relevant reference.","meaning":"Boolean indicating whether the surgical procedure on the thorax was performed on the same side (ipsilateral) as the relevant reference."} ;; "ipsilateral thoracic operation"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_undergone_surgical_procedure_on_thorax_inthehistory@@ipsilateral
      patient_has_undergone_surgical_procedure_on_thorax_inthehistory)
:named REQ3_AUXILIARY0)) ;; "ipsilateral thoracic operation" implies "thoracic operation"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_undergone_surgical_procedure_on_thorax_inthehistory@@ipsilateral)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of previous ipsilateral thoracic operation."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_allergy_to_tetracycline_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented allergy to tetracycline.","when_to_set_to_false":"Set to false if the patient currently does not have a documented allergy to tetracycline.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an allergy to tetracycline.","meaning":"Boolean indicating whether the patient currently has an allergy to tetracycline."} ;; "allergy to tetracycline"
(declare-const patient_has_finding_of_allergy_to_minocycline_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented allergy to minocycline.","when_to_set_to_false":"Set to false if the patient currently does not have a documented allergy to minocycline.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an allergy to minocycline.","meaning":"Boolean indicating whether the patient currently has an allergy to minocycline."} ;; "allergy to minocycline"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_allergy_to_tetracycline_now)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an allergy to tetracycline."

(assert
(! (not patient_has_finding_of_allergy_to_minocycline_now)
:named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an allergy to minocycline."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as documented or reported.","when_to_set_to_false":"Set to false if the patient is currently not pregnant as documented or reported.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_lactating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently lactating as documented or reported.","when_to_set_to_false":"Set to false if the patient is currently not lactating as documented or reported.","when_to_set_to_null":"Set to null if the patient's current lactation status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently lactating."} ;; "the patient is lactating"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_is_pregnant_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

(assert
(! (not patient_is_lactating_now)
:named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is lactating."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_diagnosis_of_congestive_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of congestive heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of congestive heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of congestive heart failure.","meaning":"Boolean indicating whether the patient currently has a diagnosis of congestive heart failure."} ;; "congestive heart failure"
(declare-const patient_has_diagnosis_of_unstable_angina_pectoris_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of unstable angina pectoris.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of unstable angina pectoris.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of unstable angina pectoris.","meaning":"Boolean indicating whether the patient currently has a diagnosis of unstable angina pectoris."} ;; "unstable angina pectoris"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_diagnosis_of_congestive_heart_failure_now)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has congestive heart failure."

(assert
(! (not patient_has_diagnosis_of_unstable_angina_pectoris_now)
:named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has unstable angina pectoris."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_myocardial_infarction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of myocardial infarction at any time in the past.","when_to_set_to_false":"Set to false if the patient has no documented history of myocardial infarction at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of myocardial infarction.","meaning":"Boolean indicating whether the patient has ever had a myocardial infarction in their history."} ;; "myocardial infarction"
(declare-const patient_has_finding_of_myocardial_infarction_inthehistory@@temporalcontext_within1year_before_study_entry Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of myocardial infarction includes an event that occurred within one year before the study entry.","when_to_set_to_false":"Set to false if the patient's history of myocardial infarction does not include any event within one year before the study entry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether a myocardial infarction occurred within one year before the study entry.","meaning":"Boolean indicating whether the patient's myocardial infarction occurred within one year prior to study entry."} ;; "history of myocardial infarction within one year prior to the study entry"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_myocardial_infarction_inthehistory@@temporalcontext_within1year_before_study_entry
      patient_has_finding_of_myocardial_infarction_inthehistory)
   :named REQ7_AUXILIARY0)) ;; "history of myocardial infarction within one year prior to the study entry""

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_finding_of_myocardial_infarction_inthehistory@@temporalcontext_within1year_before_study_entry)
   :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of myocardial infarction within one year prior to the study entry."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_poor_hypertension_control_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of poor hypertension control (uncontrolled hypertension).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of poor hypertension control (uncontrolled hypertension).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has poor hypertension control.","meaning":"Boolean indicating whether the patient currently has poor hypertension control (uncontrolled hypertension)."} ;; "uncontrolled hypertension"
(declare-const patient_has_finding_of_conduction_disorder_of_the_heart_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of conduction disorder of the heart (arrhythmia).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of conduction disorder of the heart (arrhythmia).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has conduction disorder of the heart (arrhythmia).","meaning":"Boolean indicating whether the patient currently has conduction disorder of the heart (arrhythmia)."} ;; "arrhythmia"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_finding_of_poor_hypertension_control_now)
    :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has uncontrolled hypertension."

(assert
(! (not patient_has_finding_of_conduction_disorder_of_the_heart_now)
    :named REQ8_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has arrhythmia."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_history_of_significant_neurologic_disorder Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of any significant neurologic disorder.","when_to_set_to_false":"Set to false if the patient does not have a documented history of any significant neurologic disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of significant neurologic disorder.","meaning":"Boolean indicating whether the patient has a history of significant neurologic disorder of any type."} ;; "the patient has a history of significant neurologic disorder"
(declare-const patient_has_history_of_significant_psychiatric_disorder Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of any significant psychiatric disorder.","when_to_set_to_false":"Set to false if the patient does not have a documented history of any significant psychiatric disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of significant psychiatric disorder.","meaning":"Boolean indicating whether the patient has a history of significant psychiatric disorder of any type."} ;; "the patient has a history of significant psychiatric disorder"
(declare-const patient_has_finding_of_dementia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding of dementia documented at any point in their history.","when_to_set_to_false":"Set to false if the patient has never had a clinical finding of dementia documented in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had dementia.","meaning":"Boolean indicating whether the patient has ever had dementia in their history."} ;; "dementia"
(declare-const patient_has_finding_of_seizure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding of seizure documented at any point in their history.","when_to_set_to_false":"Set to false if the patient has never had a clinical finding of seizure documented in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had seizure.","meaning":"Boolean indicating whether the patient has ever had seizure in their history."} ;; "seizure"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Non-exhaustive examples imply umbrella term for significant psychiatric disorder
(assert
(! (=> (or patient_has_finding_of_dementia_inthehistory
          patient_has_finding_of_seizure_inthehistory)
    patient_has_history_of_significant_psychiatric_disorder)
:named REQ9_AUXILIARY0)) ;; "with non-exhaustive examples (dementia, seizure)"

;; ===================== Constraint Assertions (REQ 9) =====================
;; Exclusion: patient must NOT have a history of significant neurologic disorder OR significant psychiatric disorder
(assert
(! (not (or patient_has_history_of_significant_neurologic_disorder
            patient_has_history_of_significant_psychiatric_disorder))
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a history of significant neurologic disorder) OR (the patient has a history of significant psychiatric disorder with non-exhaustive examples (dementia, seizure))."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_finding_of_disorder_due_to_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder due to infection.","when_to_set_to_false":"Set to false if the patient currently does not have a disorder due to infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder due to infection.","meaning":"Boolean indicating whether the patient currently has a disorder due to infection."} ;; "infection"

(declare-const patient_has_finding_of_disorder_due_to_infection_now@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current disorder due to infection is active.","when_to_set_to_false":"Set to false if the patient's current disorder due to infection is not active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current disorder due to infection is active.","meaning":"Boolean indicating whether the patient's current disorder due to infection is active."} ;; "active infection"

(declare-const patient_has_finding_of_disorder_due_to_infection_now@@requires_intravenous_antibiotics Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current disorder due to infection requires intravenous antibiotics.","when_to_set_to_false":"Set to false if the patient's current disorder due to infection does not require intravenous antibiotics.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current disorder due to infection requires intravenous antibiotics.","meaning":"Boolean indicating whether the patient's current disorder due to infection requires intravenous antibiotics."} ;; "requires intravenous antibiotics"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Qualifier variable (active) implies stem variable
(assert
(! (=> patient_has_finding_of_disorder_due_to_infection_now@@active
      patient_has_finding_of_disorder_due_to_infection_now)
:named REQ10_AUXILIARY0)) ;; "active infection"

;; Qualifier variable (requires intravenous antibiotics) implies stem variable
(assert
(! (=> patient_has_finding_of_disorder_due_to_infection_now@@requires_intravenous_antibiotics
      patient_has_finding_of_disorder_due_to_infection_now)
:named REQ10_AUXILIARY1)) ;; "requires intravenous antibiotics"

;; ===================== Constraint Assertions (REQ 10) =====================
;; Exclusion: patient must NOT have an active infection that requires intravenous antibiotics
(assert
(! (not (and patient_has_finding_of_disorder_due_to_infection_now@@active
             patient_has_finding_of_disorder_due_to_infection_now@@requires_intravenous_antibiotics))
:named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an active infection that requires intravenous antibiotics."
