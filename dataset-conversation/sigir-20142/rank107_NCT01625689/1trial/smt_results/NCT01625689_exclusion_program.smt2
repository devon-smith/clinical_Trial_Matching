;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_chronic_disease_now@@serious Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a chronic disease and the disease is serious.","when_to_set_to_false":"Set to false if the patient currently does not have a chronic disease or the disease is not serious.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a chronic disease and whether it is serious.","meaning":"Boolean indicating whether the patient currently has a serious chronic disease."} ;; "any serious chronic disease"

(declare-const patient_has_finding_of_disorder_of_nervous_system_now@@progressive Bool) ;; {"when_to_set_to_true":"Set to true if the patient's disorder of the nervous system is progressive.","when_to_set_to_false":"Set to false if the patient's disorder of the nervous system is not progressive.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disorder is progressive.","meaning":"Boolean indicating whether the patient's disorder of the nervous system is progressive."} ;; "progressive neurologic disease"

(declare-const patient_has_finding_of_tuberculosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has tuberculosis.","when_to_set_to_false":"Set to false if the patient currently does not have tuberculosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has tuberculosis.","meaning":"Boolean indicating whether the patient currently has tuberculosis."} ;; "tuberculosis"

(declare-const patient_has_finding_of_complete_trisomy_21_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has complete trisomy 21 syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have complete trisomy 21 syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has complete trisomy 21 syndrome.","meaning":"Boolean indicating whether the patient currently has complete trisomy 21 syndrome."} ;; "Down's syndrome"

(declare-const patient_has_finding_of_chromosomal_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a chromosomal disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a chromosomal disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a chromosomal disorder.","meaning":"Boolean indicating whether the patient currently has a chromosomal disorder."} ;; "other cytogenetic disorder"

(declare-const patient_has_finding_of_disease_of_immune_system_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a known disease of the immune system.","when_to_set_to_false":"Set to false if the patient currently does not have a known disease of the immune system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a known disease of the immune system.","meaning":"Boolean indicating whether the patient currently has a known disease of the immune system."} ;; "known disease of the immune system"

(declare-const patient_has_finding_of_disease_of_immune_system_now@@suspected Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a suspected disease of the immune system.","when_to_set_to_false":"Set to false if the patient currently does not have a suspected disease of the immune system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a suspected disease of the immune system.","meaning":"Boolean indicating whether the patient currently has a suspected disease of the immune system."} ;; "suspected disease of the immune system"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_disorder_of_nervous_system_now@@progressive
           patient_has_finding_of_tuberculosis_now
           patient_has_finding_of_complete_trisomy_21_syndrome_now
           patient_has_finding_of_chromosomal_disorder_now
           patient_has_finding_of_disease_of_immune_system_now@@known
           patient_has_finding_of_disease_of_immune_system_now@@suspected)
        patient_has_finding_of_chronic_disease_now@@serious)
   :named REQ0_AUXILIARY0)) ;; "with non-exhaustive examples ((progressive neurologic disease) OR (tuberculosis) OR (Down's syndrome) OR (other cytogenetic disorder) OR (known disease of the immune system) OR (suspected disease of the immune system))"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_disorder_of_nervous_system_now@@progressive
       true)
   :named REQ0_AUXILIARY1)) ;; "progressive neurologic disease" (qualifier variable implies existence of the disorder, but no stem variable for 'now' is declared in input)

(assert
(! (=> patient_has_finding_of_disease_of_immune_system_now@@known
       true)
   :named REQ0_AUXILIARY2)) ;; "known disease of the immune system" (qualifier variable implies existence of the disorder, but no stem variable for 'now' is declared in input)

