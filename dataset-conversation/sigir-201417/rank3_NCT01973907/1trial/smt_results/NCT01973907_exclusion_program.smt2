;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_admitted_to_neonatal_intensive_care_unit_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently admitted to the neonatal intensive care unit.","when_to_set_to_false":"Set to false if the patient is currently not admitted to the neonatal intensive care unit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently admitted to the neonatal intensive care unit.","meaning":"Boolean indicating whether the patient is currently admitted to the neonatal intensive care unit."} ;; "The patient is excluded if the patient is admitted to the neonatal intensive care unit."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_is_admitted_to_neonatal_intensive_care_unit_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is admitted to the neonatal intensive care unit."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_undergoing_resuscitation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing resuscitation.","when_to_set_to_false":"Set to false if the patient is currently not undergoing resuscitation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing resuscitation.","meaning":"Boolean indicating whether the patient is currently undergoing resuscitation."} ;; "resuscitation"

(declare-const patient_is_undergoing_resuscitation_now@@performed_in_operating_room Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing resuscitation and the procedure is performed in the operating room.","when_to_set_to_false":"Set to false if the patient is currently undergoing resuscitation but the procedure is not performed in the operating room.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the resuscitation is performed in the operating room.","meaning":"Boolean indicating whether the patient is currently undergoing resuscitation performed in the operating room."} ;; "requires resuscitation in the operating room"

(declare-const patient_is_undergoing_resuscitation_now@@performed_in_post_anesthetic_care_unit Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing resuscitation and the procedure is performed in the post-anesthetic care unit.","when_to_set_to_false":"Set to false if the patient is currently undergoing resuscitation but the procedure is not performed in the post-anesthetic care unit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the resuscitation is performed in the post-anesthetic care unit.","meaning":"Boolean indicating whether the patient is currently undergoing resuscitation performed in the post-anesthetic care unit."} ;; "requires resuscitation in the post-anesthetic care unit"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_is_undergoing_resuscitation_now@@performed_in_operating_room
      patient_is_undergoing_resuscitation_now)
:named REQ1_AUXILIARY0)) ;; "requires resuscitation in the operating room"

(assert
(! (=> patient_is_undergoing_resuscitation_now@@performed_in_post_anesthetic_care_unit
      patient_is_undergoing_resuscitation_now)
:named REQ1_AUXILIARY1)) ;; "requires resuscitation in the post-anesthetic care unit"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_is_undergoing_resuscitation_now@@performed_in_operating_room)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient requires resuscitation in the operating room."

(assert
(! (not patient_is_undergoing_resuscitation_now@@performed_in_post_anesthetic_care_unit)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient requires resuscitation in the post-anesthetic care unit."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_can_undergo_resuscitation_now Bool) ;; {"when_to_set_to_true":"Set to true if full active resuscitative treatment is currently within the patient's goals of care (i.e., the patient can undergo resuscitation now).","when_to_set_to_false":"Set to false if full active resuscitative treatment is NOT currently within the patient's goals of care (i.e., the patient cannot undergo resuscitation now).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether full active resuscitative treatment is within the patient's current goals of care.","meaning":"Boolean indicating whether the patient can currently undergo resuscitation as part of their goals of care."} ;; "full active resuscitative treatment is NOT within the goals of care for the patient."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_can_undergo_resuscitation_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if full active resuscitative treatment is NOT within the goals of care for the patient."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_shock_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of shock.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of shock.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of shock.","meaning":"Boolean indicating whether the patient currently has shock."} ;; "shock"
(declare-const patient_has_finding_of_shock_now@@secondary_to_cause_other_than_sepsis Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current shock is secondary to a cause other than sepsis.","when_to_set_to_false":"Set to false if the patient's current shock is secondary to sepsis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current shock is secondary to a cause other than sepsis.","meaning":"Boolean indicating whether the patient's current shock is secondary to a cause other than sepsis."} ;; "shock secondary to a cause other than sepsis"
(declare-const patient_has_finding_of_cardiogenic_shock_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of cardiogenic shock.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of cardiogenic shock.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of cardiogenic shock.","meaning":"Boolean indicating whether the patient currently has cardiogenic shock."} ;; "cardiogenic shock"
(declare-const patient_has_finding_of_anaphylactic_shock_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of anaphylactic shock.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of anaphylactic shock.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of anaphylactic shock.","meaning":"Boolean indicating whether the patient currently has anaphylactic shock."} ;; "anaphylactic shock"
(declare-const patient_has_finding_of_hemorrhagic_shock_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hemorrhagic shock.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hemorrhagic shock.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of hemorrhagic shock.","meaning":"Boolean indicating whether the patient currently has hemorrhagic shock."} ;; "hemorrhagic shock"
(declare-const patient_has_finding_of_spinal_shock_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of spinal shock.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of spinal shock.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of spinal shock.","meaning":"Boolean indicating whether the patient currently has spinal shock."} ;; "spinal shock"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Non-exhaustive examples imply umbrella term (shock secondary to a cause other than sepsis)
(assert
(! (=> (or patient_has_finding_of_cardiogenic_shock_now
           patient_has_finding_of_anaphylactic_shock_now
           patient_has_finding_of_hemorrhagic_shock_now
           patient_has_finding_of_spinal_shock_now)
       patient_has_finding_of_shock_now@@secondary_to_cause_other_than_sepsis)
   :named REQ3_AUXILIARY0)) ;; "with non-exhaustive examples ((obvious signs of cardiogenic shock) OR (obvious signs of anaphylactic shock) OR (obvious signs of hemorrhagic shock) OR (obvious signs of spinal shock))."

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_shock_now@@secondary_to_cause_other_than_sepsis
       patient_has_finding_of_shock_now)
   :named REQ3_AUXILIARY1)) ;; "shock secondary to a cause other than sepsis" implies "shock"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_shock_now@@secondary_to_cause_other_than_sepsis)
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has shock secondary to a cause other than sepsis with non-exhaustive examples ((obvious signs of cardiogenic shock) OR (obvious signs of anaphylactic shock) OR (obvious signs of hemorrhagic shock) OR (obvious signs of spinal shock))."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_been_enrolled_in_this_trial_in_the_past Bool) ;; {"when_to_set_to_true":"Set to true if the patient has previously been enrolled in this trial at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been enrolled in this trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has previously been enrolled in this trial.","meaning":"Boolean indicating whether the patient has previously been enrolled in this trial at any time in the past."} ;; "has previously been enrolled in this trial"
(declare-const patient_has_been_enrolled_in_this_trial_in_the_past@@known_by_research_team Bool) ;; {"when_to_set_to_true":"Set to true if the patient's previous enrollment in this trial is known by the research team.","when_to_set_to_false":"Set to false if the patient's previous enrollment in this trial is not known by the research team.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the research team knows about the patient's previous enrollment in this trial.","meaning":"Boolean indicating whether the patient's previous enrollment in this trial is known by the research team."} ;; "where known by the research team"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_been_enrolled_in_this_trial_in_the_past@@known_by_research_team
      patient_has_been_enrolled_in_this_trial_in_the_past)
   :named REQ4_AUXILIARY0)) ;; "where known by the research team"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_been_enrolled_in_this_trial_in_the_past@@known_by_research_team)
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has previously been enrolled in this trial, where known by the research team."
