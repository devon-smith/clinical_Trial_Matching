;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_swallowing_painful_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of painful swallowing (odynophagia).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of painful swallowing (odynophagia).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has painful swallowing (odynophagia).","meaning":"Boolean indicating whether the patient currently has painful swallowing (odynophagia)."}

(declare-const patient_has_finding_of_swallowing_painful_now@@chronic Bool) ;; {"when_to_set_to_true":"Set to true if the patient's painful swallowing (odynophagia) is chronic.","when_to_set_to_false":"Set to false if the patient's painful swallowing (odynophagia) is not chronic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's painful swallowing (odynophagia) is chronic.","meaning":"Boolean indicating whether the patient's painful swallowing (odynophagia) is chronic."}

(declare-const patient_has_finding_of_swallowing_painful_now@@recurrent Bool) ;; {"when_to_set_to_true":"Set to true if the patient's painful swallowing (odynophagia) is recurrent.","when_to_set_to_false":"Set to false if the patient's painful swallowing (odynophagia) is not recurrent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's painful swallowing (odynophagia) is recurrent.","meaning":"Boolean indicating whether the patient's painful swallowing (odynophagia) is recurrent."}

(declare-const patient_has_finding_of_large_tonsils_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of enlarged tonsils.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of enlarged tonsils.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has enlarged tonsils.","meaning":"Boolean indicating whether the patient currently has enlarged tonsils."}

(declare-const patient_has_finding_of_large_tonsils_now@@etiology_obscure Bool) ;; {"when_to_set_to_true":"Set to true if the patient's enlarged tonsils are of obscure etiology.","when_to_set_to_false":"Set to false if the patient's enlarged tonsils are not of obscure etiology.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the etiology of the patient's enlarged tonsils is obscure.","meaning":"Boolean indicating whether the patient's enlarged tonsils are of obscure etiology."}

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
(! (=> patient_has_finding_of_large_tonsils_now@@etiology_obscure
       patient_has_finding_of_large_tonsils_now)
   :named REQ0_AUXILIARY2)) ;; "enlarged tonsils of obscure etiology"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_swallowing_painful_now@@chronic)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has chronic odynophagia."

(assert
(! (not patient_has_finding_of_swallowing_painful_now@@recurrent)
   :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has recurrent odynophagia."

(assert
(! (not patient_has_finding_of_large_tonsils_now@@etiology_obscure)
   :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has enlarged tonsils of obscure etiology."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_acute_tonsillitis_value_recorded_inthepast6months_withunit_count Real) ;; {"when_to_set_to_value":"Set to the number of acute tonsillitis episodes the patient had in the six months prior to the baseline visit.","when_to_set_to_null":"Set to null if the number of episodes in the six months prior to the baseline visit is unknown, not documented, or cannot be determined.","meaning":"Numeric count of acute tonsillitis episodes in the six months prior to the baseline visit."} ;; "acute tonsillitis in the six months prior to the baseline visit"

(declare-const patient_acute_tonsillitis_value_recorded_inthepast6months_withunit_count@@temporalcontext_within6months_before_baseline_visit Bool) ;; {"when_to_set_to_true":"Set to true if the six-month window is anchored to the baseline visit.","when_to_set_to_false":"Set to false if the six-month window is not anchored to the baseline visit.","when_to_set_to_null":"Set to null if it is unknown whether the six-month window is anchored to the baseline visit.","meaning":"Boolean indicating whether the six-month window is anchored to the baseline visit."} ;; "six months prior to the baseline visit (acute tonsillitis)"

(declare-const patient_pharyngitis_value_recorded_inthepast6months_withunit_count Real) ;; {"when_to_set_to_value":"Set to the number of pharyngitis episodes the patient had in the six months prior to the baseline visit.","when_to_set_to_null":"Set to null if the number of episodes in the six months prior to the baseline visit is unknown, not documented, or cannot be determined.","meaning":"Numeric count of pharyngitis episodes in the six months prior to the baseline visit."} ;; "pharyngitis in the six months prior to the baseline visit"

(declare-const patient_pharyngitis_value_recorded_inthepast6months_withunit_count@@temporalcontext_within6months_before_baseline_visit Bool) ;; {"when_to_set_to_true":"Set to true if the six-month window is anchored to the baseline visit.","when_to_set_to_false":"Set to false if the six-month window is not anchored to the baseline visit.","when_to_set_to_null":"Set to null if it is unknown whether the six-month window is anchored to the baseline visit.","meaning":"Boolean indicating whether the six-month window is anchored to the baseline visit."} ;; "six months prior to the baseline visit (pharyngitis)"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion if more than one episode of acute tonsillitis in the six months prior to the baseline visit
(assert
(! (not (and
           patient_acute_tonsillitis_value_recorded_inthepast6months_withunit_count@@temporalcontext_within6months_before_baseline_visit
           (> patient_acute_tonsillitis_value_recorded_inthepast6months_withunit_count 1)))
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had more than one episode of acute tonsillitis in the six months prior to the baseline visit."

;; Exclusion if more than one episode of pharyngitis in the six months prior to the baseline visit
(assert
(! (not (and
           patient_pharyngitis_value_recorded_inthepast6months_withunit_count@@temporalcontext_within6months_before_baseline_visit
           (> patient_pharyngitis_value_recorded_inthepast6months_withunit_count 1)))
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had more than one episode of pharyngitis in the six months prior to the baseline visit."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_pharyngitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of pharyngitis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of pharyngitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of pharyngitis.","meaning":"Boolean indicating whether the patient currently has pharyngitis."} ;; "pharyngitis"
(declare-const patient_has_finding_of_pharyngitis_now@@known_due_to_pathogen_resistant_to_beta_lactam_antimicrobials Bool) ;; {"when_to_set_to_true":"Set to true if the patient's pharyngitis is known to be due to a pathogen resistant to beta-lactam antimicrobials.","when_to_set_to_false":"Set to false if the patient's pharyngitis is known not to be due to a pathogen resistant to beta-lactam antimicrobials.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's pharyngitis is known to be due to a pathogen resistant to beta-lactam antimicrobials.","meaning":"Boolean indicating whether the patient's pharyngitis is known to be due to a pathogen resistant to beta-lactam antimicrobials."} ;; "pharyngitis known to be due to a pathogen resistant to beta-lactam antimicrobials"
(declare-const patient_has_finding_of_pharyngitis_now@@suspected_due_to_pathogen_resistant_to_beta_lactam_antimicrobials Bool) ;; {"when_to_set_to_true":"Set to true if the patient's pharyngitis is suspected to be due to a pathogen resistant to beta-lactam antimicrobials.","when_to_set_to_false":"Set to false if the patient's pharyngitis is suspected not to be due to a pathogen resistant to beta-lactam antimicrobials.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's pharyngitis is suspected to be due to a pathogen resistant to beta-lactam antimicrobials.","meaning":"Boolean indicating whether the patient's pharyngitis is suspected to be due to a pathogen resistant to beta-lactam antimicrobials."} ;; "pharyngitis suspected to be due to a pathogen resistant to beta-lactam antimicrobials"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_pharyngitis_now@@known_due_to_pathogen_resistant_to_beta_lactam_antimicrobials
       patient_has_finding_of_pharyngitis_now)
   :named REQ2_AUXILIARY0)) ;; "pharyngitis known to be due to a pathogen resistant to beta-lactam antimicrobials" implies "pharyngitis"

(assert
(! (=> patient_has_finding_of_pharyngitis_now@@suspected_due_to_pathogen_resistant_to_beta_lactam_antimicrobials
       patient_has_finding_of_pharyngitis_now)
   :named REQ2_AUXILIARY1)) ;; "pharyngitis suspected to be due to a pathogen resistant to beta-lactam antimicrobials" implies "pharyngitis"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_pharyngitis_now@@known_due_to_pathogen_resistant_to_beta_lactam_antimicrobials)
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has pharyngitis known to be due to a pathogen resistant to beta-lactam antimicrobials."

(assert
(! (not patient_has_finding_of_pharyngitis_now@@suspected_due_to_pathogen_resistant_to_beta_lactam_antimicrobials)
   :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has pharyngitis suspected to be due to a pathogen resistant to beta-lactam antimicrobials."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_known_carrier_of_streptococcus_pyogenes_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a known carrier of Streptococcus pyogenes.","when_to_set_to_false":"Set to false if the patient is currently not a known carrier of Streptococcus pyogenes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a known carrier of Streptococcus pyogenes.","meaning":"Boolean indicating whether the patient is currently a known carrier of Streptococcus pyogenes."} ;; "is a known carrier of Streptococcus pyogenes."
(declare-const patient_is_known_carrier_of_streptococcus_pyogenes_now@@known_carrier_status Bool) ;; {"when_to_set_to_true":"Set to true if the patient's carrier status of Streptococcus pyogenes is known (confirmed or documented).","when_to_set_to_false":"Set to false if the patient's carrier status of Streptococcus pyogenes is not known (not confirmed or not documented).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's carrier status of Streptococcus pyogenes is known.","meaning":"Boolean indicating whether the patient's carrier status of Streptococcus pyogenes is known (confirmed or documented)."} ;; "is a known carrier of Streptococcus pyogenes."

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_known_carrier_of_streptococcus_pyogenes_now@@known_carrier_status
      patient_is_known_carrier_of_streptococcus_pyogenes_now)
   :named REQ3_AUXILIARY0)) ;; "known carrier status" implies "carrier of Streptococcus pyogenes"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_is_known_carrier_of_streptococcus_pyogenes_now)
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a known carrier of Streptococcus pyogenes."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_allergy_to_penicillin_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of allergy to penicillin at any time in the past.","when_to_set_to_false":"Set to false if the patient has no documented history of allergy to penicillin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had an allergy to penicillin.","meaning":"Boolean indicating whether the patient has ever had an allergy to penicillin in their medical history."} ;; "previous allergies to penicillin"

