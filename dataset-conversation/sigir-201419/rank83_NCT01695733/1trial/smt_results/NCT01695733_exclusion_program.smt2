;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_received_influenza_vaccine_during_eligibility_season Bool) ;; {"when_to_set_to_true":"Set to true if the patient has already received the influenza vaccine during the same influenza season in which the patient is being considered for eligibility.","when_to_set_to_false":"Set to false if the patient has not received the influenza vaccine during the same influenza season in which the patient is being considered for eligibility.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received the influenza vaccine during the same influenza season in which the patient is being considered for eligibility.","meaning":"Boolean indicating whether the patient has already received the influenza vaccine during the same influenza season in which the patient is being considered for eligibility."} ;; "The patient is excluded if the patient has already received the influenza vaccine during the season in which the patient is considered for eligibility."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_received_influenza_vaccine_during_eligibility_season)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has already received the influenza vaccine during the season in which the patient is considered for eligibility."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_allergic_reaction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of allergic reactions at any time in the past.","when_to_set_to_false":"Set to false if the patient does not have a documented history of allergic reactions at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of allergic reactions.","meaning":"Boolean indicating whether the patient has a history of allergic reactions."} ;; "allergic reactions"

(declare-const patient_has_finding_of_allergic_reaction_inthehistory@@attributed_to_compounds_of_similar_chemical_composition_to_influenza_vaccine Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of allergic reactions is attributed to compounds of similar chemical composition to the influenza vaccine.","when_to_set_to_false":"Set to false if the patient's history of allergic reactions is not attributed to compounds of similar chemical composition to the influenza vaccine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's allergic reactions are attributed to compounds of similar chemical composition to the influenza vaccine.","meaning":"Boolean indicating whether the patient's history of allergic reactions is attributed to compounds of similar chemical composition to the influenza vaccine."} ;; "history of allergic reactions attributed to compounds of similar chemical composition to the influenza vaccine"

(declare-const patient_has_finding_of_allergic_reaction_inthehistory@@attributed_to_compounds_of_similar_biologic_composition_to_influenza_vaccine Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of allergic reactions is attributed to compounds of similar biologic composition to the influenza vaccine.","when_to_set_to_false":"Set to false if the patient's history of allergic reactions is not attributed to compounds of similar biologic composition to the influenza vaccine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's allergic reactions are attributed to compounds of similar biologic composition to the influenza vaccine.","meaning":"Boolean indicating whether the patient's history of allergic reactions is attributed to compounds of similar biologic composition to the influenza vaccine."} ;; "history of allergic reactions attributed to compounds of similar biologic composition to the influenza vaccine"

(declare-const patient_has_finding_of_allergy_to_egg_protein_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented allergy to egg protein.","when_to_set_to_false":"Set to false if the patient currently does not have a documented allergy to egg protein.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an allergy to egg protein.","meaning":"Boolean indicating whether the patient currently has an allergy to egg protein."} ;; "egg allergy"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variable for chemical composition
(assert
(! (=> patient_has_finding_of_allergic_reaction_inthehistory@@attributed_to_compounds_of_similar_chemical_composition_to_influenza_vaccine
       patient_has_finding_of_allergic_reaction_inthehistory)
:named REQ1_AUXILIARY0)) ;; "history of allergic reactions attributed to compounds of similar chemical composition to the influenza vaccine"

;; Qualifier variables imply corresponding stem variable for biologic composition
(assert
(! (=> patient_has_finding_of_allergic_reaction_inthehistory@@attributed_to_compounds_of_similar_biologic_composition_to_influenza_vaccine
       patient_has_finding_of_allergic_reaction_inthehistory)
:named REQ1_AUXILIARY1)) ;; "history of allergic reactions attributed to compounds of similar biologic composition to the influenza vaccine"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: patient must NOT have any of the three exclusionary findings
(assert
(! (not (or patient_has_finding_of_allergic_reaction_inthehistory@@attributed_to_compounds_of_similar_chemical_composition_to_influenza_vaccine
            patient_has_finding_of_allergic_reaction_inthehistory@@attributed_to_compounds_of_similar_biologic_composition_to_influenza_vaccine
            patient_has_finding_of_allergy_to_egg_protein_now))
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a history of allergic reactions attributed to compounds of similar chemical composition to the influenza vaccine) OR (the patient has a history of allergic reactions attributed to compounds of similar biologic composition to the influenza vaccine) OR (the patient has egg allergy)."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_guillain_barr_syndrome_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with Guillain-Barre syndrome at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with Guillain-Barre syndrome at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with Guillain-Barre syndrome.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of Guillain-Barre syndrome in their history."} ;; "Guillain-Barre syndrome"

(declare-const patient_has_diagnosis_of_guillain_barr_syndrome_inthehistory@@temporalcontext_within6weeks_prior_to_influenza_vaccination Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of Guillain-Barre syndrome occurred within the six weeks prior to an influenza vaccination.","when_to_set_to_false":"Set to false if the patient's diagnosis of Guillain-Barre syndrome did not occur within the six weeks prior to an influenza vaccination.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis occurred within the six weeks prior to an influenza vaccination.","meaning":"Boolean indicating whether the patient's diagnosis of Guillain-Barre syndrome occurred within the six weeks prior to an influenza vaccination."} ;; "previous history of Guillain-Barre syndrome within the previous six weeks to influenza vaccination"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_guillain_barr_syndrome_inthehistory@@temporalcontext_within6weeks_prior_to_influenza_vaccination
      patient_has_diagnosis_of_guillain_barr_syndrome_inthehistory)
:named REQ2_AUXILIARY0)) ;; "Guillain-Barre syndrome within the previous six weeks to influenza vaccination" implies "Guillain-Barre syndrome in history"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_diagnosis_of_guillain_barr_syndrome_inthehistory@@temporalcontext_within6weeks_prior_to_influenza_vaccination)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a previous history of Guillain-Barre syndrome within the previous six weeks to influenza vaccination."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_exposed_to_steroid_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving or exposed to steroid therapy.","when_to_set_to_false":"Set to false if the patient is currently not receiving or exposed to steroid therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving or exposed to steroid therapy.","meaning":"Boolean indicating whether the patient is currently receiving steroid therapy."} ;; "the patient is receiving chronic steroid therapy"

