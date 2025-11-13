;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_exposed_to_drug_or_medicament_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to any drug or medicament.","when_to_set_to_false":"Set to false if the patient is currently not exposed to any drug or medicament.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to any drug or medicament.","meaning":"Boolean indicating whether the patient is currently exposed to any drug or medicament."} ;; "uses any investigational drug during the study period" / "uses any non-registered drug during the study period"
(declare-const patient_is_exposed_to_drug_or_medicament_now@@drug_is_investigational Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament to which the patient is currently exposed is investigational.","when_to_set_to_false":"Set to false if the drug or medicament to which the patient is currently exposed is not investigational.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament is investigational.","meaning":"Boolean indicating whether the drug or medicament to which the patient is currently exposed is investigational."} ;; "uses any investigational drug during the study period"
(declare-const patient_is_exposed_to_drug_or_medicament_now@@drug_is_non_registered Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament to which the patient is currently exposed is non-registered.","when_to_set_to_false":"Set to false if the drug or medicament to which the patient is currently exposed is registered.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament is non-registered.","meaning":"Boolean indicating whether the drug or medicament to which the patient is currently exposed is non-registered."} ;; "uses any non-registered drug during the study period"
(declare-const patient_is_exposed_to_drug_or_medicament_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient plans to be exposed to any drug or medicament in the future (during the study period).","when_to_set_to_false":"Set to false if the patient does not plan to be exposed to any drug or medicament in the future (during the study period).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient plans to be exposed to any drug or medicament in the future.","meaning":"Boolean indicating whether the patient plans to be exposed to any drug or medicament in the future (during the study period)."} ;; "plans to use any investigational drug during the study period" / "plans to use any non-registered drug during the study period"
(declare-const patient_is_exposed_to_drug_or_medicament_inthefuture@@drug_is_investigational Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament the patient plans to be exposed to in the future is investigational.","when_to_set_to_false":"Set to false if the drug or medicament the patient plans to be exposed to in the future is not investigational.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament is investigational.","meaning":"Boolean indicating whether the drug or medicament the patient plans to be exposed to in the future is investigational."} ;; "plans to use any investigational drug during the study period"
(declare-const patient_is_exposed_to_drug_or_medicament_inthefuture@@drug_is_non_registered Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament the patient plans to be exposed to in the future is non-registered.","when_to_set_to_false":"Set to false if the drug or medicament the patient plans to be exposed to in the future is registered.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament is non-registered.","meaning":"Boolean indicating whether the drug or medicament the patient plans to be exposed to in the future is non-registered."} ;; "plans to use any non-registered drug during the study period"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_is_exposed_to_drug_or_medicament_now@@drug_is_investigational
      patient_is_exposed_to_drug_or_medicament_now)
    :named REQ0_AUXILIARY0)) ;; "uses any investigational drug during the study period"

(assert
(! (=> patient_is_exposed_to_drug_or_medicament_now@@drug_is_non_registered
      patient_is_exposed_to_drug_or_medicament_now)
    :named REQ0_AUXILIARY1)) ;; "uses any non-registered drug during the study period"

(assert
(! (=> patient_is_exposed_to_drug_or_medicament_inthefuture@@drug_is_investigational
      patient_is_exposed_to_drug_or_medicament_inthefuture)
    :named REQ0_AUXILIARY2)) ;; "plans to use any investigational drug during the study period"

(assert
(! (=> patient_is_exposed_to_drug_or_medicament_inthefuture@@drug_is_non_registered
      patient_is_exposed_to_drug_or_medicament_inthefuture)
    :named REQ0_AUXILIARY3)) ;; "plans to use any non-registered drug during the study period"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion: patient must NOT use or plan to use any investigational or non-registered drug during the study period
(assert
(! (not (or patient_is_exposed_to_drug_or_medicament_now@@drug_is_investigational
            patient_is_exposed_to_drug_or_medicament_inthefuture@@drug_is_investigational
            patient_is_exposed_to_drug_or_medicament_now@@drug_is_non_registered
            patient_is_exposed_to_drug_or_medicament_inthefuture@@drug_is_non_registered))
    :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient uses any investigational drug during the study period) OR (the patient plans to use any investigational drug during the study period) OR (the patient uses any non-registered drug during the study period) OR (the patient plans to use any non-registered drug during the study period)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
;; All required variables are already declared in <already_used_variables_in_SMT_program>.

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: patient must NOT use or plan to use any investigational vaccine or any non-registered vaccine other than the study vaccine during the study period.
(assert
  (! (not (or patient_is_exposed_to_drug_or_medicament_now@@drug_is_investigational
              patient_is_exposed_to_drug_or_medicament_inthefuture@@drug_is_investigational
              patient_is_exposed_to_drug_or_medicament_now@@drug_is_non_registered
              patient_is_exposed_to_drug_or_medicament_inthefuture@@drug_is_non_registered))
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient uses any investigational vaccine during the study period) OR (the patient plans to use any investigational vaccine during the study period) OR (the patient uses any non-registered vaccine other than the study vaccine during the study period) OR (the patient plans to use any non-registered vaccine other than the study vaccine during the study period)."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_undergone_active_immunization_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone active immunization (vaccination) at any time in their history.","when_to_set_to_false":"Set to false if the patient has never undergone active immunization (vaccination) at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone active immunization (vaccination) in their history.","meaning":"Boolean indicating whether the patient has ever undergone active immunization (vaccination) in their history."} ;; "previous vaccination"

(declare-const patient_has_undergone_active_immunization_inthehistory@@against_diphtheria Bool) ;; {"when_to_set_to_true":"Set to true if the patient's active immunization in history was specifically against diphtheria.","when_to_set_to_false":"Set to false if the patient's active immunization in history was not against diphtheria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's active immunization in history was against diphtheria.","meaning":"Boolean indicating whether the patient's active immunization in history was against diphtheria."} ;; "previous vaccination against diphtheria"

(declare-const patient_has_undergone_active_immunization_inthehistory@@against_tetanus Bool) ;; {"when_to_set_to_true":"Set to true if the patient's active immunization in history was specifically against tetanus.","when_to_set_to_false":"Set to false if the patient's active immunization in history was not against tetanus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's active immunization in history was against tetanus.","meaning":"Boolean indicating whether the patient's active immunization in history was against tetanus."} ;; "previous vaccination against tetanus"

(declare-const patient_has_undergone_active_immunization_inthehistory@@against_pertussis Bool) ;; {"when_to_set_to_true":"Set to true if the patient's active immunization in history was specifically against pertussis.","when_to_set_to_false":"Set to false if the patient's active immunization in history was not against pertussis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's active immunization in history was against pertussis.","meaning":"Boolean indicating whether the patient's active immunization in history was against pertussis."} ;; "previous vaccination against pertussis"

(declare-const patient_has_undergone_active_immunization_inthehistory@@against_haemophilus_influenzae_type_b Bool) ;; {"when_to_set_to_true":"Set to true if the patient's active immunization in history was specifically against Haemophilus influenzae type b.","when_to_set_to_false":"Set to false if the patient's active immunization in history was not against Haemophilus influenzae type b.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's active immunization in history was against Haemophilus influenzae type b.","meaning":"Boolean indicating whether the patient's active immunization in history was against Haemophilus influenzae type b."} ;; "previous vaccination against Haemophilus influenzae type b"

(declare-const patient_has_undergone_active_immunization_inthehistory@@against_hepatitis_a Bool) ;; {"when_to_set_to_true":"Set to true if the patient's active immunization in history was specifically against hepatitis A.","when_to_set_to_false":"Set to false if the patient's active immunization in history was not against hepatitis A.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's active immunization in history was against hepatitis A.","meaning":"Boolean indicating whether the patient's active immunization in history was against hepatitis A."} ;; "previous vaccination against hepatitis A"

(declare-const patient_has_undergone_active_immunization_inthehistory@@against_streptococcus_pneumoniae Bool) ;; {"when_to_set_to_true":"Set to true if the patient's active immunization in history was specifically against Streptococcus pneumoniae.","when_to_set_to_false":"Set to false if the patient's active immunization in history was not against Streptococcus pneumoniae.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's active immunization in history was against Streptococcus pneumoniae.","meaning":"Boolean indicating whether the patient's active immunization in history was against Streptococcus pneumoniae."} ;; "previous vaccination against Streptococcus pneumoniae"

(declare-const patient_has_undergone_active_immunization_inthehistory@@locally_recommended_expanded_program_on_immunization_given_at_birth Bool) ;; {"when_to_set_to_true":"Set to true if the patient's active immunization in history was a locally recommended expanded program on immunization vaccine given at birth.","when_to_set_to_false":"Set to false if the patient's active immunization in history was not a locally recommended expanded program on immunization vaccine given at birth.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's active immunization in history was a locally recommended expanded program on immunization vaccine given at birth.","meaning":"Boolean indicating whether the patient's active immunization in history was a locally recommended expanded program on immunization vaccine given at birth."} ;; "locally recommended expanded program on immunization vaccine given at birth"

(declare-const patient_has_undergone_active_immunization_inthehistory@@administered_at_least_one_month_before_first_study_vaccine_dose Bool) ;; {"when_to_set_to_true":"Set to true if the patient's active immunization in history was administered at least one month before the first dose of the study vaccine.","when_to_set_to_false":"Set to false if the patient's active immunization in history was not administered at least one month before the first dose of the study vaccine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's active immunization in history was administered at least one month before the first dose of the study vaccine.","meaning":"Boolean indicating whether the patient's active immunization in history was administered at least one month before the first dose of the study vaccine."} ;; "administered at least one month before the first dose of the study vaccine"

(declare-const patient_has_undergone_active_immunization_inthehistory@@locally_recommended_vaccine_always_allowed_even_if_concomitant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's active immunization in history was a locally recommended vaccine that is always allowed, even if concomitantly administered with the study vaccines.","when_to_set_to_false":"Set to false if the patient's active immunization in history was not a locally recommended vaccine that is always allowed, even if concomitantly administered with the study vaccines.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's active immunization in history was a locally recommended vaccine that is always allowed, even if concomitantly administered with the study vaccines.","meaning":"Boolean indicating whether the patient's active immunization in history was a locally recommended vaccine that is always allowed, even if concomitantly administered with the study vaccines."} ;; "locally recommended vaccine that is always allowed, even if concomitantly administered with the study vaccines"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_undergone_active_immunization_inthehistory@@against_diphtheria
      patient_has_undergone_active_immunization_inthehistory)
:named REQ2_AUXILIARY0)) ;; "previous vaccination against diphtheria"

(assert
(! (=> patient_has_undergone_active_immunization_inthehistory@@against_tetanus
      patient_has_undergone_active_immunization_inthehistory)
:named REQ2_AUXILIARY1)) ;; "previous vaccination against tetanus"

(assert
(! (=> patient_has_undergone_active_immunization_inthehistory@@against_pertussis
      patient_has_undergone_active_immunization_inthehistory)
:named REQ2_AUXILIARY2)) ;; "previous vaccination against pertussis"

(assert
(! (=> patient_has_undergone_active_immunization_inthehistory@@against_haemophilus_influenzae_type_b
      patient_has_undergone_active_immunization_inthehistory)
:named REQ2_AUXILIARY3)) ;; "previous vaccination against Haemophilus influenzae type b"

(assert
(! (=> patient_has_undergone_active_immunization_inthehistory@@against_hepatitis_a
      patient_has_undergone_active_immunization_inthehistory)
:named REQ2_AUXILIARY4)) ;; "previous vaccination against hepatitis A"

(assert
(! (=> patient_has_undergone_active_immunization_inthehistory@@against_streptococcus_pneumoniae
      patient_has_undergone_active_immunization_inthehistory)
:named REQ2_AUXILIARY5)) ;; "previous vaccination against Streptococcus pneumoniae"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Exclusion for previous vaccination against diphtheria, with exceptions
(assert
(! (not (and patient_has_undergone_active_immunization_inthehistory@@against_diphtheria
             (not (or
               (and patient_has_undergone_active_immunization_inthehistory@@locally_recommended_expanded_program_on_immunization_given_at_birth
                    patient_has_undergone_active_immunization_inthehistory@@administered_at_least_one_month_before_first_study_vaccine_dose)
               patient_has_undergone_active_immunization_inthehistory@@locally_recommended_vaccine_always_allowed_even_if_concomitant))))
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has previous vaccination against diphtheria, EXCEPT ..."

;; Exclusion for previous vaccination against tetanus, with exceptions
(assert
(! (not (and patient_has_undergone_active_immunization_inthehistory@@against_tetanus
             (not (or
               (and patient_has_undergone_active_immunization_inthehistory@@locally_recommended_expanded_program_on_immunization_given_at_birth
                    patient_has_undergone_active_immunization_inthehistory@@administered_at_least_one_month_before_first_study_vaccine_dose)
               patient_has_undergone_active_immunization_inthehistory@@locally_recommended_vaccine_always_allowed_even_if_concomitant))))
:named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has previous vaccination against tetanus, EXCEPT ..."

;; Exclusion for previous vaccination against pertussis, with exceptions
(assert
(! (not (and patient_has_undergone_active_immunization_inthehistory@@against_pertussis
             (not (or
               (and patient_has_undergone_active_immunization_inthehistory@@locally_recommended_expanded_program_on_immunization_given_at_birth
                    patient_has_undergone_active_immunization_inthehistory@@administered_at_least_one_month_before_first_study_vaccine_dose)
               patient_has_undergone_active_immunization_inthehistory@@locally_recommended_vaccine_always_allowed_even_if_concomitant))))
:named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has previous vaccination against pertussis, EXCEPT ..."

;; Exclusion for previous vaccination against Haemophilus influenzae type b, with exceptions
(assert
(! (not (and patient_has_undergone_active_immunization_inthehistory@@against_haemophilus_influenzae_type_b
             (not (or
               (and patient_has_undergone_active_immunization_inthehistory@@locally_recommended_expanded_program_on_immunization_given_at_birth
                    patient_has_undergone_active_immunization_inthehistory@@administered_at_least_one_month_before_first_study_vaccine_dose)
               patient_has_undergone_active_immunization_inthehistory@@locally_recommended_vaccine_always_allowed_even_if_concomitant))))
:named REQ2_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has previous vaccination against Haemophilus influenzae type b, EXCEPT ..."

;; Exclusion for previous vaccination against hepatitis A, with exceptions
(assert
(! (not (and patient_has_undergone_active_immunization_inthehistory@@against_hepatitis_a
             (not (or
               (and patient_has_undergone_active_immunization_inthehistory@@locally_recommended_expanded_program_on_immunization_given_at_birth
                    patient_has_undergone_active_immunization_inthehistory@@administered_at_least_one_month_before_first_study_vaccine_dose)
               patient_has_undergone_active_immunization_inthehistory@@locally_recommended_vaccine_always_allowed_even_if_concomitant))))
:named REQ2_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has previous vaccination against hepatitis A, EXCEPT ..."

;; Exclusion for previous vaccination against Streptococcus pneumoniae, with exceptions
(assert
(! (not (and patient_has_undergone_active_immunization_inthehistory@@against_streptococcus_pneumoniae
             (not (or
               (and patient_has_undergone_active_immunization_inthehistory@@locally_recommended_expanded_program_on_immunization_given_at_birth
                    patient_has_undergone_active_immunization_inthehistory@@administered_at_least_one_month_before_first_study_vaccine_dose)
               patient_has_undergone_active_immunization_inthehistory@@locally_recommended_vaccine_always_allowed_even_if_concomitant))))
:named REQ2_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has previous vaccination against Streptococcus pneumoniae, EXCEPT ..."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_undergone_active_immunization_inthehistory@@with_registered_pneumococcal_vaccine Bool) ;; {"when_to_set_to_true":"Set to true if the patient's prior active immunization (vaccination) was performed with a registered pneumococcal vaccine (e.g., Prevnar).","when_to_set_to_false":"Set to false if the patient's prior active immunization (vaccination) was not performed with a registered pneumococcal vaccine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's prior active immunization (vaccination) was performed with a registered pneumococcal vaccine.","meaning":"Boolean indicating whether the patient's prior active immunization (vaccination) was performed with a registered pneumococcal vaccine."} ;; "previous vaccination with a registered pneumococcal vaccine with non-exhaustive examples (Prevnar)"

(declare-const patient_will_undergo_active_immunization_inthefuture@@with_registered_pneumococcal_vaccine Bool) ;; {"when_to_set_to_true":"Set to true if the patient's planned future active immunization (vaccination) is with a registered pneumococcal vaccine (e.g., Prevnar).","when_to_set_to_false":"Set to false if the patient's planned future active immunization (vaccination) is not with a registered pneumococcal vaccine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's planned future active immunization (vaccination) is with a registered pneumococcal vaccine.","meaning":"Boolean indicating whether the patient's planned future active immunization (vaccination) is with a registered pneumococcal vaccine."} ;; "planned vaccination with a registered pneumococcal vaccine with non-exhaustive examples (Prevnar)"

(declare-const prevnar_immunization_needs_to_be_initiated_due_to_high_risk_disease_for_pneumococcal_infection_and_prevnar_is_locally_available Bool) ;; {"when_to_set_to_true":"Set to true if Prevnar immunization needs to be initiated due to the presence of a high risk disease for pneumococcal infection and the Prevnar vaccine is made locally available.","when_to_set_to_false":"Set to false if Prevnar immunization does not need to be initiated due to the presence of a high risk disease for pneumococcal infection or the Prevnar vaccine is not made locally available.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether Prevnar immunization needs to be initiated due to the presence of a high risk disease for pneumococcal infection and the Prevnar vaccine is made locally available.","meaning":"Boolean indicating whether Prevnar immunization needs to be initiated due to the presence of a high risk disease for pneumococcal infection and the Prevnar vaccine is made locally available."} ;; "Prevnar immunization needs to be initiated due to the presence of a high risk disease for pneumococcal infection for which the Prevnar vaccine is made locally available"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Non-exhaustive examples: Prevnar is an example of registered pneumococcal vaccine
;; (No umbrella variable for "registered pneumococcal vaccine" is declared, so no auxiliary assertion needed for umbrella mapping.)

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_undergone_active_immunization_inthehistory@@with_registered_pneumococcal_vaccine)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has previous vaccination with a registered pneumococcal vaccine with non-exhaustive examples (Prevnar)."

(assert
(! (not patient_will_undergo_active_immunization_inthefuture@@with_registered_pneumococcal_vaccine)
:named REQ3_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has planned vaccination with a registered pneumococcal vaccine with non-exhaustive examples (Prevnar)."

(assert
(! (not prevnar_immunization_needs_to_be_initiated_due_to_high_risk_disease_for_pneumococcal_infection_and_prevnar_is_locally_available)
:named REQ3_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if Prevnar immunization needs to be initiated due to the presence of a high risk disease for pneumococcal infection for which the Prevnar vaccine is made locally available."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_diagnosis_of_allergic_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with an allergic disorder (allergic disease) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with an allergic disorder (allergic disease) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with an allergic disorder (allergic disease).","meaning":"Boolean indicating whether the patient has a history of allergic disorder (allergic disease)."} ;; "the patient has a history of allergic disease"

(declare-const patient_has_diagnosis_of_allergic_reaction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with an allergic reaction at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with an allergic reaction at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with an allergic reaction.","meaning":"Boolean indicating whether the patient has a history of allergic reaction."} ;; "the patient has a history of allergic reactions"

(declare-const patient_has_diagnosis_of_allergic_reaction_inthehistory@@likely_to_be_exacerbated_by_any_component_of_the_vaccines Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of allergic reaction is likely to be exacerbated by any component of the vaccines.","when_to_set_to_false":"Set to false if the patient's history of allergic reaction is not likely to be exacerbated by any component of the vaccines.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's allergic reactions are likely to be exacerbated by any component of the vaccines.","meaning":"Boolean indicating whether the patient's allergic reactions are likely to be exacerbated by any component of the vaccines."} ;; "the patient has a history of allergic reactions likely to be exacerbated by any component of the vaccines"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_allergic_reaction_inthehistory@@likely_to_be_exacerbated_by_any_component_of_the_vaccines
      patient_has_diagnosis_of_allergic_reaction_inthehistory)
:named REQ4_AUXILIARY0)) ;; "the patient has a history of allergic reactions likely to be exacerbated by any component of the vaccines"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Exclusion: patient must NOT have a history of allergic disease
(assert
(! (not patient_has_diagnosis_of_allergic_disorder_inthehistory)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has a history of allergic disease"

;; Exclusion: patient must NOT have a history of allergic reactions likely to be exacerbated by any component of the vaccines
(assert
(! (not patient_has_diagnosis_of_allergic_reaction_inthehistory@@likely_to_be_exacerbated_by_any_component_of_the_vaccines)
:named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient has a history of allergic reactions likely to be exacerbated by any component of the vaccines"

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_diagnosis_of_disorder_of_nervous_system_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with any disorder of the nervous system at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with any disorder of the nervous system at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with any disorder of the nervous system.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of any disorder of the nervous system in their history."} ;; "the patient has a history of any neurologic disorder"
(declare-const patient_has_diagnosis_of_seizure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with seizures at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with seizures at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with seizures.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of seizures in their history."} ;; "the patient has a history of seizures"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_diagnosis_of_disorder_of_nervous_system_inthehistory)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of any neurologic disorder."

(assert
(! (not patient_has_diagnosis_of_seizure_inthehistory)
:named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of seizures."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_acute_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an acute disease at the time of enrolment.","when_to_set_to_false":"Set to false if the patient currently does not have an acute disease at the time of enrolment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an acute disease at the time of enrolment.","meaning":"Boolean indicating whether the patient currently has an acute disease now."} ;; "acute disease at the time of enrolment"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! (not patient_has_finding_of_acute_disease_now)
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an acute disease at the time of enrolment."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "the patient is an infant"
(declare-const patient_birth_weight_value_recorded_now_withunit_grams Real) ;; {"when_to_set_to_value":"Set to the measured birth weight in grams if a numeric measurement is available for the patient now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's birth weight in grams, recorded now."} ;; "birth weight"
(declare-const patient_is_infant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently classified as an infant.","when_to_set_to_false":"Set to false if the patient is currently not classified as an infant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently classified as an infant.","meaning":"Boolean indicating whether the patient is currently classified as an infant."} ;; "the patient is an infant"
(declare-const patient_is_infant_now@@in_colombia Bool) ;; {"when_to_set_to_true":"Set to true if the patient's classification as an infant is according to definitions or standards applicable in Colombia.","when_to_set_to_false":"Set to false if the patient's classification as an infant is not according to definitions or standards applicable in Colombia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's classification as an infant is according to definitions or standards applicable in Colombia.","meaning":"Boolean indicating whether the patient's classification as an infant is according to definitions or standards applicable in Colombia."} ;; "the patient is an infant in Colombia"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_infant_now@@in_colombia
      patient_is_infant_now)
   :named REQ7_AUXILIARY0)) ;; "the patient is an infant in Colombia"

;; ===================== Constraint Assertions (REQ 7) =====================
;; Exclusion: (the patient is an infant in Colombia) AND (the patient has a birth weight less than 2,500 grams)
(assert
(! (not (and patient_is_infant_now@@in_colombia
             (< patient_birth_weight_value_recorded_now_withunit_grams 2500)))
   :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is an infant in Colombia) AND (the patient has a birth weight less than 2,500 grams)."