(assert
(! (=> patient_has_finding_of_disease_of_immune_system_now@@suspected
       true)
   :named REQ0_AUXILIARY3)) ;; "suspected disease of the immune system" (qualifier variable implies existence of the disorder, but no stem variable for 'now' is declared in input)

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_chronic_disease_now@@serious)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any serious chronic disease with non-exhaustive examples ((progressive neurologic disease) OR (tuberculosis) OR (Down's syndrome) OR (other cytogenetic disorder) OR (known disease of the immune system) OR (suspected disease of the immune system))."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_receiving_immunosuppressive_agents_within_2_weeks_before_study_vaccination Bool) ;; {"when_to_set_to_true":"Set to true if the patient is receiving immunosuppressive agents at any time during the two weeks prior to the study vaccination event.","when_to_set_to_false":"Set to false if the patient is not receiving immunosuppressive agents at any time during the two weeks prior to the study vaccination event.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is receiving immunosuppressive agents at any time during the two weeks prior to the study vaccination event.","meaning":"Boolean indicating whether the patient is receiving immunosuppressive agents at any time during the two weeks prior to the study vaccination event."} ;; "receiving immunosuppressive agents during the two weeks prior to study vaccination"
(declare-const patient_is_exposed_to_corticosteroid_and_corticosteroid_derivative_inthepast2weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient was exposed to corticosteroid and corticosteroid derivative agents at any time during the two weeks prior to now.","when_to_set_to_false":"Set to false if the patient was not exposed to corticosteroid and corticosteroid derivative agents during the two weeks prior to now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was exposed to corticosteroid and corticosteroid derivative agents during the two weeks prior to now.","meaning":"Boolean indicating whether the patient was exposed to corticosteroid and corticosteroid derivative agents in the two weeks prior to now."} ;; "systemic corticosteroid agents"
(declare-const patient_is_exposed_to_corticosteroid_and_corticosteroid_derivative_inthepast2weeks@@temporalcontext_within2weeks_before_study_vaccination Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to corticosteroid and corticosteroid derivative agents occurred within the two weeks before the study vaccination event.","when_to_set_to_false":"Set to false if the patient's exposure did not occur within the two weeks before the study vaccination event.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure occurred within the two weeks before the study vaccination event.","meaning":"Boolean indicating whether the patient's exposure to corticosteroid and corticosteroid derivative agents occurred within the two weeks before the study vaccination event."} ;; "systemic corticosteroid agents during the two weeks prior to study vaccination"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> patient_is_exposed_to_corticosteroid_and_corticosteroid_derivative_inthepast2weeks@@temporalcontext_within2weeks_before_study_vaccination
     patient_is_receiving_immunosuppressive_agents_within_2_weeks_before_study_vaccination)
:named REQ1_AUXILIARY0)) ;; "with non-exhaustive examples (systemic corticosteroid agents)"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_exposed_to_corticosteroid_and_corticosteroid_derivative_inthepast2weeks@@temporalcontext_within2weeks_before_study_vaccination
     patient_is_exposed_to_corticosteroid_and_corticosteroid_derivative_inthepast2weeks)