(declare-const steroid_therapy_duration_value_recorded_in_days Real) ;; {"when_to_set_to_value":"Set to the total number of days the patient has been receiving steroid therapy.","when_to_set_to_null":"Set to null if the duration of steroid therapy is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the total duration in days of steroid therapy received by the patient."} ;; "duration greater than or equal to fourteen days"

(declare-const steroid_therapy_is_part_of_chemotherapy_regimen_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current steroid therapy is being used as part of a chemotherapy regimen.","when_to_set_to_false":"Set to false if the patient's current steroid therapy is not being used as part of a chemotherapy regimen.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current steroid therapy is being used as part of a chemotherapy regimen.","meaning":"Boolean indicating whether the patient's current steroid therapy is being used as part of a chemotherapy regimen."} ;; "chronic steroid therapy is NOT used as part of a chemotherapy regimen"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not (and
          patient_is_exposed_to_steroid_now
          (>= steroid_therapy_duration_value_recorded_in_days 14)
          (not steroid_therapy_is_part_of_chemotherapy_regimen_now)))
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is receiving chronic steroid therapy defined as duration greater than or equal to fourteen days) AND (chronic steroid therapy is NOT used as part of a chemotherapy regimen)."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_immunosuppression_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of immunosuppression.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of immunosuppression.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of immunosuppression.","meaning":"Boolean indicating whether the patient currently has immunosuppression."} ;; "suppress the immune system"
(declare-const patient_has_finding_of_immunosuppression_now@@caused_by_at_least_one_other_agent Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current immunosuppression is caused by at least one other agent.","when_to_set_to_false":"Set to false if the patient's current immunosuppression is not caused by at least one other agent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current immunosuppression is caused by at least one other agent.","meaning":"Boolean indicating whether the patient's current immunosuppression is caused by at least one other agent."} ;; "on at least one other agent that can suppress the immune system"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_immunosuppression_now@@caused_by_at_least_one_other_agent
      patient_has_finding_of_immunosuppression_now)
