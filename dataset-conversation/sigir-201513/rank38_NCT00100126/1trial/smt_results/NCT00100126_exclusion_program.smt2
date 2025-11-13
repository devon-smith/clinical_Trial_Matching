;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_swallowing_painful_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of painful swallowing (odynophagia).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of painful swallowing (odynophagia).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has painful swallowing (odynophagia).","meaning":"Boolean indicating whether the patient currently has painful swallowing (odynophagia)."}
(declare-const patient_has_finding_of_swallowing_painful_now@@chronic Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current painful swallowing (odynophagia) is chronic.","when_to_set_to_false":"Set to false if the patient's current painful swallowing (odynophagia) is not chronic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current painful swallowing (odynophagia) is chronic.","meaning":"Boolean indicating whether the patient's current painful swallowing (odynophagia) is chronic."}
(declare-const patient_has_finding_of_swallowing_painful_now@@recurrent Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current painful swallowing (odynophagia) is recurrent.","when_to_set_to_false":"Set to false if the patient's current painful swallowing (odynophagia) is not recurrent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current painful swallowing (odynophagia) is recurrent.","meaning":"Boolean indicating whether the patient's current painful swallowing (odynophagia) is recurrent."}
(declare-const patient_has_finding_of_swallowing_painful_now@@episode_duration_at_least_two_weeks Bool) ;; {"when_to_set_to_true":"Set to true if each episode of the patient's current painful swallowing (odynophagia) lasts at least two weeks.","when_to_set_to_false":"Set to false if any episode of the patient's current painful swallowing (odynophagia) lasts less than two weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether each episode lasts at least two weeks.","meaning":"Boolean indicating whether each episode of the patient's current painful swallowing (odynophagia) lasts at least two weeks."}
(declare-const patient_has_finding_of_swallowing_painful_now@@frequency_at_least_two_times_per_year Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current painful swallowing (odynophagia) occurs at least two times per year.","when_to_set_to_false":"Set to false if the patient's current painful swallowing (odynophagia) occurs less than two times per year.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the episodes occur at least two times per year.","meaning":"Boolean indicating whether the patient's current painful swallowing (odynophagia) occurs at least two times per year."}
(declare-const patient_has_finding_of_large_tonsils_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of enlarged tonsils.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of enlarged tonsils.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has enlarged tonsils.","meaning":"Boolean indicating whether the patient currently has enlarged tonsils."}
(declare-const patient_has_finding_of_large_tonsils_now@@secondary_to_viral_etiology Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current enlarged tonsils are secondary to viral etiology.","when_to_set_to_false":"Set to false if the patient's current enlarged tonsils are not secondary to viral etiology.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current enlarged tonsils are secondary to viral etiology.","meaning":"Boolean indicating whether the patient's current enlarged tonsils are secondary to viral etiology."}
(declare-const patient_has_finding_of_large_tonsils_now@@secondary_to_proven_bacterial_etiology Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current enlarged tonsils are secondary to proven bacterial etiology.","when_to_set_to_false":"Set to false if the patient's current enlarged tonsils are not secondary to proven bacterial etiology.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current enlarged tonsils are secondary to proven bacterial etiology.","meaning":"Boolean indicating whether the patient's current enlarged tonsils are secondary to proven bacterial etiology."}

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_swallowing_painful_now@@chronic
       patient_has_finding_of_swallowing_painful_now)
   :named REQ0_AUXILIARY0)) ;; "chronic odynophagia"

(assert
(! (=> patient_has_finding_of_swallowing_painful_now@@recurrent
       patient_has_finding_of_swallowing_painful_now)
   :named REQ0_AUXILIARY1)) ;; "recurrent odynophagia"

(assert
(! (=> patient_has_finding_of_swallowing_painful_now@@episode_duration_at_least_two_weeks
       patient_has_finding_of_swallowing_painful_now@@recurrent)
   :named REQ0_AUXILIARY2)) ;; "duration ≥ two weeks per episode" (applies to recurrent odynophagia)

(assert
(! (=> patient_has_finding_of_swallowing_painful_now@@frequency_at_least_two_times_per_year
       patient_has_finding_of_swallowing_painful_now@@recurrent)
   :named REQ0_AUXILIARY3)) ;; "frequency ≥ two times per year" (applies to recurrent odynophagia)

(assert
(! (=> patient_has_finding_of_large_tonsils_now@@secondary_to_viral_etiology
       patient_has_finding_of_large_tonsils_now)
   :named REQ0_AUXILIARY4)) ;; "enlarged tonsils secondary to viral etiology"

(assert
(! (=> patient_has_finding_of_large_tonsils_now@@secondary_to_proven_bacterial_etiology
       patient_has_finding_of_large_tonsils_now)
   :named REQ0_AUXILIARY5)) ;; "enlarged tonsils secondary to proven bacterial etiology"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion: patient must NOT have any of the following:
;; (chronic odynophagia) OR (recurrent odynophagia with duration ≥ two weeks per episode AND frequency ≥ two times per year)
;; OR (enlarged tonsils secondary to viral etiology) OR (enlarged tonsils secondary to proven bacterial etiology)
(assert
(! (not
      (or patient_has_finding_of_swallowing_painful_now@@chronic
          (and patient_has_finding_of_swallowing_painful_now@@recurrent
               patient_has_finding_of_swallowing_painful_now@@episode_duration_at_least_two_weeks
               patient_has_finding_of_swallowing_painful_now@@frequency_at_least_two_times_per_year)
          patient_has_finding_of_large_tonsils_now@@secondary_to_viral_etiology
          patient_has_finding_of_large_tonsils_now@@secondary_to_proven_bacterial_etiology))
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has chronic odynophagia) OR (the patient has recurrent odynophagia with qualifiers (duration ≥ two weeks per episode AND frequency ≥ two times per year)) OR (the patient has enlarged tonsils secondary to viral etiology) OR (the patient has enlarged tonsils secondary to proven bacterial etiology))."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_need_for_hospitalization_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a need for hospitalization.","when_to_set_to_false":"Set to false if the patient currently does not have a need for hospitalization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a need for hospitalization.","meaning":"Boolean indicating whether the patient currently has a need for hospitalization."} ;; "the patient has the need for hospitalization"
(declare-const patient_has_need_for_intravenous_antimicrobial_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a need for intravenous antimicrobial therapy.","when_to_set_to_false":"Set to false if the patient currently does not have a need for intravenous antimicrobial therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a need for intravenous antimicrobial therapy.","meaning":"Boolean indicating whether the patient currently has a need for intravenous antimicrobial therapy."} ;; "the patient has the need for intravenous antimicrobial therapy"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (not patient_has_need_for_hospitalization_now)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has the need for hospitalization."

(assert
  (! (not patient_has_need_for_intravenous_antimicrobial_therapy_now)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has the need for intravenous antimicrobial therapy."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_pharyngitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of pharyngitis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of pharyngitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of pharyngitis.","meaning":"Boolean indicating whether the patient currently has pharyngitis."} ;; "pharyngitis"

(declare-const patient_has_finding_of_pharyngitis_now@@known_due_to_pathogen_resistant_to_beta_lactam_antimicrobials Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current pharyngitis is known to be due to a pathogen resistant to beta-lactam antimicrobials.","when_to_set_to_false":"Set to false if the patient's current pharyngitis is known not to be due to a pathogen resistant to beta-lactam antimicrobials.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current pharyngitis is known to be due to a pathogen resistant to beta-lactam antimicrobials.","meaning":"Boolean indicating whether the patient's current pharyngitis is known to be due to a pathogen resistant to beta-lactam antimicrobials."} ;; "pharyngitis known to be due to a pathogen resistant to beta-lactam antimicrobials"

(declare-const patient_has_finding_of_pharyngitis_now@@suspected_due_to_pathogen_resistant_to_beta_lactam_antimicrobials Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current pharyngitis is suspected to be due to a pathogen resistant to beta-lactam antimicrobials.","when_to_set_to_false":"Set to false if the patient's current pharyngitis is suspected not to be due to a pathogen resistant to beta-lactam antimicrobials.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current pharyngitis is suspected to be due to a pathogen resistant to beta-lactam antimicrobials.","meaning":"Boolean indicating whether the patient's current pharyngitis is suspected to be due to a pathogen resistant to beta-lactam antimicrobials."} ;; "pharyngitis suspected to be due to a pathogen resistant to beta-lactam antimicrobials"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_pharyngitis_now@@known_due_to_pathogen_resistant_to_beta_lactam_antimicrobials
      patient_has_finding_of_pharyngitis_now)
   :named REQ2_AUXILIARY0)) ;; "pharyngitis known to be due to a pathogen resistant to beta-lactam antimicrobials"

(assert
(! (=> patient_has_finding_of_pharyngitis_now@@suspected_due_to_pathogen_resistant_to_beta_lactam_antimicrobials
      patient_has_finding_of_pharyngitis_now)
   :named REQ2_AUXILIARY1)) ;; "pharyngitis suspected to be due to a pathogen resistant to beta-lactam antimicrobials"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_pharyngitis_now@@known_due_to_pathogen_resistant_to_beta_lactam_antimicrobials)
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has pharyngitis known to be due to a pathogen resistant to beta-lactam antimicrobials."

(assert
(! (not patient_has_finding_of_pharyngitis_now@@suspected_due_to_pathogen_resistant_to_beta_lactam_antimicrobials)
   :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has pharyngitis suspected to be due to a pathogen resistant to beta-lactam antimicrobials."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_carrier_of_streptococcus_pyogenes_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a carrier of Streptococcus pyogenes.","when_to_set_to_false":"Set to false if the patient is currently not a carrier of Streptococcus pyogenes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a carrier of Streptococcus pyogenes.","meaning":"Boolean indicating whether the patient is currently a carrier of Streptococcus pyogenes."} ;; "the patient is a carrier of Streptococcus pyogenes"

(declare-const patient_is_carrier_of_streptococcus_pyogenes_now@@known_carrier_status Bool) ;; {"when_to_set_to_true":"Set to true if the patient's carrier status of Streptococcus pyogenes is known (confirmed or documented).","when_to_set_to_false":"Set to false if the patient's carrier status of Streptococcus pyogenes is not known (not confirmed or not documented).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's carrier status of Streptococcus pyogenes is known.","meaning":"Boolean indicating whether the patient's carrier status of Streptococcus pyogenes is known (confirmed or documented)."} ;; "known carrier of Streptococcus pyogenes"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_carrier_of_streptococcus_pyogenes_now@@known_carrier_status
      patient_is_carrier_of_streptococcus_pyogenes_now)
:named REQ3_AUXILIARY0)) ;; "known carrier of Streptococcus pyogenes"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_is_carrier_of_streptococcus_pyogenes_now@@known_carrier_status)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a known carrier of Streptococcus pyogenes."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_allergy_to_penicillin_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had an allergy to penicillin at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had an allergy to penicillin at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had an allergy to penicillin.","meaning":"Boolean indicating whether the patient has ever had an allergy to penicillin in their history."} ;; "the patient has a previous allergy to penicillin"
(declare-const patient_has_finding_of_allergy_to_beta_lactam_antimicrobial_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had an allergy to any member of the beta-lactam class of antimicrobials at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had an allergy to any member of the beta-lactam class of antimicrobials at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had an allergy to any member of the beta-lactam class of antimicrobials.","meaning":"Boolean indicating whether the patient has ever had an allergy to any member of the beta-lactam class of antimicrobials in their history."} ;; "the patient has a previous allergy to any other member of the beta-lactam class of antimicrobials"
(declare-const patient_has_finding_of_serious_adverse_reaction_to_penicillin_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a serious adverse reaction to penicillin at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had a serious adverse reaction to penicillin at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a serious adverse reaction to penicillin.","meaning":"Boolean indicating whether the patient has ever had a serious adverse reaction to penicillin in their history."} ;; "the patient has a previous serious adverse reaction to penicillin"
(declare-const patient_has_finding_of_serious_adverse_reaction_to_beta_lactam_antimicrobial_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a serious adverse reaction to any member of the beta-lactam class of antimicrobials at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had a serious adverse reaction to any member of the beta-lactam class of antimicrobials at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a serious adverse reaction to any member of the beta-lactam class of antimicrobials.","meaning":"Boolean indicating whether the patient has ever had a serious adverse reaction to any member of the beta-lactam class of antimicrobials in their history."} ;; "the patient has a previous serious adverse reaction to any other member of the beta-lactam class of antimicrobials"
(declare-const patient_has_finding_of_intolerance_to_penicillin_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had intolerance to penicillin at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had intolerance to penicillin at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had intolerance to penicillin.","meaning":"Boolean indicating whether the patient has ever had intolerance to penicillin in their history."} ;; "the patient has intolerance to penicillin"
(declare-const patient_has_finding_of_intolerance_to_beta_lactam_antimicrobial_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had intolerance to any member of the beta-lactam class of antimicrobials at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had intolerance to any member of the beta-lactam class of antimicrobials at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had intolerance to any member of the beta-lactam class of antimicrobials.","meaning":"Boolean indicating whether the patient has ever had intolerance to any member of the beta-lactam class of antimicrobials in their history."} ;; "the patient has intolerance to any other member of the beta-lactam class of antimicrobials"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_allergy_to_penicillin_inthehistory)
    :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a previous allergy to penicillin."

(assert
(! (not patient_has_finding_of_allergy_to_beta_lactam_antimicrobial_inthehistory)
    :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a previous allergy to any other member of the beta-lactam class of antimicrobials."

(assert
(! (not patient_has_finding_of_serious_adverse_reaction_to_penicillin_inthehistory)
    :named REQ4_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a previous serious adverse reaction to penicillin."

(assert
(! (not patient_has_finding_of_serious_adverse_reaction_to_beta_lactam_antimicrobial_inthehistory)
    :named REQ4_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a previous serious adverse reaction to any other member of the beta-lactam class of antimicrobials."

(assert
(! (not patient_has_finding_of_intolerance_to_penicillin_inthehistory)
    :named REQ4_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has intolerance to penicillin."

(assert
(! (not patient_has_finding_of_intolerance_to_beta_lactam_antimicrobial_inthehistory)
    :named REQ4_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has intolerance to any other member of the beta-lactam class of antimicrobials."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_serious_illness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any serious illness.","when_to_set_to_false":"Set to false if the patient currently does not have any serious illness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any serious illness.","meaning":"Boolean indicating whether the patient currently has any serious illness."} ;; "The patient is excluded if the patient has any serious illness."

(declare-const patient_has_finding_of_concomitant_condition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any concomitant condition.","when_to_set_to_false":"Set to false if the patient currently does not have any concomitant condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any concomitant condition.","meaning":"Boolean indicating whether the patient currently has any concomitant condition."} ;; "The patient is excluded if the patient has any concomitant condition..."

(declare-const patient_has_finding_of_concomitant_condition_now@@investigator_judges_would_preclude_study_evaluations Bool) ;; {"when_to_set_to_true":"Set to true if the investigator judges that the patient's concomitant condition would preclude the study evaluations.","when_to_set_to_false":"Set to false if the investigator judges that the patient's concomitant condition would not preclude the study evaluations.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the investigator judges that the patient's concomitant condition would preclude the study evaluations.","meaning":"Boolean indicating whether the investigator judges that the patient's concomitant condition would preclude the study evaluations."} ;; "The patient is excluded if the patient has any concomitant condition that the investigator judges would preclude the study evaluations."

(declare-const patient_has_finding_of_concomitant_condition_now@@investigator_judges_would_make_completion_of_study_therapy_and_followup_unlikely Bool) ;; {"when_to_set_to_true":"Set to true if the investigator judges that the patient's concomitant condition would make it unlikely that the course of study therapy and follow-up could be completed.","when_to_set_to_false":"Set to false if the investigator judges that the patient's concomitant condition would not make it unlikely that the course of study therapy and follow-up could be completed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the investigator judges that the patient's concomitant condition would make it unlikely that the course of study therapy and follow-up could be completed.","meaning":"Boolean indicating whether the investigator judges that the patient's concomitant condition would make it unlikely that the course of study therapy and follow-up could be completed."} ;; "The patient is excluded if the patient has any concomitant condition that the investigator judges would make it unlikely that the course of study therapy and follow-up could be completed."

(declare-const patient_has_finding_of_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disease.","when_to_set_to_false":"Set to false if the patient currently does not have a disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disease.","meaning":"Boolean indicating whether the patient currently has a disease."} ;; "disease"

(declare-const patient_has_finding_of_disease_now@@rapidly_progressive Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current disease is rapidly progressive.","when_to_set_to_false":"Set to false if the patient's current disease is not rapidly progressive.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current disease is rapidly progressive.","meaning":"Boolean indicating whether the patient's current disease is rapidly progressive."} ;; "rapidly progressive underlying disease"

(declare-const patient_has_finding_of_disease_now@@associated_with_shortened_life_expectancy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current disease is associated with a shortened life expectancy.","when_to_set_to_false":"Set to false if the patient's current disease is not associated with a shortened life expectancy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current disease is associated with a shortened life expectancy.","meaning":"Boolean indicating whether the patient's current disease is associated with a shortened life expectancy."} ;; "shortened life expectancy"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_concomitant_condition_now@@investigator_judges_would_preclude_study_evaluations
      patient_has_finding_of_concomitant_condition_now)
    :named REQ5_AUXILIARY0)) ;; "The patient has any concomitant condition that the investigator judges would preclude the study evaluations."

(assert
(! (=> patient_has_finding_of_concomitant_condition_now@@investigator_judges_would_make_completion_of_study_therapy_and_followup_unlikely
      patient_has_finding_of_concomitant_condition_now)
    :named REQ5_AUXILIARY1)) ;; "The patient has any concomitant condition that the investigator judges would make it unlikely that the course of study therapy and follow-up could be completed."

(assert
(! (=> patient_has_finding_of_disease_now@@rapidly_progressive
      patient_has_finding_of_disease_now)
    :named REQ5_AUXILIARY2)) ;; "rapidly progressive underlying disease"

(assert
(! (=> patient_has_finding_of_disease_now@@associated_with_shortened_life_expectancy
      patient_has_finding_of_disease_now)
    :named REQ5_AUXILIARY3)) ;; "shortened life expectancy"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_serious_illness_now)
    :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any serious illness."

(assert
(! (not patient_has_finding_of_concomitant_condition_now@@investigator_judges_would_preclude_study_evaluations)
    :named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any concomitant condition that the investigator judges would preclude the study evaluations."

(assert
(! (not patient_has_finding_of_concomitant_condition_now@@investigator_judges_would_make_completion_of_study_therapy_and_followup_unlikely)
    :named REQ5_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any concomitant condition that the investigator judges would make it unlikely that the course of study therapy and follow-up could be completed."

(assert
(! (not (and patient_has_finding_of_disease_now@@rapidly_progressive
             patient_has_finding_of_disease_now@@associated_with_shortened_life_expectancy))
    :named REQ5_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any rapidly progressive underlying disease with a shortened life expectancy."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_unable_to_swallow_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of inability to swallow.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of inability to swallow.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of inability to swallow.","meaning":"Boolean indicating whether the patient currently has inability to swallow."} ;; "the patient has the inability to swallow"
(declare-const patient_has_finding_of_unable_to_swallow_now@@specific_to_study_dosage_form Bool) ;; {"when_to_set_to_true":"Set to true if the patient's inability to swallow is specific to the study dosage form.","when_to_set_to_false":"Set to false if the patient's inability to swallow is not specific to the study dosage form.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the inability to swallow is specific to the study dosage form.","meaning":"Boolean indicating whether the patient's inability to swallow is specific to the study dosage form."} ;; "the patient has the inability to swallow the study dosage form"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable implies the stem variable
(assert
(! (=> patient_has_finding_of_unable_to_swallow_now@@specific_to_study_dosage_form
      patient_has_finding_of_unable_to_swallow_now)
   :named REQ6_AUXILIARY0)) ;; "the patient has the inability to swallow the study dosage form"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_unable_to_swallow_now@@specific_to_study_dosage_form)
   :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has the inability to swallow the study dosage form."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_is_unable_to_understand_requirements_of_the_study Bool) ;; {"when_to_set_to_true":"Set to true if it is determined that the patient is unable to understand the requirements of the study.","when_to_set_to_false":"Set to false if it is determined that the patient is able to understand the requirements of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to understand the requirements of the study.","meaning":"Boolean indicating whether the patient is unable to understand the requirements of the study."} ;; "The patient is excluded if the patient is unable to understand the requirements of the study."

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_is_unable_to_understand_requirements_of_the_study)
    :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is unable to understand the requirements of the study."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_neutropenia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of neutropenia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of neutropenia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has neutropenia.","meaning":"Boolean indicating whether the patient currently has neutropenia."} ;; "neutropenia"

(declare-const polymorphonuclear_neutrophil_count_value_recorded_now_withunit_per_cubic_millimeter Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's current polymorphonuclear neutrophil count in units of per cubic millimeter.","when_to_set_to_null":"Set to null if the patient's current polymorphonuclear neutrophil count is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's current polymorphonuclear neutrophil count in units of per cubic millimeter."} ;; "polymorphonuclear neutrophils < 1000 per cubic millimeter"

(declare-const patient_has_finding_of_patient_immunocompromised_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of immunocompromised state.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of immunocompromised state.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an immunocompromised state.","meaning":"Boolean indicating whether the patient currently has an immunocompromised state."} ;; "immunocompromised state"

(declare-const patient_has_finding_of_patient_immunocompromised_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the patient's immunocompromised state is known (documented or established).","when_to_set_to_false":"Set to false if the patient's immunocompromised state is not known (not documented or not established).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the immunocompromised state is known.","meaning":"Boolean indicating whether the patient's immunocompromised state is known."} ;; "other known immunocompromised state"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Definition: Neutropenia with qualifier (polymorphonuclear neutrophils < 1000 per cubic millimeter)
(assert
(! (= patient_has_finding_of_neutropenia_now
     (< polymorphonuclear_neutrophil_count_value_recorded_now_withunit_per_cubic_millimeter 1000))
   :named REQ8_AUXILIARY0)) ;; "neutropenia (less than 1000 polymorphonuclear neutrophils per cubic millimeter)"

;; Qualifier variable implies corresponding stem variable for immunocompromised state
(assert
(! (=> patient_has_finding_of_patient_immunocompromised_now@@known
       patient_has_finding_of_patient_immunocompromised_now)
   :named REQ8_AUXILIARY1)) ;; "other known immunocompromised state"

;; ===================== Constraint Assertions (REQ 8) =====================
;; Exclusion: (neutropenia with qualifier) OR (other known immunocompromised state)
(assert
(! (not (or patient_has_finding_of_neutropenia_now
            patient_has_finding_of_patient_immunocompromised_now@@known))
   :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has neutropenia with qualifier (polymorphonuclear neutrophils < 1000 per cubic millimeter)) OR (the patient has other known immunocompromised state))."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_finding_of_chill_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of chills.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of chills.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chills.","meaning":"Boolean indicating whether the patient currently has chills now."} ;; "chills"
(declare-const patient_has_finding_of_chill_now@@hard Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chills and those chills are hard (severe).","when_to_set_to_false":"Set to false if the patient currently has chills but they are not hard (not severe).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's chills are hard.","meaning":"Boolean indicating whether the patient's current chills are hard (severe)."} ;; "hard chills"
(declare-const patient_has_finding_of_rigor_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of rigors.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of rigors.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has rigors.","meaning":"Boolean indicating whether the patient currently has rigors now."} ;; "rigors"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_chill_now@@hard
      patient_has_finding_of_chill_now)
:named REQ9_AUXILIARY0)) ;; "hard chills" implies "chills"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not (or patient_has_finding_of_chill_now@@hard
            patient_has_finding_of_rigor_now))
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has hard chills) OR (the patient has rigors))."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_diagnosis_of_seizure_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of seizure disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of seizure disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of seizure disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of seizure disorder."} ;; "the patient has a seizure disorder"
(declare-const patient_has_finding_of_lowered_convulsive_threshold_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of lowered seizure threshold.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of lowered seizure threshold.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of lowered seizure threshold.","meaning":"Boolean indicating whether the patient currently has a finding of lowered seizure threshold."} ;; "the patient has a lowered seizure threshold"
(declare-const patient_is_child_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently classified as a child according to clinical or study criteria.","when_to_set_to_false":"Set to false if the patient is currently not classified as a child according to clinical or study criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently classified as a child.","meaning":"Boolean indicating whether the patient is currently classified as a child according to clinical or study criteria."} ;; "child"
(declare-const patient_has_finding_of_febrile_convulsion_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of febrile convulsions (febrile seizures).","when_to_set_to_false":"Set to false if the patient does not have a documented history of febrile convulsions (febrile seizures).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of febrile convulsions (febrile seizures).","meaning":"Boolean indicating whether the patient has a history of febrile convulsions (febrile seizures)."} ;; "febrile seizures"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "child"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
  (! (not (and
            (or patient_has_diagnosis_of_seizure_disorder_now
                patient_has_finding_of_lowered_convulsive_threshold_now)
            (not (and patient_is_child_now
                      patient_has_finding_of_febrile_convulsion_inthehistory))))
     :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has a seizure disorder) OR (the patient has a lowered seizure threshold)) AND (the patient is NOT a child with previous febrile seizures)."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_finding_of_mental_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a psychiatric condition (mental disorder).","when_to_set_to_false":"Set to false if the patient currently does not have a psychiatric condition (mental disorder).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a psychiatric condition (mental disorder).","meaning":"Boolean indicating whether the patient currently has a psychiatric condition (mental disorder)."} ;; "psychiatric condition"
(declare-const patient_has_finding_of_mental_disorder_now@@requires_use_of_major_tranquilizers Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current psychiatric condition (mental disorder) requires use of major tranquilizers.","when_to_set_to_false":"Set to false if the patient's current psychiatric condition (mental disorder) does not require use of major tranquilizers.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current psychiatric condition (mental disorder) requires use of major tranquilizers.","meaning":"Boolean indicating whether the patient's current psychiatric condition (mental disorder) requires use of major tranquilizers."} ;; "psychiatric condition requiring use of major tranquilizers"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Qualifier variable implies stem variable
(assert
(! (=> patient_has_finding_of_mental_disorder_now@@requires_use_of_major_tranquilizers
      patient_has_finding_of_mental_disorder_now)
:named REQ11_AUXILIARY0)) ;; "psychiatric condition requiring use of major tranquilizers""

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_has_finding_of_mental_disorder_now@@requires_use_of_major_tranquilizers)
:named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a psychiatric condition requiring use of major tranquilizers."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as documented or reported.","when_to_set_to_false":"Set to false if the patient is currently not pregnant as documented or reported.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breastfeeding as documented or reported.","when_to_set_to_false":"Set to false if the patient is currently not breastfeeding as documented or reported.","when_to_set_to_null":"Set to null if the patient's current breastfeeding status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently breastfeeding."} ;; "the patient is nursing"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not patient_is_pregnant_now)
    :named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

(assert
(! (not patient_is_breastfeeding_now)
    :named REQ12_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is nursing."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_will_undergo_antibiotic_therapy_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is expected to require antibiotic therapy at any time in the future (i.e., during the study period).","when_to_set_to_false":"Set to false if the patient is not expected to require antibiotic therapy at any time in the future (i.e., during the study period).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is expected to require antibiotic therapy in the future.","meaning":"Boolean indicating whether the patient is expected to require antibiotic therapy at any time in the future."} ;; "antibacterial therapy"
(declare-const patient_will_undergo_antibiotic_therapy_inthefuture@@systemic_effective_additional_during_study Bool) ;; {"when_to_set_to_true":"Set to true if the expected future antibiotic therapy is systemic, effective, and additional, and is required during the duration of the study.","when_to_set_to_false":"Set to false if the expected future antibiotic therapy does not meet all these criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the expected future antibiotic therapy meets these criteria.","meaning":"Boolean indicating whether the expected future antibiotic therapy is systemic, effective, and additional, and required during the study duration."} ;; "the patient is expected to require additional effective systemic antibacterial therapy for any condition during the duration of the study"

;; ===================== Auxiliary Assertions (REQ 13) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_will_undergo_antibiotic_therapy_inthefuture@@systemic_effective_additional_during_study
      patient_will_undergo_antibiotic_therapy_inthefuture)
:named REQ13_AUXILIARY0)) ;; "systemic, effective, additional antibacterial therapy during the study implies antibiotic therapy in the future"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not patient_will_undergo_antibiotic_therapy_inthefuture@@systemic_effective_additional_during_study)
:named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is expected to require additional effective systemic antibacterial therapy for any condition during the duration of the study."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_has_finding_of_alcohol_abuse_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of alcohol abuse.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of alcohol abuse.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of alcohol abuse.","meaning":"Boolean indicating whether the patient currently has alcohol abuse."} ;; "the patient has current alcohol abuse"
(declare-const patient_has_finding_of_drug_abuse_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of drug abuse.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of drug abuse.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of drug abuse.","meaning":"Boolean indicating whether the patient currently has drug abuse."} ;; "the patient has current drug abuse"

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
  (! (not patient_has_finding_of_drug_abuse_now)
     :named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has current drug abuse."

(assert
  (! (not patient_has_finding_of_alcohol_abuse_now)
     :named REQ14_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has current alcohol abuse."

;; ===================== Declarations for the exclusion criterion (REQ 15) =====================
(declare-const patient_has_received_experimental_drug_within_previous_30_days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received any experimental drug within the previous thirty days.","when_to_set_to_false":"Set to false if the patient has not received any experimental drug within the previous thirty days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received any experimental drug within the previous thirty days.","meaning":"Boolean indicating whether the patient has received any experimental drug within the previous thirty days."} ;; "the patient has received any experimental drug within the previous thirty days"
(declare-const patient_has_received_experimental_medical_device_within_previous_30_days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received any experimental medical device within the previous thirty days.","when_to_set_to_false":"Set to false if the patient has not received any experimental medical device within the previous thirty days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received any experimental medical device within the previous thirty days.","meaning":"Boolean indicating whether the patient has received any experimental medical device within the previous thirty days."} ;; "the patient has received any experimental medical device within the previous thirty days"
(declare-const patient_is_scheduled_to_receive_experimental_procedure_during_study_period Bool) ;; {"when_to_set_to_true":"Set to true if the patient is scheduled to receive any other experimental procedures during the study period.","when_to_set_to_false":"Set to false if the patient is not scheduled to receive any other experimental procedures during the study period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is scheduled to receive any other experimental procedures during the study period.","meaning":"Boolean indicating whether the patient is scheduled to receive any other experimental procedures during the study period."} ;; "the patient is scheduled to receive any other experimental procedures during the study period"

;; ===================== Constraint Assertions (REQ 15) =====================
(assert
(! (not patient_has_received_experimental_drug_within_previous_30_days)
:named REQ15_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has received any experimental drug within the previous thirty days."

(assert
(! (not patient_has_received_experimental_medical_device_within_previous_30_days)
:named REQ15_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has received any experimental medical device within the previous thirty days."

(assert
(! (not patient_is_scheduled_to_receive_experimental_procedure_during_study_period)
:named REQ15_COMPONENT2_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is scheduled to receive any other experimental procedures during the study period."

;; ===================== Declarations for the exclusion criterion (REQ 16) =====================
(declare-const patient_has_had_previous_treatment_under_this_protocol Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had any previous treatment under this protocol.","when_to_set_to_false":"Set to false if the patient has never had any previous treatment under this protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had previous treatment under this protocol.","meaning":"Boolean indicating whether the patient has had previous treatment under this protocol."} ;; "the patient has had previous treatment under this protocol"

;; ===================== Constraint Assertions (REQ 16) =====================
(assert
  (! (not patient_has_had_previous_treatment_under_this_protocol)
     :named REQ16_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had previous treatment under this protocol."

;; ===================== Declarations for the exclusion criterion (REQ 17) =====================
(declare-const patient_has_taken_penicillin_g_benzathine_inthepast30days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken penicillin G benzathine within the past thirty days.","when_to_set_to_false":"Set to false if the patient has not taken penicillin G benzathine within the past thirty days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken penicillin G benzathine within the past thirty days.","meaning":"Boolean indicating whether the patient has taken penicillin G benzathine within the past thirty days."} ;; "the patient has received systemic antimicrobial therapy with benzathine penicillin within thirty days"
(declare-const patient_has_taken_azithromycin_containing_product_inthepast14days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken an azithromycin-containing product within the past fourteen days.","when_to_set_to_false":"Set to false if the patient has not taken an azithromycin-containing product within the past fourteen days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken an azithromycin-containing product within the past fourteen days.","meaning":"Boolean indicating whether the patient has taken an azithromycin-containing product within the past fourteen days."} ;; "the patient has received systemic antimicrobial therapy with azithromycin within fourteen days"

;; ===================== Constraint Assertions (REQ 17) =====================
(assert
(! (not patient_has_taken_penicillin_g_benzathine_inthepast30days)
:named REQ17_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received systemic antimicrobial therapy with benzathine penicillin within thirty days."

(assert
(! (not patient_has_taken_azithromycin_containing_product_inthepast14days)
:named REQ17_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received systemic antimicrobial therapy with azithromycin within fourteen days."

;; ===================== Declarations for the exclusion criterion (REQ 18) =====================
(declare-const patient_was_hospitalized_within_1_month_prior_to_study_admission Bool) ;; {"when_to_set_to_true":"Set to true if the patient was hospitalized at any time within the 1 month prior to study admission.","when_to_set_to_false":"Set to false if the patient was not hospitalized at any time within the 1 month prior to study admission.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was hospitalized within the 1 month prior to study admission.","meaning":"Boolean indicating whether the patient was hospitalized within the 1 month prior to study admission."} ;; "the patient was hospitalized within the month prior to study admission"

(declare-const patient_received_antibacterial_therapy_during_that_hospitalization Bool) ;; {"when_to_set_to_true":"Set to true if the patient received antibacterial therapy during the hospitalization that occurred within the 1 month prior to study admission.","when_to_set_to_false":"Set to false if the patient did not receive antibacterial therapy during the hospitalization that occurred within the 1 month prior to study admission.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient received antibacterial therapy during the hospitalization that occurred within the 1 month prior to study admission.","meaning":"Boolean indicating whether the patient received antibacterial therapy during the hospitalization that occurred within the 1 month prior to study admission."} ;; "the patient received antibacterial therapy during that hospitalization"

;; ===================== Constraint Assertions (REQ 18) =====================
(assert
(! (not (and patient_was_hospitalized_within_1_month_prior_to_study_admission
             patient_received_antibacterial_therapy_during_that_hospitalization))
   :named REQ18_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient was hospitalized within the month prior to study admission) AND (the patient received antibacterial therapy during that hospitalization))."

;; ===================== Declarations for the exclusion criterion (REQ 19) =====================
(declare-const patient_has_finding_of_hematologic_condition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a hematologic condition.","when_to_set_to_false":"Set to false if the patient currently does not have a hematologic condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a hematologic condition.","meaning":"Boolean indicating whether the patient currently has a hematologic condition."} ;; "hematologic conditions"
(declare-const patient_has_finding_of_hematologic_condition_now@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current hematologic condition is clinically significant.","when_to_set_to_false":"Set to false if the patient's current hematologic condition is not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current hematologic condition is clinically significant.","meaning":"Boolean indicating whether the patient's current hematologic condition is clinically significant."} ;; "clinically significant hematologic conditions"
(declare-const patient_has_finding_of_heart_valve_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a heart valve disorder (cardiac valvular disease).","when_to_set_to_false":"Set to false if the patient currently does not have a heart valve disorder (cardiac valvular disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a heart valve disorder (cardiac valvular disease).","meaning":"Boolean indicating whether the patient currently has a heart valve disorder (cardiac valvular disease)."} ;; "cardiac valvular disease"
(declare-const patient_has_finding_of_heart_valve_disorder_now@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current heart valve disorder (cardiac valvular disease) is clinically significant.","when_to_set_to_false":"Set to false if the patient's current heart valve disorder (cardiac valvular disease) is not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current heart valve disorder (cardiac valvular disease) is clinically significant.","meaning":"Boolean indicating whether the patient's current heart valve disorder (cardiac valvular disease) is clinically significant."} ;; "clinically significant cardiac valvular disease"

;; ===================== Auxiliary Assertions (REQ 19) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_hematologic_condition_now@@clinically_significant
      patient_has_finding_of_hematologic_condition_now)
   :named REQ19_AUXILIARY0)) ;; "clinically significant hematologic conditions"

(assert
(! (=> patient_has_finding_of_heart_valve_disorder_now@@clinically_significant
      patient_has_finding_of_heart_valve_disorder_now)
   :named REQ19_AUXILIARY1)) ;; "clinically significant cardiac valvular disease"

;; ===================== Constraint Assertions (REQ 19) =====================
(assert
(! (not patient_has_finding_of_hematologic_condition_now@@clinically_significant)
   :named REQ19_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has clinically significant hematologic conditions."

(assert
(! (not patient_has_finding_of_heart_valve_disorder_now@@clinically_significant)
   :named REQ19_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has clinically significant cardiac valvular disease."

;; ===================== Declarations for the exclusion criterion (REQ 20) =====================
(declare-const patient_has_finding_of_disorder_of_cardiovascular_system_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a disorder of the cardiovascular system (cardiovascular disease) at any point in their history.","when_to_set_to_false":"Set to false if the patient has never had a disorder of the cardiovascular system (cardiovascular disease) in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a disorder of the cardiovascular system (cardiovascular disease).","meaning":"Boolean indicating whether the patient has ever had a disorder of the cardiovascular system (cardiovascular disease) in their history."} ;; "cardiovascular disease"
(declare-const patient_has_finding_of_disorder_of_cardiovascular_system_inthehistory@@secondary_to_previous_infection_with_streptococcus_pyogenes Bool) ;; {"when_to_set_to_true":"Set to true if the patient's cardiovascular disease in their history is secondary to previous infection with Streptococcus pyogenes.","when_to_set_to_false":"Set to false if the patient's cardiovascular disease in their history is not secondary to previous infection with Streptococcus pyogenes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's cardiovascular disease in their history is secondary to previous infection with Streptococcus pyogenes.","meaning":"Boolean indicating whether the patient's cardiovascular disease in their history is secondary to previous infection with Streptococcus pyogenes."} ;; "cardiovascular disease secondary to previous infection with Streptococcus pyogenes"
(declare-const patient_has_finding_of_kidney_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had kidney disease (renal disease) at any point in their history.","when_to_set_to_false":"Set to false if the patient has never had kidney disease (renal disease) in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had kidney disease (renal disease).","meaning":"Boolean indicating whether the patient has ever had kidney disease (renal disease) in their history."} ;; "renal disease"
(declare-const patient_has_finding_of_kidney_disease_inthehistory@@secondary_to_previous_infection_with_streptococcus_pyogenes Bool) ;; {"when_to_set_to_true":"Set to true if the patient's renal disease in their history is secondary to previous infection with Streptococcus pyogenes.","when_to_set_to_false":"Set to false if the patient's renal disease in their history is not secondary to previous infection with Streptococcus pyogenes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's renal disease in their history is secondary to previous infection with Streptococcus pyogenes.","meaning":"Boolean indicating whether the patient's renal disease in their history is secondary to previous infection with Streptococcus pyogenes."} ;; "renal disease secondary to previous infection with Streptococcus pyogenes"
(declare-const patient_has_finding_of_disorder_of_nervous_system_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a disorder of the nervous system (neurological disease) at any point in their history.","when_to_set_to_false":"Set to false if the patient has never had a disorder of the nervous system (neurological disease) in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a disorder of the nervous system (neurological disease).","meaning":"Boolean indicating whether the patient has ever had a disorder of the nervous system (neurological disease) in their history."} ;; "neurological disease"
(declare-const patient_has_finding_of_disorder_of_nervous_system_inthehistory@@secondary_to_previous_infection_with_streptococcus_pyogenes Bool) ;; {"when_to_set_to_true":"Set to true if the patient's neurological disease in their history is secondary to previous infection with Streptococcus pyogenes.","when_to_set_to_false":"Set to false if the patient's neurological disease in their history is not secondary to previous infection with Streptococcus pyogenes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's neurological disease in their history is secondary to previous infection with Streptococcus pyogenes.","meaning":"Boolean indicating whether the patient's neurological disease in their history is secondary to previous infection with Streptococcus pyogenes."} ;; "neurological disease secondary to previous infection with Streptococcus pyogenes"

;; ===================== Auxiliary Assertions (REQ 20) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_disorder_of_cardiovascular_system_inthehistory@@secondary_to_previous_infection_with_streptococcus_pyogenes
      patient_has_finding_of_disorder_of_cardiovascular_system_inthehistory)
:named REQ20_AUXILIARY0)) ;; "cardiovascular disease secondary to previous infection with Streptococcus pyogenes"

(assert
(! (=> patient_has_finding_of_kidney_disease_inthehistory@@secondary_to_previous_infection_with_streptococcus_pyogenes
      patient_has_finding_of_kidney_disease_inthehistory)
:named REQ20_AUXILIARY1)) ;; "renal disease secondary to previous infection with Streptococcus pyogenes"

(assert
(! (=> patient_has_finding_of_disorder_of_nervous_system_inthehistory@@secondary_to_previous_infection_with_streptococcus_pyogenes
      patient_has_finding_of_disorder_of_nervous_system_inthehistory)
:named REQ20_AUXILIARY2)) ;; "neurological disease secondary to previous infection with Streptococcus pyogenes"

;; ===================== Constraint Assertions (REQ 20) =====================
(assert
(! (not patient_has_finding_of_disorder_of_cardiovascular_system_inthehistory@@secondary_to_previous_infection_with_streptococcus_pyogenes)
:named REQ20_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of cardiovascular disease secondary to previous infection with Streptococcus pyogenes."

(assert
(! (not patient_has_finding_of_kidney_disease_inthehistory@@secondary_to_previous_infection_with_streptococcus_pyogenes)
:named REQ20_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of renal disease secondary to previous infection with Streptococcus pyogenes."

(assert
(! (not patient_has_finding_of_disorder_of_nervous_system_inthehistory@@secondary_to_previous_infection_with_streptococcus_pyogenes)
:named REQ20_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of neurological disease secondary to previous infection with Streptococcus pyogenes."

;; ===================== Declarations for the exclusion criterion (REQ 21) =====================
(declare-const patient_is_exposed_to_probenecid_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to probenecid at any time in their history.","when_to_set_to_false":"Set to false if the patient has never been exposed to probenecid at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to probenecid.","meaning":"Boolean indicating whether the patient has ever been exposed to probenecid."} ;; "probenecid"
(declare-const patient_is_exposed_to_probenecid_inthehistory@@temporalcontext_during_study_duration Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to probenecid occurred during the duration of the study.","when_to_set_to_false":"Set to false if the patient's exposure to probenecid did not occur during the duration of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's exposure to probenecid occurred during the duration of the study.","meaning":"Boolean indicating whether the patient's exposure to probenecid occurred during the duration of the study."} ;; "the patient receives probenecid treatment during the duration of the study"
(declare-const patient_is_exposed_to_steroid_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to systemic steroid at any time in their history.","when_to_set_to_false":"Set to false if the patient has never been exposed to systemic steroid at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to systemic steroid.","meaning":"Boolean indicating whether the patient has ever been exposed to systemic steroid."} ;; "systemic steroid"
(declare-const patient_is_exposed_to_steroid_inthehistory@@temporalcontext_during_study_duration Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to systemic steroid occurred during the duration of the study.","when_to_set_to_false":"Set to false if the patient's exposure to systemic steroid did not occur during the duration of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's exposure to systemic steroid occurred during the duration of the study.","meaning":"Boolean indicating whether the patient's exposure to systemic steroid occurred during the duration of the study."} ;; "the patient receives systemic steroid therapy during the duration of the study"

;; ===================== Auxiliary Assertions (REQ 21) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_is_exposed_to_probenecid_inthehistory@@temporalcontext_during_study_duration
      patient_is_exposed_to_probenecid_inthehistory)
   :named REQ21_AUXILIARY0)) ;; "probenecid treatment during the duration of the study"

(assert
(! (=> patient_is_exposed_to_steroid_inthehistory@@temporalcontext_during_study_duration
      patient_is_exposed_to_steroid_inthehistory)
   :named REQ21_AUXILIARY1)) ;; "systemic steroid therapy during the duration of the study"

;; ===================== Constraint Assertions (REQ 21) =====================
(assert
(! (not patient_is_exposed_to_probenecid_inthehistory@@temporalcontext_during_study_duration)
   :named REQ21_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient receives probenecid treatment during the duration of the study"

(assert
(! (not patient_is_exposed_to_steroid_inthehistory@@temporalcontext_during_study_duration)
   :named REQ21_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient receives systemic steroid therapy during the duration of the study"
