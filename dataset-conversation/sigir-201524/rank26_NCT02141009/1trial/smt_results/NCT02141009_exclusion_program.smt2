;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of pneumonia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of pneumonia."} ;; "diagnosis of pneumonia"
(declare-const patient_has_identified_causative_organism_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an identified causative organism.","when_to_set_to_false":"Set to false if the patient currently does not have an identified causative organism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an identified causative organism.","meaning":"Boolean indicating whether the patient currently has an identified causative organism."} ;; "does NOT have an identified causative organism"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not (and patient_has_diagnosis_of_pneumonia_now
               (not patient_has_identified_causative_organism_now)))
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a diagnosis of pneumonia AND the patient does NOT have an identified causative organism."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_fever_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of fever.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of fever.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of fever.","meaning":"Boolean indicating whether the patient currently has fever."} ;; "fever"
(declare-const patient_has_finding_of_fever_now@@temporalcontext_at_time_of_vaccination Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has fever and the fever occurs at the time of vaccination.","when_to_set_to_false":"Set to false if the patient currently does not have fever at the time of vaccination.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has fever at the time of vaccination.","meaning":"Boolean indicating whether the patient currently has fever at the time of vaccination."} ;; "fever at the time of vaccination"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_fever_now@@temporalcontext_at_time_of_vaccination
      patient_has_finding_of_fever_now)