:named REQ1_AUXILIARY1)) ;; "systemic corticosteroid agents during the two weeks prior to study vaccination"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_is_receiving_immunosuppressive_agents_within_2_weeks_before_study_vaccination)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is receiving immunosuppressive agents with non-exhaustive examples (systemic corticosteroid agents) during the two weeks prior to study vaccination."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_allergy_to_egg_protein_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of allergy to egg protein.","when_to_set_to_false":"Set to false if the patient does not have a history of allergy to egg protein.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of allergy to egg protein.","meaning":"Boolean indicating whether the patient has a history of allergy to egg protein."} ;; "hypersensitivity to eggs"
(declare-const patient_has_finding_of_allergy_to_egg_protein_inthehistory@@documented Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of allergy to egg protein is documented.","when_to_set_to_false":"Set to false if the patient's history of allergy to egg protein is not documented.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the history is documented.","meaning":"Boolean indicating whether the patient's history of allergy to egg protein is documented."} ;; "documented hypersensitivity to eggs"
(declare-const patient_has_hypersensitivity_to_gelatin_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of hypersensitivity to gelatin.","when_to_set_to_false":"Set to false if the patient does not have a history of hypersensitivity to gelatin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of hypersensitivity to gelatin.","meaning":"Boolean indicating whether the patient has a history of hypersensitivity to gelatin."} ;; "gelatin"
(declare-const patient_has_hypersensitivity_to_sorbitol_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of hypersensitivity to sorbitol.","when_to_set_to_false":"Set to false if the patient does not have a history of hypersensitivity to sorbitol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of hypersensitivity to sorbitol.","meaning":"Boolean indicating whether the patient has a history of hypersensitivity to sorbitol."} ;; "sorbitol"
(declare-const patient_has_hypersensitivity_to_lactalbumin_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of hypersensitivity to lactalbumin.","when_to_set_to_false":"Set to false if the patient does not have a history of hypersensitivity to lactalbumin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of hypersensitivity to lactalbumin.","meaning":"Boolean indicating whether the patient has a history of hypersensitivity to lactalbumin."} ;; "lactalbumin"
(declare-const patient_has_hypersensitivity_to_chicken_serum_protein_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of hypersensitivity to chicken serum protein.","when_to_set_to_false":"Set to false if the patient does not have a history of hypersensitivity to chicken serum protein.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of hypersensitivity to chicken serum protein.","meaning":"Boolean indicating whether the patient has a history of hypersensitivity to chicken serum protein."} ;; "chicken protein"
(declare-const patient_has_had_life_threatening_reaction_to_influenza_vaccination_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a life-threatening reaction to previous influenza vaccinations in the history.","when_to_set_to_false":"Set to false if the patient has not had a life-threatening reaction to previous influenza vaccinations in the history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a life-threatening reaction to previous influenza vaccinations in the history.","meaning":"Boolean indicating whether the patient has had a life-threatening reaction to previous influenza vaccinations in the history."} ;; "life-threatening reactions to previous influenza vaccinations"
(declare-const patient_has_undergone_influenza_vaccination_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone influenza vaccination in the past.","when_to_set_to_false":"Set to false if the patient has not undergone influenza vaccination in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone influenza vaccination in the past.","meaning":"Boolean indicating whether the patient has undergone influenza vaccination in the past."} ;; "influenza vaccinations"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable for egg allergy
(assert
(! (=> patient_has_finding_of_allergy_to_egg_protein_inthehistory@@documented
       patient_has_finding_of_allergy_to_egg_protein_inthehistory)
    :named REQ2_AUXILIARY0)) ;; "documented hypersensitivity to eggs"

;; Non-exhaustive examples imply umbrella term for vaccine component hypersensitivity
;; (gelatin, sorbitol, lactalbumin, chicken protein) are examples of hypersensitivity to vaccine components
(declare-const patient_has_hypersensitivity_to_vaccine_component_inthehistory@@documented Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of documented hypersensitivity to any component of the vaccine.","when_to_set_to_false":"Set to false if the patient does not have a history of documented hypersensitivity to any component of the vaccine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of documented hypersensitivity to any component of the vaccine.","meaning":"Boolean indicating whether the patient has a history of documented hypersensitivity to any component of the vaccine."} ;; "documented hypersensitivity to components of the vaccine"
(assert
(! (=> (or patient_has_hypersensitivity_to_gelatin_inthehistory
           patient_has_hypersensitivity_to_sorbitol_inthehistory
           patient_has_hypersensitivity_to_lactalbumin_inthehistory
           patient_has_hypersensitivity_to_chicken_serum_protein_inthehistory)
       patient_has_hypersensitivity_to_vaccine_component_inthehistory@@documented)
    :named REQ2_AUXILIARY1)) ;; "non-exhaustive examples (gelatin, sorbitol, lactalbumin, chicken protein)"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Exclusion: history of documented hypersensitivity to eggs
(assert
(! (not patient_has_finding_of_allergy_to_egg_protein_inthehistory@@documented)
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "history of documented hypersensitivity to eggs"

;; Exclusion: history of documented hypersensitivity to components of the vaccine (with non-exhaustive examples)
(assert
(! (not patient_has_hypersensitivity_to_vaccine_component_inthehistory@@documented)
    :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "history of documented hypersensitivity to components of the vaccine with non-exhaustive examples (gelatin, sorbitol, lactalbumin, chicken protein)"

;; Exclusion: life-threatening reactions to previous influenza vaccinations
(assert
(! (not patient_has_had_life_threatening_reaction_to_influenza_vaccination_inthehistory)
    :named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "life-threatening reactions to previous influenza vaccinations"

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_undergoing_aspirin_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving aspirin therapy.","when_to_set_to_false":"Set to false if the patient is not currently receiving aspirin therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving aspirin therapy.","meaning":"Boolean indicating whether the patient is currently receiving aspirin therapy."} ;; "the patient is receiving aspirin therapy currently"
(declare-const patient_is_undergoing_aspirin_containing_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving any therapy that contains aspirin.","when_to_set_to_false":"Set to false if the patient is not currently receiving any therapy that contains aspirin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving any therapy that contains aspirin.","meaning":"Boolean indicating whether the patient is currently receiving any therapy that contains aspirin."} ;; "the patient is receiving aspirin-containing therapy currently"
(declare-const patient_is_undergoing_aspirin_therapy_inthepast2weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient was receiving aspirin therapy at any time during the two weeks before study vaccination.","when_to_set_to_false":"Set to false if the patient was not receiving aspirin therapy at any time during the two weeks before study vaccination.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was receiving aspirin therapy during the two weeks before study vaccination.","meaning":"Boolean indicating whether the patient was receiving aspirin therapy during the two weeks before study vaccination."} ;; "the patient is receiving aspirin therapy during the two weeks before study vaccination"
(declare-const patient_is_undergoing_aspirin_therapy_inthepast2weeks@@temporalcontext_within2weeks_before_study_vaccination Bool) ;; {"when_to_set_to_true":"Set to true if the two-week window is anchored to the period immediately before the study vaccination.","when_to_set_to_false":"Set to false if the two-week window is not anchored to the period before study vaccination.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the two-week window is anchored to the period before study vaccination.","meaning":"Boolean indicating whether the two-week window is specifically the two weeks before study vaccination."} ;; "the patient is receiving aspirin therapy during the two weeks before study vaccination"
(declare-const patient_is_undergoing_aspirin_containing_therapy_inthepast2weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient was receiving any therapy that contains aspirin at any time during the two weeks before study vaccination.","when_to_set_to_false":"Set to false if the patient was not receiving any therapy that contains aspirin at any time during the two weeks before study vaccination.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was receiving any therapy that contains aspirin during the two weeks before study vaccination.","meaning":"Boolean indicating whether the patient was receiving any therapy that contains aspirin during the two weeks before study vaccination."} ;; "the patient is receiving aspirin-containing therapy during the two weeks before study vaccination"
(declare-const patient_is_undergoing_aspirin_containing_therapy_inthepast2weeks@@temporalcontext_within2weeks_before_study_vaccination Bool) ;; {"when_to_set_to_true":"Set to true if the two-week window is anchored to the period immediately before the study vaccination.","when_to_set_to_false":"Set to false if the two-week window is not anchored to the period before study vaccination.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the two-week window is anchored to the period before study vaccination.","meaning":"Boolean indicating whether the two-week window is specifically the two weeks before study vaccination."} ;; "the patient is receiving aspirin-containing therapy during the two weeks before study vaccination"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_is_undergoing_aspirin_therapy_inthepast2weeks@@temporalcontext_within2weeks_before_study_vaccination
      patient_is_undergoing_aspirin_therapy_inthepast2weeks)
:named REQ3_AUXILIARY0)) ;; "the patient is receiving aspirin therapy during the two weeks before study vaccination"

(assert
(! (=> patient_is_undergoing_aspirin_containing_therapy_inthepast2weeks@@temporalcontext_within2weeks_before_study_vaccination
      patient_is_undergoing_aspirin_containing_therapy_inthepast2weeks)
:named REQ3_AUXILIARY1)) ;; "the patient is receiving aspirin-containing therapy during the two weeks before study vaccination"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_is_undergoing_aspirin_therapy_now)
:named REQ3_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient is receiving aspirin therapy currently"

(assert
(! (not patient_is_undergoing_aspirin_containing_therapy_now)
:named REQ3_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient is receiving aspirin-containing therapy currently"

(assert
(! (not patient_is_undergoing_aspirin_therapy_inthepast2weeks@@temporalcontext_within2weeks_before_study_vaccination)
:named REQ3_COMPONENT2_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient is receiving aspirin therapy during the two weeks before study vaccination"

(assert
(! (not patient_is_undergoing_aspirin_containing_therapy_inthepast2weeks@@temporalcontext_within2weeks_before_study_vaccination)
:named REQ3_COMPONENT3_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient is receiving aspirin-containing therapy during the two weeks before study vaccination"

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const household_member_is_currently_participating_in_respiratory_vaccination_study Bool) ;; {"when_to_set_to_true":"Set to true if at least one member of the patient's household is currently participating in a respiratory vaccination study.","when_to_set_to_false":"Set to false if no member of the patient's household is currently participating in a respiratory vaccination study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether any member of the patient's household is currently participating in a respiratory vaccination study.","meaning":"Boolean indicating whether any member of the patient's household is currently participating in a respiratory vaccination study."} ;; "household with somebody currently participating in a respiratory vaccination study"
(declare-const household_member_is_currently_participating_in_respiratory_antiviral_study Bool) ;; {"when_to_set_to_true":"Set to true if at least one member of the patient's household is currently participating in a respiratory antiviral study.","when_to_set_to_false":"Set to false if no member of the patient's household is currently participating in a respiratory antiviral study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether any member of the patient's household is currently participating in a respiratory antiviral study.","meaning":"Boolean indicating whether any member of the patient's household is currently participating in a respiratory antiviral study."} ;; "household with somebody currently participating in a respiratory antiviral study"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not household_member_is_currently_participating_in_respiratory_vaccination_study)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient lives in a household with somebody currently participating in a respiratory vaccination study."

(assert
(! (not household_member_is_currently_participating_in_respiratory_antiviral_study)
:named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient lives in a household with somebody currently participating in a respiratory antiviral study."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_is_undergoing_clinical_trial_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently participating in any clinical trial.","when_to_set_to_false":"Set to false if the patient is not currently participating in any clinical trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently participating in any clinical trial.","meaning":"Boolean indicating whether the patient is currently participating in any clinical trial."} ;; "current participation in any clinical trial"
(declare-const patient_is_undergoing_clinical_trial_now@@involves_drug_with_activity_against_respiratory_disease Bool) ;; {"when_to_set_to_true":"Set to true if the clinical trial in which the patient is currently participating involves a drug with activity against respiratory disease.","when_to_set_to_false":"Set to false if the clinical trial does not involve a drug with activity against respiratory disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the clinical trial involves a drug with activity against respiratory disease.","meaning":"Boolean indicating whether the clinical trial involves a drug with activity against respiratory disease."} ;; "current participation in any clinical trial involving a drug with activity against respiratory disease"
(declare-const patient_is_undergoing_clinical_trial_now@@involves_biologic_with_activity_against_respiratory_disease Bool) ;; {"when_to_set_to_true":"Set to true if the clinical trial in which the patient is currently participating involves a biologic with activity against respiratory disease.","when_to_set_to_false":"Set to false if the clinical trial does not involve a biologic with activity against respiratory disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the clinical trial involves a biologic with activity against respiratory disease.","meaning":"Boolean indicating whether the clinical trial involves a biologic with activity against respiratory disease."} ;; "current participation in any clinical trial involving a biologic with activity against respiratory disease"
(declare-const patient_has_undergone_clinical_trial_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever participated in any clinical trial in the past.","when_to_set_to_false":"Set to false if the patient has never participated in any clinical trial in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever participated in any clinical trial in the past.","meaning":"Boolean indicating whether the patient has ever participated in any clinical trial in the past."} ;; "past participation in any clinical trial"
(declare-const patient_has_undergone_clinical_trial_inthehistory@@involves_drug_with_activity_against_respiratory_disease Bool) ;; {"when_to_set_to_true":"Set to true if the clinical trial in which the patient participated involved a drug with activity against respiratory disease.","when_to_set_to_false":"Set to false if the clinical trial did not involve a drug with activity against respiratory disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the clinical trial involved a drug with activity against respiratory disease.","meaning":"Boolean indicating whether the clinical trial involved a drug with activity against respiratory disease."} ;; "past participation in any clinical trial involving a drug with activity against respiratory disease"
(declare-const patient_has_undergone_clinical_trial_inthehistory@@involves_biologic_with_activity_against_respiratory_disease Bool) ;; {"when_to_set_to_true":"Set to true if the clinical trial in which the patient participated involved a biologic with activity against respiratory disease.","when_to_set_to_false":"Set to false if the clinical trial did not involve a biologic with activity against respiratory disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the clinical trial involved a biologic with activity against respiratory disease.","meaning":"Boolean indicating whether the clinical trial involved a biologic with activity against respiratory disease."} ;; "past participation in any clinical trial involving a biologic with activity against respiratory disease"
(declare-const patient_has_undergone_clinical_trial_inthehistory@@temporalcontext_within_2_months_before_trial_enrollment_visit Bool) ;; {"when_to_set_to_true":"Set to true if the patient's participation in the clinical trial occurred within two months prior to the trial enrollment visit.","when_to_set_to_false":"Set to false if the patient's participation did not occur within two months prior to the trial enrollment visit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's participation occurred within two months prior to the trial enrollment visit.","meaning":"Boolean indicating whether the patient's participation occurred within two months prior to the trial enrollment visit."} ;; "past participation within two months of trial enrollment visit"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variables imply corresponding stem variables for current participation
(assert
(! (=> patient_is_undergoing_clinical_trial_now@@involves_drug_with_activity_against_respiratory_disease
      patient_is_undergoing_clinical_trial_now)
    :named REQ5_AUXILIARY0)) ;; "current participation in any clinical trial involving a drug with activity against respiratory disease"

(assert
(! (=> patient_is_undergoing_clinical_trial_now@@involves_biologic_with_activity_against_respiratory_disease
      patient_is_undergoing_clinical_trial_now)
    :named REQ5_AUXILIARY1)) ;; "current participation in any clinical trial involving a biologic with activity against respiratory disease"

;; Qualifier variables imply corresponding stem variables for past participation
(assert
(! (=> patient_has_undergone_clinical_trial_inthehistory@@involves_drug_with_activity_against_respiratory_disease
      patient_has_undergone_clinical_trial_inthehistory)
    :named REQ5_AUXILIARY2)) ;; "past participation in any clinical trial involving a drug with activity against respiratory disease"

(assert
(! (=> patient_has_undergone_clinical_trial_inthehistory@@involves_biologic_with_activity_against_respiratory_disease
      patient_has_undergone_clinical_trial_inthehistory)
    :named REQ5_AUXILIARY3)) ;; "past participation in any clinical trial involving a biologic with activity against respiratory disease"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Exclusion: patient must NOT satisfy any of the four exclusion conditions
(assert
(! (not (or
    patient_is_undergoing_clinical_trial_now@@involves_drug_with_activity_against_respiratory_disease
    patient_is_undergoing_clinical_trial_now@@involves_biologic_with_activity_against_respiratory_disease
    (and patient_has_undergone_clinical_trial_inthehistory@@involves_drug_with_activity_against_respiratory_disease
         patient_has_undergone_clinical_trial_inthehistory@@temporalcontext_within_2_months_before_trial_enrollment_visit)
    (and patient_has_undergone_clinical_trial_inthehistory@@involves_biologic_with_activity_against_respiratory_disease
         patient_has_undergone_clinical_trial_inthehistory@@temporalcontext_within_2_months_before_trial_enrollment_visit)
    ))
    :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has current participation in any clinical trial involving a drug with activity against respiratory disease) OR (the patient has current participation in any clinical trial involving a biologic with activity against respiratory disease) OR (the patient has past participation within two months of trial enrollment visit in any clinical trial involving a drug with activity against respiratory disease) OR (the patient has past participation within two months of trial enrollment visit in any clinical trial involving a biologic with activity against respiratory disease))."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_condition_determined_by_investigator_as_likely_to_interfere_with_evaluation_of_vaccine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any condition that is determined by the investigator as likely to interfere with evaluation of the vaccine.","when_to_set_to_false":"Set to false if the patient currently does not have any condition that is determined by the investigator as likely to interfere with evaluation of the vaccine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any condition that is determined by the investigator as likely to interfere with evaluation of the vaccine.","meaning":"Boolean indicating whether the patient currently has any condition that is determined by the investigator as likely to interfere with evaluation of the vaccine."} ;; "the patient has any condition determined by the investigator as likely to interfere with evaluation of the vaccine"
(declare-const patient_has_condition_determined_by_investigator_as_likely_to_be_significant_potential_health_risk_to_child_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any condition that is determined by the investigator as likely to be a significant potential health risk to the child.","when_to_set_to_false":"Set to false if the patient currently does not have any condition that is determined by the investigator as likely to be a significant potential health risk to the child.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any condition that is determined by the investigator as likely to be a significant potential health risk to the child.","meaning":"Boolean indicating whether the patient currently has any condition that is determined by the investigator as likely to be a significant potential health risk to the child."} ;; "the patient has any condition determined by the investigator as likely to be a significant potential health risk to the child"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_condition_determined_by_investigator_as_likely_to_interfere_with_evaluation_of_vaccine_now)
    :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any condition determined by the investigator as likely to interfere with evaluation of the vaccine."

(assert
(! (not patient_has_condition_determined_by_investigator_as_likely_to_be_significant_potential_health_risk_to_child_now)
    :named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any condition determined by the investigator as likely to be a significant potential health risk to the child."