:named REQ4_AUXILIARY0)) ;; "immunosuppression caused by at least one other agent" implies "immunosuppression"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_immunosuppression_now@@caused_by_at_least_one_other_agent)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is on at least one other agent that can suppress the immune system."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_planned_concurrent_therapy_with_radiation_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a planned concurrent therapy that is to be administered with radiation therapy.","when_to_set_to_false":"Set to false if the patient does not have a planned concurrent therapy with radiation therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a planned concurrent therapy with radiation therapy.","meaning":"Boolean indicating whether the patient has a planned concurrent therapy with radiation therapy."} ;; "The patient is excluded if the patient has planned concurrent therapy with radiation therapy."

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_planned_concurrent_therapy_with_radiation_therapy)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has planned concurrent therapy with radiation therapy."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_disease_condition_determination_uncontrolled_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an uncontrolled illness at the time of enrollment.","when_to_set_to_false":"Set to false if the patient currently does not have an uncontrolled illness at the time of enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an uncontrolled illness at the time of enrollment.","meaning":"Boolean indicating whether the patient currently has an uncontrolled illness at the time of enrollment."} ;; "uncontrolled illness at the time of enrollment"
(declare-const patient_has_finding_of_disease_condition_determination_uncontrolled_now@@at_time_of_influenza_vaccination Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an uncontrolled illness at the time of influenza vaccination.","when_to_set_to_false":"Set to false if the patient currently does not have an uncontrolled illness at the time of influenza vaccination.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an uncontrolled illness at the time of influenza vaccination.","meaning":"Boolean indicating whether the patient currently has an uncontrolled illness at the time of influenza vaccination."} ;; "uncontrolled illness at the time of influenza vaccination"
(declare-const patient_has_finding_of_disorder_characterized_by_fever_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an ongoing febrile illness.","when_to_set_to_false":"Set to false if the patient currently does not have an ongoing febrile illness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an ongoing febrile illness.","meaning":"Boolean indicating whether the patient currently has an ongoing febrile illness."} ;; "febrile illness"
(declare-const patient_has_finding_of_disorder_characterized_by_fever_now@@ongoing Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a febrile illness and the illness is ongoing.","when_to_set_to_false":"Set to false if the patient currently has a febrile illness but it is not ongoing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the febrile illness is ongoing.","meaning":"Boolean indicating whether the patient's current febrile illness is ongoing."} ;; "ongoing febrile illness"
(declare-const patient_has_finding_of_disorder_characterized_by_fever_now@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a febrile illness and the illness is active.","when_to_set_to_false":"Set to false if the patient currently has a febrile illness but it is not active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the febrile illness is active.","meaning":"Boolean indicating whether the patient's current febrile illness is active."} ;; "active febrile illness"
(declare-const patient_has_undergone_influenza_vaccination_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone influenza vaccination now.","when_to_set_to_false":"Set to false if the patient has not undergone influenza vaccination now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone influenza vaccination now.","meaning":"Boolean indicating whether the patient has undergone influenza vaccination now."} ;; "influenza vaccination"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_disorder_characterized_by_fever_now@@ongoing
          patient_has_finding_of_disorder_characterized_by_fever_now@@active)
patient_has_finding_of_disease_condition_determination_uncontrolled_now)
:named REQ6_AUXILIARY0)) ;; "with non-exhaustive examples (ongoing febrile illness, active febrile illness)"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_disorder_characterized_by_fever_now@@ongoing
patient_has_finding_of_disorder_characterized_by_fever_now)
:named REQ6_AUXILIARY1)) ;; "ongoing febrile illness"

(assert
(! (=> patient_has_finding_of_disorder_characterized_by_fever_now@@active
patient_has_finding_of_disorder_characterized_by_fever_now)
:named REQ6_AUXILIARY2)) ;; "active febrile illness"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_disease_condition_determination_uncontrolled_now)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has uncontrolled illness at the time of enrollment."