:named REQ1_AUXILIARY0)) ;; "fever at the time of vaccination" implies "fever"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_fever_now@@temporalcontext_at_time_of_vaccination)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a fever at the time of vaccination."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_allergic_reaction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had an allergic reaction at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had an allergic reaction at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had an allergic reaction.","meaning":"Boolean indicating whether the patient has ever had an allergic reaction in the past."} ;; "previous allergic reaction"
(declare-const patient_has_finding_of_allergic_reaction_inthehistory@@to_any_component_of_vaccine_given Bool) ;; {"when_to_set_to_true":"Set to true if the patient's allergic reaction in the past was to any component of the vaccine given.","when_to_set_to_false":"Set to false if the patient's allergic reaction in the past was not to any component of the vaccine given.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the allergic reaction in the past was to any component of the vaccine given.","meaning":"Boolean indicating whether the patient's allergic reaction in the past was to any component of the vaccine given."} ;; "previous allergic reaction to any component of the vaccine given"
(declare-const patient_has_finding_of_allergic_reaction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a known allergic reaction.","when_to_set_to_false":"Set to false if the patient currently does not have a known allergic reaction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a known allergic reaction.","meaning":"Boolean indicating whether the patient currently has a known allergic reaction."} ;; "known allergic reaction"
(declare-const patient_has_finding_of_allergic_reaction_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current allergic reaction is known.","when_to_set_to_false":"Set to false if the patient's current allergic reaction is not known.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current allergic reaction is known.","meaning":"Boolean indicating whether the patient's current allergic reaction is known."} ;; "known allergic reaction"
(declare-const patient_has_finding_of_allergic_reaction_now@@to_any_component_of_vaccine_given Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current known allergic reaction is to any component of the vaccine given.","when_to_set_to_false":"Set to false if the patient's current known allergic reaction is not to any component of the vaccine given.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current known allergic reaction is to any component of the vaccine given.","meaning":"Boolean indicating whether the patient's current known allergic reaction is to any component of the vaccine given."} ;; "known allergic reaction to any component of the vaccine given"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable (history)
(assert
(! (=> patient_has_finding_of_allergic_reaction_inthehistory@@to_any_component_of_vaccine_given
      patient_has_finding_of_allergic_reaction_inthehistory)
:named REQ2_AUXILIARY0)) ;; "previous allergic reaction to any component of the vaccine given"

;; Qualifier variable implies corresponding stem variable (now)
(assert
(! (=> patient_has_finding_of_allergic_reaction_now@@to_any_component_of_vaccine_given
      patient_has_finding_of_allergic_reaction_now)
:named REQ2_AUXILIARY1)) ;; "known allergic reaction to any component of the vaccine given"

;; Qualifier variable (now@@known) implies corresponding stem variable (now)
(assert
(! (=> patient_has_finding_of_allergic_reaction_now@@known
      patient_has_finding_of_allergic_reaction_now)
:named REQ2_AUXILIARY2)) ;; "known allergic reaction"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Exclusion: previous allergic reaction to any component of the vaccine given
(assert
(! (not patient_has_finding_of_allergic_reaction_inthehistory@@to_any_component_of_vaccine_given)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "previous allergic reaction to any component of the vaccine given"

;; Exclusion: known allergic reaction to any component of the vaccine given
(assert
(! (not patient_has_finding_of_allergic_reaction_now@@to_any_component_of_vaccine_given)
:named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "known allergic reaction to any component of the vaccine given"

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_mentally_incompetent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently mentally incompetent.","when_to_set_to_false":"Set to false if the patient is currently not mentally incompetent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently mentally incompetent.","meaning":"Boolean indicating whether the patient is currently mentally incompetent."} ;; "The patient is excluded if the patient is mentally incompetent."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (not patient_is_mentally_incompetent_now)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is mentally incompetent."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_undergone_active_immunization_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone pneumococcal conjugate vaccination at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone pneumococcal conjugate vaccination at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone pneumococcal conjugate vaccination.","meaning":"Boolean indicating whether the patient has ever undergone pneumococcal conjugate vaccination at any time in the past."} ;; "has had a previous pneumococcal conjugate vaccination"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_undergone_active_immunization_inthehistory)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a previous pneumococcal conjugate vaccination."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_undergone_active_immunization_inthehistory@@temporalcontext_within6months_before_inclusion Bool) ;; {"when_to_set_to_true":"Set to true if the patient's active immunization (vaccination) occurred within six months prior to the inclusion event.","when_to_set_to_false":"Set to false if the patient's active immunization (vaccination) did not occur within six months prior to the inclusion event.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's active immunization (vaccination) occurred within six months prior to the inclusion event.","meaning":"Boolean indicating whether the patient's active immunization (vaccination) occurred within six months prior to the inclusion event."} ;; "has had a pneumococcal polysaccharide vaccination within six months prior to inclusion"
(declare-const patient_has_undergone_pneumococcal_polysaccharide_vaccination_within_6_months_before_inclusion Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone pneumococcal polysaccharide vaccination within six months prior to the inclusion event.","when_to_set_to_false":"Set to false if the patient has not undergone pneumococcal polysaccharide vaccination within six months prior to the inclusion event.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone pneumococcal polysaccharide vaccination within six months prior to the inclusion event.","meaning":"Boolean indicating whether the patient has undergone pneumococcal polysaccharide vaccination within six months prior to the inclusion event."} ;; "has had a pneumococcal polysaccharide vaccination within six months prior to inclusion"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; The specific vaccination within timeframe implies the general immunization within timeframe
(assert
(! (=> patient_has_undergone_pneumococcal_polysaccharide_vaccination_within_6_months_before_inclusion
      patient_has_undergone_active_immunization_inthehistory@@temporalcontext_within6months_before_inclusion)
   :named REQ5_AUXILIARY0)) ;; "has had a pneumococcal polysaccharide vaccination within six months prior to inclusion"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_undergone_pneumococcal_polysaccharide_vaccination_within_6_months_before_inclusion)
   :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a pneumococcal polysaccharide vaccination within six months prior to inclusion."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_pneumonia_inthepast1months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a clinical finding of pneumonia within the past 1 month prior to inclusion.","when_to_set_to_false":"Set to false if the patient has not had a clinical finding of pneumonia within the past 1 month prior to inclusion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a clinical finding of pneumonia within the past 1 month prior to inclusion.","meaning":"Boolean indicating whether the patient has had pneumonia within the past 1 month prior to inclusion."} ;; "clinical pneumonia within one month prior to inclusion"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_pneumonia_inthepast1months)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had clinical pneumonia within one month prior to inclusion."
