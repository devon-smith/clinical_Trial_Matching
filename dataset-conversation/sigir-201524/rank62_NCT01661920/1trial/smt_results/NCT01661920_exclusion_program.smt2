;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_human_immunodeficiency_virus_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has human immunodeficiency virus infection.","when_to_set_to_false":"Set to false if the patient currently does not have human immunodeficiency virus infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has human immunodeficiency virus infection.","meaning":"Boolean indicating whether the patient currently has human immunodeficiency virus infection."} ;; "human immunodeficiency virus infection"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_human_immunodeficiency_virus_infection_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has human immunodeficiency virus infection."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_neutropenia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has neutropenia.","when_to_set_to_false":"Set to false if the patient currently does not have neutropenia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has neutropenia.","meaning":"Boolean indicating whether the patient currently has neutropenia."} ;; "neutropenia"
(declare-const patient_has_finding_of_patient_immunosuppressed_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently immunosuppressed.","when_to_set_to_false":"Set to false if the patient is currently not immunosuppressed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently immunosuppressed.","meaning":"Boolean indicating whether the patient is currently immunosuppressed."} ;; "immunosuppressed"
(declare-const patient_has_undergone_solid_organ_transplant_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a solid organ transplant.","when_to_set_to_false":"Set to false if the patient has never undergone a solid organ transplant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a solid organ transplant.","meaning":"Boolean indicating whether the patient has ever undergone a solid organ transplant."} ;; "solid organ transplant"
(declare-const patient_has_undergone_splenectomy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a splenectomy.","when_to_set_to_false":"Set to false if the patient has never undergone a splenectomy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a splenectomy.","meaning":"Boolean indicating whether the patient has ever undergone a splenectomy."} ;; "splenectomy"
(declare-const patient_is_exposed_to_immunodepressors_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently being treated with immunodepressors.","when_to_set_to_false":"Set to false if the patient is currently not being treated with immunodepressors.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being treated with immunodepressors.","meaning":"Boolean indicating whether the patient is currently being treated with immunodepressors."} ;; "being treated with other immunodepressors"
(declare-const patient_is_exposed_to_prednisone_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently being treated with prednisone.","when_to_set_to_false":"Set to false if the patient is currently not being treated with prednisone.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being treated with prednisone.","meaning":"Boolean indicating whether the patient is currently being treated with prednisone."} ;; "prednisone"
(declare-const patient_prednisone_value_recorded_now_withunit_days Real) ;; {"when_to_set_to_value":"Set to the number of days if the duration of current prednisone treatment is documented.","when_to_set_to_null":"Set to null if the duration is not documented, unknown, or cannot be determined.","meaning":"Numeric value representing the duration in days of current prednisone treatment."} ;; "prednisone dose ≥ 10 milligrams per day for longer than 30 days"
(declare-const patient_prednisone_value_recorded_now_withunit_milligrams_per_day Real) ;; {"when_to_set_to_value":"Set to the measured daily dose in milligrams per day if the patient is currently being treated with prednisone and the dose is documented.","when_to_set_to_null":"Set to null if the daily dose is not documented, unknown, or cannot be determined.","meaning":"Numeric value representing the patient's current daily dose of prednisone in milligrams per day."} ;; "prednisone dose ≥ 10 milligrams per day for longer than 30 days"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Definition: immunosuppressed = (solid organ transplant OR splenectomy OR (prednisone ≥ 10 mg/day for >30 days) OR other immunodepressors OR neutropenia)
(assert
(! (= patient_has_finding_of_patient_immunosuppressed_now
     (or patient_has_undergone_solid_organ_transplant_inthehistory
         patient_has_undergone_splenectomy_inthehistory
         (and patient_is_exposed_to_prednisone_now
              (>= patient_prednisone_value_recorded_now_withunit_milligrams_per_day 10)
              (> patient_prednisone_value_recorded_now_withunit_days 30))
         patient_is_exposed_to_immunodepressors_now
         patient_has_finding_of_neutropenia_now))
   :named REQ1_AUXILIARY0)) ;; "immunosuppressed, defined as ((the patient has a solid organ transplant) OR (the patient has a splenectomy) OR (the patient is being treated with a prednisone dose ≥ 10 milligrams per day for longer than 30 days) OR (the patient is being treated with other immunodepressors) OR (the patient has neutropenia))."

;; Qualifier variable implies stem variable (if needed for downstream logic)
;; (No additional qualifier variables in this requirement.)

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_undergone_solid_organ_transplant_inthehistory)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a solid organ transplant."

(assert
(! (not patient_has_undergone_splenectomy_inthehistory)
   :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a splenectomy."

(assert
(! (not (and patient_is_exposed_to_prednisone_now
             (>= patient_prednisone_value_recorded_now_withunit_milligrams_per_day 10)
             (> patient_prednisone_value_recorded_now_withunit_days 30)))
   :named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is being treated with a prednisone dose ≥ 10 milligrams per day for longer than 30 days."

(assert
(! (not patient_is_exposed_to_immunodepressors_now)
   :named REQ1_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is being treated with other immunodepressors."

(assert
(! (not patient_has_finding_of_neutropenia_now)
   :named REQ1_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has neutropenia."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_living_in_assisted_care_facility_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently living in an assisted care facility.","when_to_set_to_false":"Set to false if the patient is not currently living in an assisted care facility.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently living in an assisted care facility.","meaning":"Boolean indicating whether the patient is currently living in an assisted care facility."} ;; "the patient is living in an assisted care facility"
(declare-const patient_was_hospitalized_in_14_days_prior_to_enrollment Bool) ;; {"when_to_set_to_true":"Set to true if the patient was hospitalized at any time during the 14 days prior to enrollment.","when_to_set_to_false":"Set to false if the patient was not hospitalized at any time during the 14 days prior to enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was hospitalized during the 14 days prior to enrollment.","meaning":"Boolean indicating whether the patient was hospitalized at any time during the 14 days prior to enrollment."} ;; "the patient was hospitalized in the 14 days prior to enrollment"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (or patient_was_hospitalized_in_14_days_prior_to_enrollment
            patient_is_living_in_assisted_care_facility_now))
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient was hospitalized in the 14 days prior to enrollment) OR (the patient is living in an assisted care facility))."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pneumonia.","meaning":"Boolean indicating whether the patient currently has pneumonia."} ;; "pneumonia"
(declare-const patient_has_finding_of_pneumonia_now@@caused_by_infrequent_agents Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current pneumonia is caused by infrequent agents (e.g., Pseudomonas aeruginosa, Staphylococcus aureus).","when_to_set_to_false":"Set to false if the patient's current pneumonia is not caused by infrequent agents.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the pneumonia is caused by infrequent agents.","meaning":"Boolean indicating whether the patient's current pneumonia is caused by infrequent agents."} ;; "pneumonia caused by infrequent agents"
(declare-const patient_has_finding_of_pneumonia_now@@caused_by_pseudomonas_aeruginosa Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pneumonia and the pneumonia is caused by Pseudomonas aeruginosa.","when_to_set_to_false":"Set to false if the patient currently has pneumonia and the pneumonia is not caused by Pseudomonas aeruginosa, or if the patient does not currently have pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pneumonia caused by Pseudomonas aeruginosa.","meaning":"Boolean indicating whether the patient currently has pneumonia caused by Pseudomonas aeruginosa."} ;; "pneumonia caused by Pseudomonas aeruginosa"
(declare-const patient_has_finding_of_pneumonia_now@@caused_by_staphylococcus_aureus Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pneumonia and the pneumonia is caused by Staphylococcus aureus.","when_to_set_to_false":"Set to false if the patient currently has pneumonia and the pneumonia is not caused by Staphylococcus aureus, or if the patient does not currently have pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pneumonia caused by Staphylococcus aureus.","meaning":"Boolean indicating whether the patient currently has pneumonia caused by Staphylococcus aureus."} ;; "pneumonia caused by Staphylococcus aureus"
(declare-const patient_has_finding_of_disorder_due_to_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an infectious process.","when_to_set_to_false":"Set to false if the patient currently does not have an infectious process.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an infectious process.","meaning":"Boolean indicating whether the patient currently has an infectious process."} ;; "infectious processes"
(declare-const patient_has_finding_of_disorder_due_to_infection_now@@requiring_extended_treatment_with_antibiotics Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current infectious process requires extended treatment with antibiotics (e.g., bacterial endocarditis, abscesses).","when_to_set_to_false":"Set to false if the patient's current infectious process does not require extended treatment with antibiotics.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the infectious process requires extended antibiotic treatment.","meaning":"Boolean indicating whether the patient's current infectious process requires extended treatment with antibiotics."} ;; "infectious processes requiring extended treatment with antibiotics"
(declare-const patient_has_finding_of_bacterial_endocarditis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has bacterial endocarditis.","when_to_set_to_false":"Set to false if the patient currently does not have bacterial endocarditis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has bacterial endocarditis.","meaning":"Boolean indicating whether the patient currently has bacterial endocarditis."} ;; "bacterial endocarditis"
(declare-const patient_has_finding_of_abscess_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has abscesses.","when_to_set_to_false":"Set to false if the patient currently does not have abscesses.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has abscesses.","meaning":"Boolean indicating whether the patient currently has abscesses."} ;; "abscesses"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Non-exhaustive examples imply umbrella term for pneumonia caused by infrequent agents
(assert
(! (=> (or patient_has_finding_of_pneumonia_now@@caused_by_pseudomonas_aeruginosa
           patient_has_finding_of_pneumonia_now@@caused_by_staphylococcus_aureus)
        patient_has_finding_of_pneumonia_now@@caused_by_infrequent_agents)
:named REQ3_AUXILIARY0)) ;; "with non-exhaustive examples (Pseudomonas aeruginosa, Staphylococcus aureus)"

;; Qualifier variable implies corresponding stem variable for pneumonia
(assert
(! (=> patient_has_finding_of_pneumonia_now@@caused_by_infrequent_agents
        patient_has_finding_of_pneumonia_now)
:named REQ3_AUXILIARY1)) ;; "pneumonia caused by infrequent agents"

;; Qualifier variables imply corresponding stem variable for pneumonia caused by specific agents
(assert
(! (=> patient_has_finding_of_pneumonia_now@@caused_by_pseudomonas_aeruginosa
        patient_has_finding_of_pneumonia_now)
:named REQ3_AUXILIARY2)) ;; "pneumonia caused by Pseudomonas aeruginosa"
(assert
(! (=> patient_has_finding_of_pneumonia_now@@caused_by_staphylococcus_aureus
        patient_has_finding_of_pneumonia_now)
:named REQ3_AUXILIARY3)) ;; "pneumonia caused by Staphylococcus aureus"

;; Non-exhaustive examples imply umbrella term for infectious processes requiring extended antibiotics
(assert
(! (=> (or patient_has_finding_of_bacterial_endocarditis_now
           patient_has_finding_of_abscess_now)
        patient_has_finding_of_disorder_due_to_infection_now@@requiring_extended_treatment_with_antibiotics)
:named REQ3_AUXILIARY4)) ;; "with non-exhaustive examples (bacterial endocarditis, abscesses)"

;; Qualifier variable implies corresponding stem variable for infectious process
(assert
(! (=> patient_has_finding_of_disorder_due_to_infection_now@@requiring_extended_treatment_with_antibiotics
        patient_has_finding_of_disorder_due_to_infection_now)
:named REQ3_AUXILIARY5)) ;; "infectious processes requiring extended treatment with antibiotics"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Exclusion: patient must NOT have pneumonia caused by infrequent agents
(assert
(! (not patient_has_finding_of_pneumonia_now@@caused_by_infrequent_agents)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has pneumonia caused by infrequent agents with non-exhaustive examples (Pseudomonas aeruginosa, Staphylococcus aureus)."

;; Exclusion: patient must NOT have infectious processes requiring extended treatment with antibiotics
(assert
(! (not patient_has_finding_of_disorder_due_to_infection_now@@requiring_extended_treatment_with_antibiotics)
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has infectious processes requiring extended treatment with antibiotics with non-exhaustive examples (bacterial endocarditis, abscesses)."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_pleural_effusion_associated_with_pulmonary_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pleural effusion associated with pulmonary infection (pneumonia with pleural effusion).","when_to_set_to_false":"Set to false if the patient currently does not have pleural effusion associated with pulmonary infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pleural effusion associated with pulmonary infection.","meaning":"Boolean indicating whether the patient currently has pleural effusion associated with pulmonary infection."} ;; "pneumonia with pleural effusion"

(declare-const patient_has_finding_of_pleural_effusion_associated_with_pulmonary_infection_now@@requires_drainage_tube Bool) ;; {"when_to_set_to_true":"Set to true if the patient's pleural effusion associated with pulmonary infection currently requires a drainage tube.","when_to_set_to_false":"Set to false if the patient's pleural effusion associated with pulmonary infection does not require a drainage tube.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the pleural effusion requires a drainage tube.","meaning":"Boolean indicating whether the patient's pleural effusion associated with pulmonary infection requires a drainage tube."} ;; "pleural effusion requiring a drainage tube"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies stem variable
(assert
(! (=> patient_has_finding_of_pleural_effusion_associated_with_pulmonary_infection_now@@requires_drainage_tube
      patient_has_finding_of_pleural_effusion_associated_with_pulmonary_infection_now)
:named REQ4_AUXILIARY0)) ;; "pleural effusion requiring a drainage tube" implies "pleural effusion associated with pulmonary infection"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_pleural_effusion_associated_with_pulmonary_infection_now@@requires_drainage_tube)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has pneumonia with pleural effusion requiring a drainage tube."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_dead_inthehistory@@temporalcontext_before_randomization Bool) ;; {"when_to_set_to_true":"Set to true if the patient was deceased before the randomization event.","when_to_set_to_false":"Set to false if the patient was not deceased before the randomization event.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was deceased before randomization.","meaning":"Boolean indicating whether the patient was deceased before randomization."} ;; "the patient was deceased before randomization"
(declare-const patient_has_history_of_intensive_care_unit_admission@@temporalcontext_before_randomization Bool) ;; {"when_to_set_to_true":"Set to true if there is documentation that the patient was admitted to an intensive care unit before randomization.","when_to_set_to_false":"Set to false if there is documentation that the patient was not admitted to an intensive care unit before randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was admitted to an intensive care unit before randomization.","meaning":"Boolean indicating whether the patient was admitted to an intensive care unit before randomization."} ;; "the patient was admitted to an intensive care unit before randomization"
(declare-const patient_has_given_informed_consent@@temporalcontext_before_randomization Bool) ;; {"when_to_set_to_true":"Set to true if there is documentation that the patient gave informed consent before randomization.","when_to_set_to_false":"Set to false if there is documentation that the patient did not give informed consent before randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient gave informed consent before randomization.","meaning":"Boolean indicating whether the patient gave informed consent before randomization."} ;; "the patient did not give informed consent before randomization"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_dead_inthehistory@@temporalcontext_before_randomization)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient was deceased before randomization."

(assert
(! (not patient_has_history_of_intensive_care_unit_admission@@temporalcontext_before_randomization)
:named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient was admitted to an intensive care unit before randomization."

(assert
(! (not patient_has_given_informed_consent@@temporalcontext_before_randomization)
:named REQ5_COMPONENT2_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient did not give informed consent."