(assert
(! (not patient_has_finding_of_disease_condition_determination_uncontrolled_now@@at_time_of_influenza_vaccination)
:named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has uncontrolled illness at the time of influenza vaccination."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_diagnosis_of_mental_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of mental disorder (psychiatric illness).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of mental disorder (psychiatric illness).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of mental disorder (psychiatric illness).","meaning":"Boolean indicating whether the patient currently has a diagnosis of mental disorder (psychiatric illness)."} ;; "psychiatric illness"
(declare-const patient_has_diagnosis_of_mental_disorder_now@@limits_compliance_with_study_requirements Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current psychiatric illness (mental disorder) would limit compliance with study requirements.","when_to_set_to_false":"Set to false if the patient's current psychiatric illness (mental disorder) would not limit compliance with study requirements.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current psychiatric illness (mental disorder) would limit compliance with study requirements.","meaning":"Boolean indicating whether the patient's current psychiatric illness (mental disorder) would limit compliance with study requirements."} ;; "psychiatric illness that would limit compliance with study requirements"
(declare-const patient_has_social_situation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any social situation.","when_to_set_to_false":"Set to false if the patient currently does not have any social situation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any social situation.","meaning":"Boolean indicating whether the patient currently has any social situation."} ;; "social situations"
(declare-const patient_has_social_situation_now@@limits_compliance_with_study_requirements Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current social situation would limit compliance with study requirements.","when_to_set_to_false":"Set to false if the patient's current social situation would not limit compliance with study requirements.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current social situation would limit compliance with study requirements.","meaning":"Boolean indicating whether the patient's current social situation would limit compliance with study requirements."} ;; "social situations that would limit compliance with study requirements"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variable implies corresponding stem variable for psychiatric illness
(assert
(! (=> patient_has_diagnosis_of_mental_disorder_now@@limits_compliance_with_study_requirements
      patient_has_diagnosis_of_mental_disorder_now)
   :named REQ7_AUXILIARY0)) ;; "psychiatric illness that would limit compliance with study requirements"

;; Qualifier variable implies corresponding stem variable for social situation
(assert
(! (=> patient_has_social_situation_now@@limits_compliance_with_study_requirements
      patient_has_social_situation_now)
   :named REQ7_AUXILIARY1)) ;; "social situations that would limit compliance with study requirements"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_diagnosis_of_mental_disorder_now@@limits_compliance_with_study_requirements)
   :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has psychiatric illness that would limit compliance with study requirements."

(assert
(! (not patient_has_social_situation_now@@limits_compliance_with_study_requirements)
   :named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has social situations that would limit compliance with study requirements."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_history_of_organ_transplantation Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of organ transplantation.","when_to_set_to_false":"Set to false if the patient does not have a documented history of organ transplantation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of organ transplantation.","meaning":"Boolean indicating whether the patient has a history of organ transplantation."} ;; "history of organ transplantation"
(declare-const patient_has_finding_of_human_immunodeficiency_virus_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of human immunodeficiency virus infection.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of human immunodeficiency virus infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of human immunodeficiency virus infection.","meaning":"Boolean indicating whether the patient currently has human immunodeficiency virus infection."} ;; "human immunodeficiency virus infection"
(declare-const patient_has_finding_of_human_immunodeficiency_virus_infection_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current HIV infection is known (confirmed, not suspected or uncertain).","when_to_set_to_false":"Set to false if the patient's current HIV infection is not known (i.e., suspected, uncertain, or not confirmed).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current HIV infection is known.","meaning":"Boolean indicating whether the patient's current HIV infection is known (confirmed)."} ;; "known human immunodeficiency virus infection"
(declare-const patient_is_undergoing_highly_active_anti_retroviral_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing combination antiretroviral therapy (HAART).","when_to_set_to_false":"Set to false if the patient is currently not undergoing combination antiretroviral therapy (HAART).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing combination antiretroviral therapy (HAART).","meaning":"Boolean indicating whether the patient is currently undergoing combination antiretroviral therapy (HAART)."} ;; "combination antiretroviral therapy"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Non-exhaustive example: history of organ transplantation implies known immunosuppression
(assert
(! (=> patient_has_history_of_organ_transplantation
     patient_has_finding_of_immunosuppression_now@@known)
:named REQ8_AUXILIARY0)) ;; "with non-exhaustive examples (history of organ transplantation)"

;; Qualifier variable implies corresponding stem variable (immunosuppression)
(assert
(! (=> patient_has_finding_of_immunosuppression_now@@known
     patient_has_finding_of_immunosuppression_now)
:named REQ8_AUXILIARY1)) ;; "known immunosuppression"

;; Qualifier variable implies corresponding stem variable (HIV infection)
(assert
(! (=> patient_has_finding_of_human_immunodeficiency_virus_infection_now@@known
     patient_has_finding_of_human_immunodeficiency_virus_infection_now)
:named REQ8_AUXILIARY2)) ;; "known human immunodeficiency virus infection"

;; ===================== Constraint Assertions (REQ 8) =====================
;; Exclusion: patient must NOT have known immunosuppression (with non-exhaustive example)
(assert
(! (not patient_has_finding_of_immunosuppression_now@@known)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known immunosuppression with non-exhaustive examples (history of organ transplantation)."

;; Exclusion: patient must NOT have BOTH known HIV infection AND be on combination antiretroviral therapy
(assert
(! (not (and patient_has_finding_of_human_immunodeficiency_virus_infection_now@@known
             patient_is_undergoing_highly_active_anti_retroviral_therapy_now))
:named REQ8_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has known human immunodeficiency virus infection) AND (the patient is on combination antiretroviral therapy)."