(declare-const patient_has_allergy_to_beta_lactam_antibacterial_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of allergy to any member of the beta-lactam class of antimicrobials (excluding penicillin) at any time in the past.","when_to_set_to_false":"Set to false if the patient has no documented history of allergy to any member of the beta-lactam class of antimicrobials (excluding penicillin).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had an allergy to any member of the beta-lactam class of antimicrobials (excluding penicillin).","meaning":"Boolean indicating whether the patient has ever had an allergy to any member of the beta-lactam class of antimicrobials (excluding penicillin) in their medical history."} ;; "previous allergies to any other member of the beta-lactam class of antimicrobials"

(declare-const patient_has_allergy_to_beta_lactam_antibacterial_inthehistory@@any_other_member Bool) ;; {"when_to_set_to_true":"Set to true if the allergy is to a beta-lactam antimicrobial other than penicillin.","when_to_set_to_false":"Set to false if the allergy is to penicillin or if the allergy is not to any other member of the beta-lactam class.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the allergy is to any other member of the beta-lactam class of antimicrobials (excluding penicillin).","meaning":"Boolean indicating that the allergy is to any member of the beta-lactam class of antimicrobials except penicillin."} ;; "previous allergies to any other member of the beta-lactam class of antimicrobials"

(declare-const patient_has_finding_of_allergy_to_cephalosporin_antibacterial_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of allergy to cephalosporins at any time in the past.","when_to_set_to_false":"Set to false if the patient has no documented history of allergy to cephalosporins.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had an allergy to cephalosporins.","meaning":"Boolean indicating whether the patient has ever had an allergy to cephalosporins in their medical history."} ;; "previous allergies to cephalosporins"

(declare-const patient_has_finding_of_serious_adverse_reaction_to_penicillin_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of serious adverse reaction to penicillin at any time in the past.","when_to_set_to_false":"Set to false if the patient has no documented history of serious adverse reaction to penicillin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a serious adverse reaction to penicillin.","meaning":"Boolean indicating whether the patient has ever had a serious adverse reaction to penicillin in their medical history."} ;; "serious adverse reaction to penicillin"

(declare-const patient_has_finding_of_serious_adverse_reaction_to_beta_lactam_antibacterial_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of serious adverse reaction to any member of the beta-lactam class of antimicrobials (excluding penicillin) at any time in the past.","when_to_set_to_false":"Set to false if the patient has no documented history of serious adverse reaction to any member of the beta-lactam class of antimicrobials (excluding penicillin).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a serious adverse reaction to any member of the beta-lactam class of antimicrobials (excluding penicillin).","meaning":"Boolean indicating whether the patient has ever had a serious adverse reaction to any member of the beta-lactam class of antimicrobials (excluding penicillin) in their medical history."} ;; "serious adverse reaction to any other member of the beta-lactam class of antimicrobials"

(declare-const patient_has_finding_of_serious_adverse_reaction_to_beta_lactam_antibacterial_inthehistory@@any_other_member Bool) ;; {"when_to_set_to_true":"Set to true if the serious adverse reaction is to a beta-lactam antimicrobial other than penicillin.","when_to_set_to_false":"Set to false if the serious adverse reaction is to penicillin or if the serious adverse reaction is not to any other member of the beta-lactam class.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the serious adverse reaction is to any other member of the beta-lactam class of antimicrobials (excluding penicillin).","meaning":"Boolean indicating that the serious adverse reaction is to any member of the beta-lactam class of antimicrobials except penicillin."} ;; "serious adverse reaction to any other member of the beta-lactam class of antimicrobials"

(declare-const patient_has_finding_of_serious_adverse_reaction_to_cephalosporin_antibacterial_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of serious adverse reaction to cephalosporins at any time in the past.","when_to_set_to_false":"Set to false if the patient has no documented history of serious adverse reaction to cephalosporins.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a serious adverse reaction to cephalosporins.","meaning":"Boolean indicating whether the patient has ever had a serious adverse reaction to cephalosporins in their medical history."} ;; "serious adverse reaction to cephalosporins"

(declare-const patient_has_intolerance_to_penicillin_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of intolerance to penicillin at any time in the past.","when_to_set_to_false":"Set to false if the patient has no documented history of intolerance to penicillin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had intolerance to penicillin.","meaning":"Boolean indicating whether the patient has ever had intolerance to penicillin in their medical history."} ;; "intolerance to penicillin"

(declare-const patient_has_intolerance_to_beta_lactam_antibacterial_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of intolerance to any member of the beta-lactam class of antimicrobials (excluding penicillin) at any time in the past.","when_to_set_to_false":"Set to false if the patient has no documented history of intolerance to any member of the beta-lactam class of antimicrobials (excluding penicillin).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had intolerance to any member of the beta-lactam class of antimicrobials (excluding penicillin).","meaning":"Boolean indicating whether the patient has ever had intolerance to any member of the beta-lactam class of antimicrobials (excluding penicillin) in their medical history."} ;; "intolerance to any other member of the beta-lactam class of antimicrobials"

(declare-const patient_has_intolerance_to_beta_lactam_antibacterial_inthehistory@@any_other_member Bool) ;; {"when_to_set_to_true":"Set to true if the intolerance is to a beta-lactam antimicrobial other than penicillin.","when_to_set_to_false":"Set to false if the intolerance is to penicillin or if the intolerance is not to any other member of the beta-lactam class.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the intolerance is to any other member of the beta-lactam class of antimicrobials (excluding penicillin).","meaning":"Boolean indicating that the intolerance is to any member of the beta-lactam class of antimicrobials except penicillin."} ;; "intolerance to any other member of the beta-lactam class of antimicrobials"

(declare-const patient_has_intolerance_to_cephalosporin_antibacterial_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of intolerance to cephalosporins at any time in the past.","when_to_set_to_false":"Set to false if the patient has no documented history of intolerance to cephalosporins.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had intolerance to cephalosporins.","meaning":"Boolean indicating whether the patient has ever had intolerance to cephalosporins in their medical history."} ;; "intolerance to cephalosporins"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_allergy_to_beta_lactam_antibacterial_inthehistory@@any_other_member
      patient_has_allergy_to_beta_lactam_antibacterial_inthehistory)
:named REQ4_AUXILIARY0)) ;; "previous allergies to any other member of the beta-lactam class of antimicrobials"

(assert
(! (=> patient_has_finding_of_serious_adverse_reaction_to_beta_lactam_antibacterial_inthehistory@@any_other_member
      patient_has_finding_of_serious_adverse_reaction_to_beta_lactam_antibacterial_inthehistory)
:named REQ4_AUXILIARY1)) ;; "serious adverse reaction to any other member of the beta-lactam class of antimicrobials"

(assert
(! (=> patient_has_intolerance_to_beta_lactam_antibacterial_inthehistory@@any_other_member
      patient_has_intolerance_to_beta_lactam_antibacterial_inthehistory)
:named REQ4_AUXILIARY2)) ;; "intolerance to any other member of the beta-lactam class of antimicrobials"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_allergy_to_penicillin_inthehistory)
    :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has previous allergies to penicillin."

(assert
(! (not patient_has_allergy_to_beta_lactam_antibacterial_inthehistory@@any_other_member)
    :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has previous allergies to any other member of the beta-lactam class of antimicrobials."

(assert
(! (not patient_has_finding_of_allergy_to_cephalosporin_antibacterial_inthehistory)
    :named REQ4_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has previous allergies to cephalosporins."

(assert
(! (not patient_has_finding_of_serious_adverse_reaction_to_penicillin_inthehistory)
    :named REQ4_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a serious adverse reaction to penicillin."

(assert
(! (not patient_has_finding_of_serious_adverse_reaction_to_beta_lactam_antibacterial_inthehistory@@any_other_member)
    :named REQ4_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a serious adverse reaction to any other member of the beta-lactam class of antimicrobials."

(assert
(! (not patient_has_finding_of_serious_adverse_reaction_to_cephalosporin_antibacterial_inthehistory)
    :named REQ4_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a serious adverse reaction to cephalosporins."

(assert
(! (not patient_has_intolerance_to_penicillin_inthehistory)
    :named REQ4_COMPONENT6_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has intolerance to penicillin."

(assert
(! (not patient_has_intolerance_to_beta_lactam_antibacterial_inthehistory@@any_other_member)
    :named REQ4_COMPONENT7_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has intolerance to any other member of the beta-lactam class of antimicrobials."

(assert
(! (not patient_has_intolerance_to_cephalosporin_antibacterial_inthehistory)
    :named REQ4_COMPONENT8_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has intolerance to cephalosporins."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_serious_physical_health_problem_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any serious physical health problem (serious illness).","when_to_set_to_false":"Set to false if the patient currently does not have any serious physical health problem (serious illness).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any serious physical health problem (serious illness).","meaning":"Boolean indicating whether the patient currently has any serious physical health problem (serious illness)."} ;; "The patient is excluded if the patient has any serious illness."

(declare-const patient_has_finding_of_co_morbid_conditions_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any co-morbid (concomitant) condition.","when_to_set_to_false":"Set to false if the patient currently does not have any co-morbid (concomitant) condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any co-morbid (concomitant) condition.","meaning":"Boolean indicating whether the patient currently has any co-morbid (concomitant) condition."} ;; "concomitant condition"

(declare-const patient_has_finding_of_co_morbid_conditions_now@@precludes_study_evaluations_by_investigator_judgment Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any co-morbid (concomitant) condition and the Investigator judges that this condition would preclude the study evaluations.","when_to_set_to_false":"Set to false if the patient currently has any co-morbid (concomitant) condition and the Investigator does not judge that it would preclude the study evaluations.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the Investigator judges the co-morbid condition would preclude study evaluations.","meaning":"Boolean indicating whether the patient currently has any co-morbid (concomitant) condition and the Investigator judges that this condition would preclude the study evaluations."} ;; "The patient is excluded if the patient has any concomitant condition that the Investigator judges would preclude the study evaluations."

(declare-const patient_has_finding_of_co_morbid_conditions_now@@makes_study_therapy_and_followup_unlikely_by_investigator_judgment Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any co-morbid (concomitant) condition and the Investigator judges that this condition would make it unlikely that the course of study therapy and follow-up could be completed.","when_to_set_to_false":"Set to false if the patient currently has any co-morbid (concomitant) condition and the Investigator does not judge that it would make completion unlikely.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the Investigator judges the co-morbid condition would make completion unlikely.","meaning":"Boolean indicating whether the patient currently has any co-morbid (concomitant) condition and the Investigator judges that this condition would make it unlikely that the course of study therapy and follow-up could be completed."} ;; "The patient is excluded if the patient has any concomitant condition that the Investigator judges would make it unlikely that the course of study therapy and follow-up could be completed."

(declare-const patient_has_finding_of_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disease.","when_to_set_to_false":"Set to false if the patient currently does not have any disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any disease.","meaning":"Boolean indicating whether the patient currently has any disease."} ;; "disease"

(declare-const patient_has_finding_of_disease_now@@is_rapidly_progressive Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disease and the disease is rapidly progressive.","when_to_set_to_false":"Set to false if the patient currently has any disease and the disease is not rapidly progressive.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disease is rapidly progressive.","meaning":"Boolean indicating whether the patient currently has any disease and the disease is rapidly progressive."} ;; "any rapidly progressive underlying disease"

(declare-const patient_has_finding_of_disease_now@@is_underlying_with_shortened_life_expectancy Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disease and the disease is underlying with a shortened life expectancy.","when_to_set_to_false":"Set to false if the patient currently has any disease and the disease is not underlying with a shortened life expectancy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disease is underlying with a shortened life expectancy.","meaning":"Boolean indicating whether the patient currently has any disease and the disease is underlying with a shortened life expectancy."} ;; "any rapidly progressive underlying disease with a shortened life expectancy"

(declare-const patient_has_finding_of_unable_to_swallow_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has inability to swallow.","when_to_set_to_false":"Set to false if the patient currently does not have inability to swallow.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has inability to swallow.","meaning":"Boolean indicating whether the patient currently has inability to swallow."} ;; "inability to swallow"

(declare-const patient_has_finding_of_unable_to_swallow_now@@specific_to_study_dosage_form Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has inability to swallow and the inability is specific to the study dosage form.","when_to_set_to_false":"Set to false if the patient currently has inability to swallow and the inability is not specific to the study dosage form.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the inability to swallow is specific to the study dosage form.","meaning":"Boolean indicating whether the patient currently has inability to swallow and the inability is specific to the study dosage form."} ;; "inability to swallow the study dosage form"

(declare-const patient_has_finding_of_unable_to_understand_study_requirements_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has inability to understand the requirements of the study.","when_to_set_to_false":"Set to false if the patient currently does not have inability to understand the requirements of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has inability to understand the requirements of the study.","meaning":"Boolean indicating whether the patient currently has inability to understand the requirements of the study."} ;; "inability to understand the requirements of the study"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_co_morbid_conditions_now@@precludes_study_evaluations_by_investigator_judgment
      patient_has_finding_of_co_morbid_conditions_now)
   :named REQ5_AUXILIARY0)) ;; "concomitant condition that the Investigator judges would preclude the study evaluations"

(assert
(! (=> patient_has_finding_of_co_morbid_conditions_now@@makes_study_therapy_and_followup_unlikely_by_investigator_judgment
      patient_has_finding_of_co_morbid_conditions_now)
   :named REQ5_AUXILIARY1)) ;; "concomitant condition that the Investigator judges would make it unlikely that the course of study therapy and follow-up could be completed"

(assert
(! (=> (and patient_has_finding_of_disease_now@@is_rapidly_progressive
            patient_has_finding_of_disease_now@@is_underlying_with_shortened_life_expectancy)
      patient_has_finding_of_disease_now)
   :named REQ5_AUXILIARY2)) ;; "any rapidly progressive underlying disease with a shortened life expectancy"

(assert
(! (=> patient_has_finding_of_unable_to_swallow_now@@specific_to_study_dosage_form
      patient_has_finding_of_unable_to_swallow_now)
   :named REQ5_AUXILIARY3)) ;; "inability to swallow the study dosage form"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_serious_physical_health_problem_now)
   :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any serious illness."

(assert
(! (not patient_has_finding_of_co_morbid_conditions_now@@precludes_study_evaluations_by_investigator_judgment)
   :named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any concomitant condition that the Investigator judges would preclude the study evaluations."

(assert
(! (not patient_has_finding_of_co_morbid_conditions_now@@makes_study_therapy_and_followup_unlikely_by_investigator_judgment)
   :named REQ5_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any concomitant condition that the Investigator judges would make it unlikely that the course of study therapy and follow-up could be completed."

(assert
(! (not (and patient_has_finding_of_disease_now@@is_rapidly_progressive
             patient_has_finding_of_disease_now@@is_underlying_with_shortened_life_expectancy))
   :named REQ5_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any rapidly progressive underlying disease with a shortened life expectancy."

(assert
(! (not patient_has_finding_of_unable_to_swallow_now@@specific_to_study_dosage_form)
   :named REQ5_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has inability to swallow the study dosage form."

(assert
(! (not patient_has_finding_of_unable_to_understand_study_requirements_now)
   :named REQ5_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has inability to understand the requirements of the study."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_neutropenia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of neutropenia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of neutropenia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of neutropenia.","meaning":"Boolean indicating whether the patient currently has neutropenia."} ;; "the patient has neutropenia"
(declare-const polymorphonuclear_neutrophil_count_value_recorded_now_withunit_per_cubic_millimeter Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's current polymorphonuclear neutrophil count per cubic millimeter if available.","when_to_set_to_null":"Set to null if the current polymorphonuclear neutrophil count per cubic millimeter is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current polymorphonuclear neutrophil count per cubic millimeter."} ;; "less than one thousand polymorphonuclear neutrophils per cubic millimeter"
(declare-const patient_has_finding_of_patient_immunocompromised_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of an immunocompromised state.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of an immunocompromised state.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of an immunocompromised state.","meaning":"Boolean indicating whether the patient currently has an immunocompromised state."} ;; "the patient has another immunocompromised state"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Definition: neutropenia = polymorphonuclear neutrophil count < 1000 per cubic millimeter
(assert
(! (= patient_has_finding_of_neutropenia_now
     (< polymorphonuclear_neutrophil_count_value_recorded_now_withunit_per_cubic_millimeter 1000))
   :named REQ6_AUXILIARY0)) ;; "neutropenia (less than one thousand polymorphonuclear neutrophils per cubic millimeter)"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Exclusion: patient must NOT have neutropenia or another immunocompromised state
(assert
(! (not (or patient_has_finding_of_neutropenia_now
            patient_has_finding_of_patient_immunocompromised_now))
   :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has neutropenia (less than one thousand polymorphonuclear neutrophils per cubic millimeter)) OR (the patient has another immunocompromised state))."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_upper_respiratory_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of upper respiratory tract infection.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of upper respiratory tract infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of upper respiratory tract infection.","meaning":"Boolean indicating whether the patient currently has upper respiratory tract infection."} ;; "upper respiratory tract infection"
(declare-const patient_has_finding_of_upper_respiratory_infection_now@@is_concurrent_condition Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current upper respiratory tract infection is a concurrent condition.","when_to_set_to_false":"Set to false if the patient's current upper respiratory tract infection is not a concurrent condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current upper respiratory tract infection is a concurrent condition.","meaning":"Boolean indicating whether the patient's current upper respiratory tract infection is a concurrent condition."} ;; "concurrent condition of upper respiratory tract infection"
(declare-const patient_has_finding_of_lower_respiratory_tract_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of lower respiratory tract infection.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of lower respiratory tract infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of lower respiratory tract infection.","meaning":"Boolean indicating whether the patient currently has lower respiratory tract infection."} ;; "lower respiratory tract infection"
(declare-const patient_has_finding_of_lower_respiratory_tract_infection_now@@is_concurrent_condition Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current lower respiratory tract infection is a concurrent condition.","when_to_set_to_false":"Set to false if the patient's current lower respiratory tract infection is not a concurrent condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current lower respiratory tract infection is a concurrent condition.","meaning":"Boolean indicating whether the patient's current lower respiratory tract infection is a concurrent condition."} ;; "concurrent condition of lower respiratory tract infection"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_upper_respiratory_infection_now@@is_concurrent_condition
      patient_has_finding_of_upper_respiratory_infection_now)
   :named REQ7_AUXILIARY0)) ;; "concurrent condition of upper respiratory tract infection"

(assert
(! (=> patient_has_finding_of_lower_respiratory_tract_infection_now@@is_concurrent_condition
      patient_has_finding_of_lower_respiratory_tract_infection_now)
   :named REQ7_AUXILIARY1)) ;; "concurrent condition of lower respiratory tract infection"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_finding_of_upper_respiratory_infection_now@@is_concurrent_condition)
   :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a concurrent condition of upper respiratory tract infection."

(assert
(! (not patient_has_finding_of_lower_respiratory_tract_infection_now@@is_concurrent_condition)
   :named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a concurrent condition of lower respiratory tract infection."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_generalized_enlarged_lymph_nodes_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of generalized enlarged lymph nodes.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of generalized enlarged lymph nodes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of generalized enlarged lymph nodes.","meaning":"Boolean indicating whether the patient currently has generalized enlarged lymph nodes (diffuse adenopathy)."} ;; "diffuse adenopathy"
(declare-const patient_has_finding_of_generalized_enlarged_lymph_nodes_now@@suggestive_of_mononucleosis Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current generalized enlarged lymph nodes are suggestive of mononucleosis.","when_to_set_to_false":"Set to false if the patient's current generalized enlarged lymph nodes are not suggestive of mononucleosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the generalized enlarged lymph nodes are suggestive of mononucleosis.","meaning":"Boolean indicating whether the patient's current generalized enlarged lymph nodes are suggestive of mononucleosis."} ;; "diffuse adenopathy suggestive of mononucleosis"
(declare-const patient_has_finding_of_eruption_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of rash (eruption).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of rash (eruption).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of rash (eruption).","meaning":"Boolean indicating whether the patient currently has rash (eruption)."} ;; "rash"
(declare-const patient_has_finding_of_eruption_now@@suggestive_of_mononucleosis Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current rash (eruption) is suggestive of mononucleosis.","when_to_set_to_false":"Set to false if the patient's current rash (eruption) is not suggestive of mononucleosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the rash (eruption) is suggestive of mononucleosis.","meaning":"Boolean indicating whether the patient's current rash (eruption) is suggestive of mononucleosis."} ;; "rash suggestive of mononucleosis"
(declare-const patient_has_finding_of_eruption_now@@suggestive_of_scarlet_fever Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current rash (eruption) is suggestive of scarlet fever.","when_to_set_to_false":"Set to false if the patient's current rash (eruption) is not suggestive of scarlet fever.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the rash (eruption) is suggestive of scarlet fever.","meaning":"Boolean indicating whether the patient's current rash (eruption) is suggestive of scarlet fever."} ;; "rash suggestive of scarlet fever"
(declare-const patient_has_finding_of_arthropathy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of arthropathy.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of arthropathy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of arthropathy.","meaning":"Boolean indicating whether the patient currently has arthropathy."} ;; "arthropathy"
(declare-const patient_has_finding_of_arthropathy_now@@suggestive_of_scarlet_fever Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current arthropathy is suggestive of scarlet fever.","when_to_set_to_false":"Set to false if the patient's current arthropathy is not suggestive of scarlet fever.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the arthropathy is suggestive of scarlet fever.","meaning":"Boolean indicating whether the patient's current arthropathy is suggestive of scarlet fever."} ;; "arthropathy suggestive of scarlet fever"
(declare-const patient_has_symptoms_of_conjunctivitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms of conjunctivitis.","when_to_set_to_false":"Set to false if the patient currently does not have symptoms of conjunctivitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptoms of conjunctivitis.","meaning":"Boolean indicating whether the patient currently has symptoms of conjunctivitis."} ;; "conjunctivitis"
(declare-const patient_has_symptoms_of_conjunctivitis_now@@of_viral_etiology Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms of conjunctivitis and the etiology is viral.","when_to_set_to_false":"Set to false if the patient currently has symptoms of conjunctivitis but the etiology is not viral.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the etiology of conjunctivitis is viral.","meaning":"Boolean indicating whether the patient's current conjunctivitis symptoms are of viral etiology."} ;; "conjunctivitis of viral etiology"
(declare-const patient_has_symptoms_of_coryza_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms of coryza.","when_to_set_to_false":"Set to false if the patient currently does not have symptoms of coryza.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptoms of coryza.","meaning":"Boolean indicating whether the patient currently has symptoms of coryza."} ;; "coryza"
(declare-const patient_has_symptoms_of_cough_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms of cough.","when_to_set_to_false":"Set to false if the patient currently does not have symptoms of cough.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptoms of cough.","meaning":"Boolean indicating whether the patient currently has symptoms of cough."} ;; "cough"
(declare-const patient_has_symptoms_of_cough_now@@of_viral_etiology Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms of cough and the etiology is viral.","when_to_set_to_false":"Set to false if the patient currently has symptoms of cough but the etiology is not viral.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the etiology of cough is viral.","meaning":"Boolean indicating whether the patient's current cough symptoms are of viral etiology."} ;; "cough of viral etiology"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Non-exhaustive examples imply umbrella term for viral etiology symptoms
(assert
(! (=> (or patient_has_symptoms_of_conjunctivitis_now
          patient_has_symptoms_of_coryza_now
          patient_has_symptoms_of_cough_now)
     (or patient_has_symptoms_of_conjunctivitis_now@@of_viral_etiology
         patient_has_symptoms_of_coryza_now
         patient_has_symptoms_of_cough_now@@of_viral_etiology))
:named REQ8_AUXILIARY0)) ;; "concurrent symptoms of viral etiology with non-exhaustive examples (conjunctivitis, coryza, cough)"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_symptoms_of_conjunctivitis_now@@of_viral_etiology
       patient_has_symptoms_of_conjunctivitis_now)
:named REQ8_AUXILIARY1)) ;; "conjunctivitis of viral etiology"

(assert
(! (=> patient_has_symptoms_of_cough_now@@of_viral_etiology
       patient_has_symptoms_of_cough_now)
:named REQ8_AUXILIARY2)) ;; "cough of viral etiology"

(assert
(! (=> patient_has_finding_of_generalized_enlarged_lymph_nodes_now@@suggestive_of_mononucleosis
       patient_has_finding_of_generalized_enlarged_lymph_nodes_now)
:named REQ8_AUXILIARY3)) ;; "diffuse adenopathy suggestive of mononucleosis"

(assert
(! (=> patient_has_finding_of_eruption_now@@suggestive_of_mononucleosis
       patient_has_finding_of_eruption_now)
:named REQ8_AUXILIARY4)) ;; "rash suggestive of mononucleosis"

(assert
(! (=> patient_has_finding_of_eruption_now@@suggestive_of_scarlet_fever
       patient_has_finding_of_eruption_now)
:named REQ8_AUXILIARY5)) ;; "rash suggestive of scarlet fever"

(assert
(! (=> patient_has_finding_of_arthropathy_now@@suggestive_of_scarlet_fever
       patient_has_finding_of_arthropathy_now)
:named REQ8_AUXILIARY6)) ;; "arthropathy suggestive of scarlet fever"

;; ===================== Constraint Assertions (REQ 8) =====================
;; Exclusion: patient must NOT have concurrent symptoms of viral etiology
(assert
(! (not (or patient_has_symptoms_of_conjunctivitis_now@@of_viral_etiology
            patient_has_symptoms_of_coryza_now
            patient_has_symptoms_of_cough_now@@of_viral_etiology))
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "concurrent symptoms of viral etiology with non-exhaustive examples (conjunctivitis, coryza, cough)"

;; Exclusion: patient must NOT have diffuse adenopathy suggestive of mononucleosis
(assert
(! (not patient_has_finding_of_generalized_enlarged_lymph_nodes_now@@suggestive_of_mononucleosis)
:named REQ8_COMPONENT1_OTHER_REQUIREMENTS)) ;; "diffuse adenopathy suggestive of mononucleosis"

;; Exclusion: patient must NOT have rash suggestive of mononucleosis
(assert
(! (not patient_has_finding_of_eruption_now@@suggestive_of_mononucleosis)
:named REQ8_COMPONENT2_OTHER_REQUIREMENTS)) ;; "rash suggestive of mononucleosis"

;; Exclusion: patient must NOT have rash suggestive of scarlet fever
(assert
(! (not patient_has_finding_of_eruption_now@@suggestive_of_scarlet_fever)
:named REQ8_COMPONENT3_OTHER_REQUIREMENTS)) ;; "rash suggestive of scarlet fever"

;; Exclusion: patient must NOT have arthropathy suggestive of scarlet fever
(assert
(! (not patient_has_finding_of_arthropathy_now@@suggestive_of_scarlet_fever)
:named REQ8_COMPONENT4_OTHER_REQUIREMENTS)) ;; "arthropathy suggestive of scarlet fever"

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_finding_of_seizure_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a seizure disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a seizure disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a seizure disorder.","meaning":"Boolean indicating whether the patient currently has a seizure disorder."} ;; "the patient has a seizure disorder"
(declare-const patient_has_finding_of_lowered_convulsive_threshold_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a lowered seizure threshold.","when_to_set_to_false":"Set to false if the patient currently does not have a lowered seizure threshold.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a lowered seizure threshold.","meaning":"Boolean indicating whether the patient currently has a lowered seizure threshold."} ;; "the patient has a lowered seizure threshold"
(declare-const patient_has_finding_of_psychiatric_condition_requiring_use_of_major_tranquilizers_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a psychiatric condition that requires the use of major tranquilizers.","when_to_set_to_false":"Set to false if the patient currently does not have a psychiatric condition that requires the use of major tranquilizers.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a psychiatric condition that requires the use of major tranquilizers.","meaning":"Boolean indicating whether the patient currently has a psychiatric condition that requires the use of major tranquilizers."} ;; "the patient has a psychiatric condition requiring use of major tranquilizers"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
  (! (not patient_has_finding_of_seizure_disorder_now)
     :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a seizure disorder."

(assert
  (! (not patient_has_finding_of_lowered_convulsive_threshold_now)
     :named REQ9_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a lowered seizure threshold."

(assert
  (! (not patient_has_finding_of_psychiatric_condition_requiring_use_of_major_tranquilizers_now)
     :named REQ9_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a psychiatric condition requiring use of major tranquilizers."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breastfeeding (nursing).","when_to_set_to_false":"Set to false if the patient is currently not breastfeeding (nursing).","when_to_set_to_null":"Set to null if the patient's current breastfeeding (nursing) status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently breastfeeding (nursing)."} ;; "the patient is nursing"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_is_pregnant_now)
:named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

(assert
(! (not patient_is_breastfeeding_now)
:named REQ10_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is nursing."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_will_undergo_antibiotic_therapy_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is expected to require and will undergo antibiotic therapy at any time in the future (specifically, during the study duration).","when_to_set_to_false":"Set to false if the patient is not expected to require and will not undergo antibiotic therapy at any time in the future (specifically, during the study duration).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is expected to require antibiotic therapy in the future (specifically, during the study duration).","meaning":"Boolean indicating whether the patient is expected to require and will undergo antibiotic therapy at any time in the future."} ;; "antibacterial therapy"
(declare-const patient_will_undergo_antibiotic_therapy_inthefuture@@systemic Bool) ;; {"when_to_set_to_true":"Set to true if the expected antibiotic therapy is systemic.","when_to_set_to_false":"Set to false if the expected antibiotic therapy is not systemic.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the expected antibiotic therapy is systemic.","meaning":"Boolean indicating whether the expected antibiotic therapy is systemic."} ;; "systemic antibacterial therapy"
(declare-const patient_will_undergo_antibiotic_therapy_inthefuture@@effective Bool) ;; {"when_to_set_to_true":"Set to true if the expected antibiotic therapy is effective.","when_to_set_to_false":"Set to false if the expected antibiotic therapy is not effective.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the expected antibiotic therapy is effective.","meaning":"Boolean indicating whether the expected antibiotic therapy is effective."} ;; "effective systemic antibacterial therapy"
(declare-const patient_will_undergo_antibiotic_therapy_inthefuture@@additional Bool) ;; {"when_to_set_to_true":"Set to true if the expected antibiotic therapy is additional.","when_to_set_to_false":"Set to false if the expected antibiotic therapy is not additional.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the expected antibiotic therapy is additional.","meaning":"Boolean indicating whether the expected antibiotic therapy is additional."} ;; "additional effective systemic antibacterial therapy"
(declare-const patient_will_undergo_antibiotic_therapy_inthefuture@@temporalcontext_during_study_duration Bool) ;; {"when_to_set_to_true":"Set to true if the expected antibiotic therapy will occur during the duration of the study.","when_to_set_to_false":"Set to false if the expected antibiotic therapy will not occur during the duration of the study.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the expected antibiotic therapy will occur during the duration of the study.","meaning":"Boolean indicating whether the expected antibiotic therapy will occur during the duration of the study."} ;; "during the duration of the study"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_will_undergo_antibiotic_therapy_inthefuture@@systemic
      patient_will_undergo_antibiotic_therapy_inthefuture)
   :named REQ11_AUXILIARY0)) ;; "systemic antibacterial therapy"

(assert
(! (=> patient_will_undergo_antibiotic_therapy_inthefuture@@effective
      patient_will_undergo_antibiotic_therapy_inthefuture)
   :named REQ11_AUXILIARY1)) ;; "effective systemic antibacterial therapy"

(assert
(! (=> patient_will_undergo_antibiotic_therapy_inthefuture@@additional
      patient_will_undergo_antibiotic_therapy_inthefuture)
   :named REQ11_AUXILIARY2)) ;; "additional effective systemic antibacterial therapy"

(assert
(! (=> patient_will_undergo_antibiotic_therapy_inthefuture@@temporalcontext_during_study_duration
      patient_will_undergo_antibiotic_therapy_inthefuture)
   :named REQ11_AUXILIARY3)) ;; "during the duration of the study"

;; ===================== Constraint Assertions (REQ 11) =====================
;; Exclusion: patient is expected to require additional effective systemic antibacterial therapy for any condition during the duration of the study
(assert
(! (not (and patient_will_undergo_antibiotic_therapy_inthefuture@@additional
             patient_will_undergo_antibiotic_therapy_inthefuture@@effective
             patient_will_undergo_antibiotic_therapy_inthefuture@@systemic
             patient_will_undergo_antibiotic_therapy_inthefuture@@temporalcontext_during_study_duration))
   :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is expected to require additional effective systemic antibacterial therapy for any condition during the duration of the study."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_finding_of_drug_abuse_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of drug abuse.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of drug abuse.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of drug abuse.","meaning":"Boolean indicating whether the patient currently has drug abuse."} ;; "the patient has current drug abuse"
(declare-const patient_has_finding_of_alcohol_abuse_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of alcohol abuse.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of alcohol abuse.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of alcohol abuse.","meaning":"Boolean indicating whether the patient currently has alcohol abuse."} ;; "the patient has current alcohol abuse"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not patient_has_finding_of_drug_abuse_now)
:named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has current drug abuse."

(assert
(! (not patient_has_finding_of_alcohol_abuse_now)
:named REQ12_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has current alcohol abuse."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_is_exposed_to_drug_or_medicament_inthepast30days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to any drug or medicament within the past thirty days.","when_to_set_to_false":"Set to false if the patient has not been exposed to any drug or medicament within the past thirty days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to any drug or medicament within the past thirty days.","meaning":"Boolean indicating whether the patient has been exposed to any drug or medicament within the past thirty days."} ;; "the patient has received any experimental drug within the previous thirty days"
(declare-const patient_is_exposed_to_drug_or_medicament_inthepast30days@@experimental Bool) ;; {"when_to_set_to_true":"Set to true if the exposure within the past thirty days was to an experimental drug or medicament.","when_to_set_to_false":"Set to false if the exposure within the past thirty days was not to an experimental drug or medicament.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament exposure within the past thirty days was experimental.","meaning":"Boolean indicating whether the drug or medicament exposure within the past thirty days was experimental."} ;; "the patient has received any experimental drug within the previous thirty days"
(declare-const patient_has_received_experimental_medical_device_in_the_past_30_days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received any experimental medical device within the previous thirty days.","when_to_set_to_false":"Set to false if the patient has not received any experimental medical device within the previous thirty days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received any experimental medical device within the previous thirty days.","meaning":"Boolean indicating whether the patient has received any experimental medical device within the previous thirty days."} ;; "the patient has received any experimental medical device within the previous thirty days"

;; ===================== Auxiliary Assertions (REQ 13) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_exposed_to_drug_or_medicament_inthepast30days@@experimental
       patient_is_exposed_to_drug_or_medicament_inthepast30days)
    :named REQ13_AUXILIARY0)) ;; "the patient has received any experimental drug within the previous thirty days"

;; ===================== Constraint Assertions (REQ 13) =====================
;; Exclusion: patient must NOT have received any experimental drug or device within the previous thirty days
(assert
(! (not (or patient_is_exposed_to_drug_or_medicament_inthepast30days@@experimental
            patient_has_received_experimental_medical_device_in_the_past_30_days))
    :named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has received any experimental drug within the previous thirty days) OR (the patient has received any experimental medical device within the previous thirty days)."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_has_received_treatment_under_this_protocol_previously Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received any treatment under this protocol at any time in the past.","when_to_set_to_false":"Set to false if the patient has never received any treatment under this protocol in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received any treatment under this protocol previously.","meaning":"Boolean indicating whether the patient has received any previous treatment under this protocol."} ;; "The patient is excluded if the patient has had previous treatment under this protocol."

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
(! (not patient_has_received_treatment_under_this_protocol_previously)
:named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had previous treatment under this protocol."

;; ===================== Declarations for the exclusion criterion (REQ 15) =====================
(declare-const patient_needs_hospitalization_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently needs hospitalization.","when_to_set_to_false":"Set to false if the patient currently does not need hospitalization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently needs hospitalization.","meaning":"Boolean indicating whether the patient currently needs hospitalization."} ;; "the patient needs hospitalization"
(declare-const patient_needs_hospitalization_now@@need_for_hospitalization Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently needs hospitalization (not just being hospitalized).","when_to_set_to_false":"Set to false if the patient currently does not need hospitalization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently needs hospitalization.","meaning":"Boolean indicating whether the patient currently needs hospitalization, as opposed to simply being hospitalized."} ;; "need for hospitalization"
(declare-const patient_needs_intravenous_antimicrobial_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently needs intravenous antimicrobial therapy.","when_to_set_to_false":"Set to false if the patient currently does not need intravenous antimicrobial therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently needs intravenous antimicrobial therapy.","meaning":"Boolean indicating whether the patient currently needs intravenous antimicrobial therapy."} ;; "the patient needs intravenous antimicrobial therapy"
(declare-const patient_needs_intravenous_antimicrobial_therapy_now@@need_for_intravenous_antimicrobial_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently needs intravenous antimicrobial therapy (not just receiving it).","when_to_set_to_false":"Set to false if the patient currently does not need intravenous antimicrobial therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently needs intravenous antimicrobial therapy.","meaning":"Boolean indicating whether the patient currently needs intravenous antimicrobial therapy, as opposed to simply receiving it."} ;; "need for intravenous antimicrobial therapy"

;; ===================== Auxiliary Assertions (REQ 15) =====================
;; Qualifier variable implies corresponding stem variable for hospitalization
(assert
(! (=> patient_needs_hospitalization_now@@need_for_hospitalization
      patient_needs_hospitalization_now)
    :named REQ15_AUXILIARY0)) ;; "need for hospitalization"

;; Qualifier variable implies corresponding stem variable for intravenous antimicrobial therapy
(assert
(! (=> patient_needs_intravenous_antimicrobial_therapy_now@@need_for_intravenous_antimicrobial_therapy
      patient_needs_intravenous_antimicrobial_therapy_now)
    :named REQ15_AUXILIARY1)) ;; "need for intravenous antimicrobial therapy"

;; ===================== Constraint Assertions (REQ 15) =====================
;; Exclusion: patient must NOT need hospitalization or intravenous antimicrobial therapy
(assert
(! (not (or patient_needs_hospitalization_now
            patient_needs_intravenous_antimicrobial_therapy_now))
    :named REQ15_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient needs hospitalization) OR (the patient needs intravenous antimicrobial therapy)."

;; ===================== Declarations for the exclusion criterion (REQ 16) =====================
(declare-const patient_has_undergone_administration_of_anti_infective_agent_inthepast30days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone administration of a systemic anti-infective agent (antimicrobial therapy) within the past thirty days.","when_to_set_to_false":"Set to false if the patient has not undergone administration of a systemic anti-infective agent (antimicrobial therapy) within the past thirty days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone administration of a systemic anti-infective agent (antimicrobial therapy) within the past thirty days.","meaning":"Boolean indicating whether the patient has undergone administration of a systemic anti-infective agent (antimicrobial therapy) within the past thirty days."} ;; "previous systemic antimicrobial therapy within thirty days"

;; ===================== Constraint Assertions (REQ 16) =====================
(assert
(! (not patient_has_undergone_administration_of_anti_infective_agent_inthepast30days)
:named REQ16_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had previous systemic antimicrobial therapy within thirty days."

;; ===================== Declarations for the exclusion criterion (REQ 17) =====================
(declare-const patient_has_finding_of_hematologic_condition_now_clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a hematologic condition that is clinically significant.","when_to_set_to_false":"Set to false if the patient currently does not have a clinically significant hematologic condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinically significant hematologic condition.","meaning":"Boolean indicating whether the patient currently has a clinically significant hematologic condition."} ;; "clinically significant hematologic condition"

;; ===================== Constraint Assertions (REQ 17) =====================
(assert
  (! (not patient_has_finding_of_hematologic_condition_now_clinically_significant)
     :named REQ17_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has clinically significant hematologic condition."

;; ===================== Declarations for the exclusion criterion (REQ 18) =====================
(declare-const patient_has_diagnosis_of_disorder_of_cardiovascular_system_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with a disorder of the cardiovascular system (cardiovascular disease) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with a disorder of the cardiovascular system (cardiovascular disease) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with a disorder of the cardiovascular system (cardiovascular disease).","meaning":"Boolean indicating whether the patient has ever had a diagnosis of a disorder of the cardiovascular system (cardiovascular disease)."} ;; "cardiovascular disease"
(declare-const patient_has_diagnosis_of_disorder_of_cardiovascular_system_inthehistory@@secondary_to_previous_infection_with_streptococcus_pyogenes Bool) ;; {"when_to_set_to_true":"Set to true if the patient's cardiovascular disease is secondary to previous infection with Streptococcus pyogenes.","when_to_set_to_false":"Set to false if the patient's cardiovascular disease is not secondary to previous infection with Streptococcus pyogenes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the cardiovascular disease is secondary to previous infection with Streptococcus pyogenes.","meaning":"Boolean indicating whether the patient's cardiovascular disease is secondary to previous infection with Streptococcus pyogenes."} ;; "cardiovascular disease secondary to previous infection with Streptococcus pyogenes"
(declare-const patient_has_diagnosis_of_disorder_of_cardiovascular_system_inthehistory@@secondary_to_previous_rheumatic_fever Bool) ;; {"when_to_set_to_true":"Set to true if the patient's cardiovascular disease is secondary to previous rheumatic fever.","when_to_set_to_false":"Set to false if the patient's cardiovascular disease is not secondary to previous rheumatic fever.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the cardiovascular disease is secondary to previous rheumatic fever.","meaning":"Boolean indicating whether the patient's cardiovascular disease is secondary to previous rheumatic fever."} ;; "cardiovascular disease secondary to previous rheumatic fever"

(declare-const patient_has_diagnosis_of_kidney_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with kidney disease (renal disease) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with kidney disease (renal disease) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with kidney disease (renal disease).","meaning":"Boolean indicating whether the patient has ever had a diagnosis of kidney disease (renal disease)."} ;; "renal disease"
(declare-const patient_has_diagnosis_of_kidney_disease_inthehistory@@secondary_to_previous_infection_with_streptococcus_pyogenes Bool) ;; {"when_to_set_to_true":"Set to true if the patient's renal disease is secondary to previous infection with Streptococcus pyogenes.","when_to_set_to_false":"Set to false if the patient's renal disease is not secondary to previous infection with Streptococcus pyogenes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the renal disease is secondary to previous infection with Streptococcus pyogenes.","meaning":"Boolean indicating whether the patient's renal disease is secondary to previous infection with Streptococcus pyogenes."} ;; "renal disease secondary to previous infection with Streptococcus pyogenes"
(declare-const patient_has_diagnosis_of_kidney_disease_inthehistory@@secondary_to_previous_rheumatic_fever Bool) ;; {"when_to_set_to_true":"Set to true if the patient's renal disease is secondary to previous rheumatic fever.","when_to_set_to_false":"Set to false if the patient's renal disease is not secondary to previous rheumatic fever.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the renal disease is secondary to previous rheumatic fever.","meaning":"Boolean indicating whether the patient's renal disease is secondary to previous rheumatic fever."} ;; "renal disease secondary to previous rheumatic fever"

(declare-const patient_has_diagnosis_of_disorder_of_nervous_system_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with a disorder of the nervous system (neurological disease) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with a disorder of the nervous system (neurological disease) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with a disorder of the nervous system (neurological disease).","meaning":"Boolean indicating whether the patient has ever had a diagnosis of a disorder of the nervous system (neurological disease)."} ;; "neurological disease"
(declare-const patient_has_diagnosis_of_disorder_of_nervous_system_inthehistory@@secondary_to_previous_infection_with_streptococcus_pyogenes Bool) ;; {"when_to_set_to_true":"Set to true if the patient's neurological disease is secondary to previous infection with Streptococcus pyogenes.","when_to_set_to_false":"Set to false if the patient's neurological disease is not secondary to previous infection with Streptococcus pyogenes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the neurological disease is secondary to previous infection with Streptococcus pyogenes.","meaning":"Boolean indicating whether the patient's neurological disease is secondary to previous infection with Streptococcus pyogenes."} ;; "neurological disease secondary to previous infection with Streptococcus pyogenes"
(declare-const patient_has_diagnosis_of_disorder_of_nervous_system_inthehistory@@secondary_to_previous_rheumatic_fever Bool) ;; {"when_to_set_to_true":"Set to true if the patient's neurological disease is secondary to previous rheumatic fever.","when_to_set_to_false":"Set to false if the patient's neurological disease is not secondary to previous rheumatic fever.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the neurological disease is secondary to previous rheumatic fever.","meaning":"Boolean indicating whether the patient's neurological disease is secondary to previous rheumatic fever."} ;; "neurological disease secondary to previous rheumatic fever"

;; ===================== Auxiliary Assertions (REQ 18) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_diagnosis_of_disorder_of_cardiovascular_system_inthehistory@@secondary_to_previous_infection_with_streptococcus_pyogenes
      patient_has_diagnosis_of_disorder_of_cardiovascular_system_inthehistory)
    :named REQ18_AUXILIARY0)) ;; "cardiovascular disease secondary to previous infection with Streptococcus pyogenes"

(assert
(! (=> patient_has_diagnosis_of_disorder_of_cardiovascular_system_inthehistory@@secondary_to_previous_rheumatic_fever
      patient_has_diagnosis_of_disorder_of_cardiovascular_system_inthehistory)
    :named REQ18_AUXILIARY1)) ;; "cardiovascular disease secondary to previous rheumatic fever"

(assert
(! (=> patient_has_diagnosis_of_kidney_disease_inthehistory@@secondary_to_previous_infection_with_streptococcus_pyogenes
      patient_has_diagnosis_of_kidney_disease_inthehistory)
    :named REQ18_AUXILIARY2)) ;; "renal disease secondary to previous infection with Streptococcus pyogenes"

(assert
(! (=> patient_has_diagnosis_of_kidney_disease_inthehistory@@secondary_to_previous_rheumatic_fever
      patient_has_diagnosis_of_kidney_disease_inthehistory)
    :named REQ18_AUXILIARY3)) ;; "renal disease secondary to previous rheumatic fever"

(assert
(! (=> patient_has_diagnosis_of_disorder_of_nervous_system_inthehistory@@secondary_to_previous_infection_with_streptococcus_pyogenes
      patient_has_diagnosis_of_disorder_of_nervous_system_inthehistory)
    :named REQ18_AUXILIARY4)) ;; "neurological disease secondary to previous infection with Streptococcus pyogenes"

(assert
(! (=> patient_has_diagnosis_of_disorder_of_nervous_system_inthehistory@@secondary_to_previous_rheumatic_fever
      patient_has_diagnosis_of_disorder_of_nervous_system_inthehistory)
    :named REQ18_AUXILIARY5)) ;; "neurological disease secondary to previous rheumatic fever"

;; ===================== Constraint Assertions (REQ 18) =====================
(assert
(! (not patient_has_diagnosis_of_disorder_of_cardiovascular_system_inthehistory@@secondary_to_previous_infection_with_streptococcus_pyogenes)
    :named REQ18_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of cardiovascular disease secondary to previous infection with Streptococcus pyogenes."

(assert
(! (not patient_has_diagnosis_of_disorder_of_cardiovascular_system_inthehistory@@secondary_to_previous_rheumatic_fever)
    :named REQ18_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of cardiovascular disease secondary to previous rheumatic fever."

(assert
(! (not patient_has_diagnosis_of_kidney_disease_inthehistory@@secondary_to_previous_infection_with_streptococcus_pyogenes)
    :named REQ18_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of renal disease secondary to previous infection with Streptococcus pyogenes."

(assert
(! (not patient_has_diagnosis_of_kidney_disease_inthehistory@@secondary_to_previous_rheumatic_fever)
    :named REQ18_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of renal disease secondary to previous rheumatic fever."

(assert
(! (not patient_has_diagnosis_of_disorder_of_nervous_system_inthehistory@@secondary_to_previous_infection_with_streptococcus_pyogenes)
    :named REQ18_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of neurological disease secondary to previous infection with Streptococcus pyogenes."

(assert
(! (not patient_has_diagnosis_of_disorder_of_nervous_system_inthehistory@@secondary_to_previous_rheumatic_fever)
    :named REQ18_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of neurological disease secondary to previous rheumatic fever."

;; ===================== Declarations for the exclusion criterion (REQ 19) =====================
(declare-const patient_has_taken_probenecid_containing_product_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever received a probenecid-containing product at any time in the past.","when_to_set_to_false":"Set to false if the patient has never received a probenecid-containing product at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever received a probenecid-containing product.","meaning":"Boolean indicating whether the patient has ever received a probenecid-containing product at any time in the past."} ;; "probenecid treatment"

(declare-const patient_has_undergone_administration_of_steroid_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone administration of steroid at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone administration of steroid at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone administration of steroid.","meaning":"Boolean indicating whether the patient has ever undergone administration of steroid at any time in the past."} ;; "steroid therapy"

(declare-const patient_has_undergone_administration_of_steroid_inthehistory@@systemic Bool) ;; {"when_to_set_to_true":"Set to true if the administration of steroid was systemic.","when_to_set_to_false":"Set to false if the administration of steroid was not systemic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the administration of steroid was systemic.","meaning":"Boolean indicating whether the administration of steroid was systemic."} ;; "systemic steroid therapy"

(declare-const patient_has_undergone_administration_of_steroid_inthehistory@@temporalcontext_7_days_prior_to_baseline_and_throughout_study Bool) ;; {"when_to_set_to_true":"Set to true if the administration of steroid occurred for at least 7 days prior to the baseline visit and continued throughout the duration of the study.","when_to_set_to_false":"Set to false if the administration of steroid did not occur for at least 7 days prior to baseline and throughout the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the administration of steroid occurred for at least 7 days prior to baseline and throughout the study.","meaning":"Boolean indicating whether the administration of steroid occurred for at least 7 days prior to baseline and throughout the study."} ;; "systemic steroid therapy for 7 days prior to the baseline visit and throughout the duration of the study"

;; ===================== Auxiliary Assertions (REQ 19) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_undergone_administration_of_steroid_inthehistory@@systemic
      patient_has_undergone_administration_of_steroid_inthehistory)
:named REQ19_AUXILIARY0)) ;; "systemic steroid therapy"

(assert
(! (=> patient_has_undergone_administration_of_steroid_inthehistory@@temporalcontext_7_days_prior_to_baseline_and_throughout_study
      patient_has_undergone_administration_of_steroid_inthehistory)
:named REQ19_AUXILIARY1)) ;; "systemic steroid therapy for 7 days prior to the baseline visit and throughout the duration of the study"

;; ===================== Constraint Assertions (REQ 19) =====================
(assert
(! (not (or patient_has_taken_probenecid_containing_product_inthehistory
            (and patient_has_undergone_administration_of_steroid_inthehistory@@systemic
                 patient_has_undergone_administration_of_steroid_inthehistory@@temporalcontext_7_days_prior_to_baseline_and_throughout_study)))
:named REQ19_COMPONENT0_OTHER_REQUIREMENTS)) ;; "A patient is excluded if the patient has received probenecid treatment or has received systemic steroid therapy for 7 days prior to the baseline visit and throughout the duration of the study."
