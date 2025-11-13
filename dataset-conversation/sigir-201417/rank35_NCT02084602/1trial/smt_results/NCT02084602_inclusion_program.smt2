;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "age ≥ 5 years AND age ≤ 65 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 5)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be age ≥ 5 years."

(assert
  (! (<= patient_age_value_recorded_now_in_years 65)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be age ≤ 65 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_monoinfection_with_plasmodium_falciparum_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has monoinfection with Plasmodium falciparum.","when_to_set_to_false":"Set to false if the patient currently does not have monoinfection with Plasmodium falciparum.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has monoinfection with Plasmodium falciparum.","meaning":"Boolean indicating whether the patient currently has monoinfection with Plasmodium falciparum."} // "monoinfection with Plasmodium falciparum"
(declare-const patient_has_monoinfection_with_plasmodium_falciparum_now@@confirmed_by_microscopy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's monoinfection with Plasmodium falciparum is confirmed by microscopy.","when_to_set_to_false":"Set to false if the patient's monoinfection with Plasmodium falciparum is not confirmed by microscopy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's monoinfection with Plasmodium falciparum is confirmed by microscopy.","meaning":"Boolean indicating whether the patient's monoinfection with Plasmodium falciparum is confirmed by microscopy."} // "confirmed by microscopy"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_monoinfection_with_plasmodium_falciparum_now@@confirmed_by_microscopy
         patient_has_monoinfection_with_plasmodium_falciparum_now)
     :named REQ1_AUXILIARY0)) ;; "confirmed by microscopy" implies "monoinfection with Plasmodium falciparum"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_monoinfection_with_plasmodium_falciparum_now@@confirmed_by_microscopy
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "monoinfection with Plasmodium falciparum confirmed by microscopy"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_axillary_temperature_value_recorded_now_withunit_celsius Real) ;; {"when_to_set_to_value":"Set to the value of the patient's current axillary temperature in degrees Celsius if measured and available.","when_to_set_to_null":"Set to null if the patient's current axillary temperature is not measured, not documented, or cannot be determined.","meaning":"Numeric value of the patient's current axillary temperature in degrees Celsius."} // "documented fever (axillary temperature > 37.5 degrees Celsius)"
(declare-const patient_has_finding_of_fever_inthepast48hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a documented fever at any time during the previous 48 hours.","when_to_set_to_false":"Set to false if the patient has not had a documented fever during the previous 48 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a documented fever during the previous 48 hours.","meaning":"Boolean indicating whether the patient has had fever during the previous 48 hours."} // "history of fever during the previous 48 hours"
(declare-const patient_has_finding_of_fever_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented fever.","when_to_set_to_false":"Set to false if the patient currently does not have a documented fever.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a documented fever.","meaning":"Boolean indicating whether the patient currently has fever."} // "documented fever"
(declare-const patient_has_finding_of_fever_now@@not_due_to_other_obvious_causes_such_as_pneumonia_or_otitis_media Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current fever is not due to other obvious causes such as pneumonia or otitis media.","when_to_set_to_false":"Set to false if the patient's current fever is due to other obvious causes such as pneumonia or otitis media.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current fever is due to other obvious causes.","meaning":"Boolean indicating whether the patient's current fever is not due to other obvious causes such as pneumonia or otitis media."} // "NOT have other obvious causes of fever such as pneumonia or otitis media"
(declare-const patient_has_finding_of_otitis_media_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has otitis media.","when_to_set_to_false":"Set to false if the patient currently does not have otitis media.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has otitis media.","meaning":"Boolean indicating whether the patient currently has otitis media."} // "otitis media"
(declare-const patient_has_finding_of_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pneumonia.","meaning":"Boolean indicating whether the patient currently has pneumonia."} // "pneumonia"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Definition: Documented fever (axillary temperature > 37.5°C) implies current fever
(assert
  (! (= patient_has_finding_of_fever_now
        (> patient_axillary_temperature_value_recorded_now_withunit_celsius 37.5))
     :named REQ2_AUXILIARY0)) ;; "documented fever (axillary temperature > 37.5 degrees Celsius)"

;; Non-exhaustive examples: pneumonia or otitis media are examples of other obvious causes of fever
(assert
  (! (=> (or patient_has_finding_of_pneumonia_now
            patient_has_finding_of_otitis_media_now)
         (not patient_has_finding_of_fever_now@@not_due_to_other_obvious_causes_such_as_pneumonia_or_otitis_media))
     :named REQ2_AUXILIARY1)) ;; "other obvious causes of fever such as pneumonia or otitis media"

;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_finding_of_fever_now@@not_due_to_other_obvious_causes_such_as_pneumonia_or_otitis_media
         patient_has_finding_of_fever_now)
     :named REQ2_AUXILIARY2)) ;; "fever not due to other obvious causes"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: Must have documented fever (axillary temp > 37.5°C) OR history of fever in past 48h
(assert
  (! (or patient_has_finding_of_fever_now
         patient_has_finding_of_fever_inthepast48hours)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "documented fever (axillary temperature > 37.5 degrees Celsius) OR history of fever during the previous 48 hours"

;; Component 1: Must NOT have other obvious causes of fever (such as pneumonia or otitis media)
(assert
  (! patient_has_finding_of_fever_now@@not_due_to_other_obvious_causes_such_as_pneumonia_or_otitis_media
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "NOT have other obvious causes of fever with non-exhaustive examples (pneumonia OR otitis media)"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const asexual_parasite_count_value_recorded_now_withunit_per_microliter Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's asexual parasite count per microliter as measured at the current time.","when_to_set_to_null":"Set to null if the asexual parasite count per microliter is unknown, not documented, or cannot be determined at the current time.","meaning":"Numeric value of the patient's asexual parasite count per microliter as recorded at the current time."} // "asexual parasite count ≥ 1,000 per microliter AND asexual parasite count ≤ 100,000 per microliter"
(declare-const patient_has_monoinfection_with_plasmodium_falciparum_now@@confirmed_by_microscopy@@asexual_parasite_count_in_range_1000_to_100000_per_microliter Bool) ;; {"when_to_set_to_true":"Set to true if the patient's asexual parasite count is greater than or equal to 1,000 per microliter and less than or equal to 100,000 per microliter at the time of microscopic confirmation of Plasmodium falciparum monoinfection.","when_to_set_to_false":"Set to false if the patient's asexual parasite count is outside the range 1,000 to 100,000 per microliter at the time of microscopic confirmation of Plasmodium falciparum monoinfection.","when_to_set_to_null":"Set to null if the asexual parasite count is unknown, not documented, or cannot be determined at the time of microscopic confirmation of Plasmodium falciparum monoinfection.","meaning":"Boolean indicating whether the patient's asexual parasite count is within the required range at the time of microscopic confirmation of Plasmodium falciparum monoinfection."} // "asexual parasite count ≥ 1,000 per microliter AND asexual parasite count ≤ 100,000 per microliter, as determined by microscopy"
(declare-const patient_has_sexual_form_of_plasmodium_vivax_now Bool) ;; {"when_to_set_to_true":"Set to true if the sexual form of Plasmodium vivax is present in the patient at the current time.","when_to_set_to_false":"Set to false if the sexual form of Plasmodium vivax is not present in the patient at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the sexual form of Plasmodium vivax is present in the patient at the current time.","meaning":"Boolean indicating whether the sexual form of Plasmodium vivax is present in the patient at the current time."} // "presence of sexual form of Plasmodium vivax is acceptable"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Definitional: asexual parasite count in range 1,000 to 100,000 per microliter
(assert
  (! (= patient_has_monoinfection_with_plasmodium_falciparum_now@@confirmed_by_microscopy@@asexual_parasite_count_in_range_1000_to_100000_per_microliter
        (and patient_has_monoinfection_with_plasmodium_falciparum_now@@confirmed_by_microscopy
             (>= asexual_parasite_count_value_recorded_now_withunit_per_microliter 1000.0)
             (<= asexual_parasite_count_value_recorded_now_withunit_per_microliter 100000.0)))
     :named REQ3_AUXILIARY0)) ;; "asexual parasite count ≥ 1,000 per microliter AND asexual parasite count ≤ 100,000 per microliter, as determined by microscopy"

;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_monoinfection_with_plasmodium_falciparum_now@@confirmed_by_microscopy@@asexual_parasite_count_in_range_1000_to_100000_per_microliter
         patient_has_monoinfection_with_plasmodium_falciparum_now)
     :named REQ3_AUXILIARY1)) ;; "infection with Plasmodium falciparum"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Inclusion: patient must have either (Plasmodium falciparum monoinfection confirmed by microscopy with asexual parasite count in range) OR (sexual form of Plasmodium vivax present)
(assert
  (! (or patient_has_monoinfection_with_plasmodium_falciparum_now@@confirmed_by_microscopy@@asexual_parasite_count_in_range_1000_to_100000_per_microliter
         patient_has_sexual_form_of_plasmodium_vivax_now)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (infection with Plasmodium falciparum with (asexual parasite count ≥ 1,000 per microliter AND asexual parasite count ≤ 100,000 per microliter), as determined by (microscopic examination of a thick blood smear OR microscopic examination of a thin blood smear); presence of sexual form of Plasmodium vivax is acceptable"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const informed_consent_obtained_from_participant_now Bool) ;; {"when_to_set_to_true":"Set to true if informed consent has been obtained from the participant at the current time.","when_to_set_to_false":"Set to false if informed consent has not been obtained from the participant at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether informed consent has been obtained from the participant at the current time.","meaning":"Boolean indicating whether informed consent has been obtained from the participant at the current time."} // "informed consent obtained from the participant"
(declare-const informed_consent_obtained_from_both_parents_now Bool) ;; {"when_to_set_to_true":"Set to true if informed consent has been obtained from both parents at the current time.","when_to_set_to_false":"Set to false if informed consent has not been obtained from both parents at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether informed consent has been obtained from both parents at the current time.","meaning":"Boolean indicating whether informed consent has been obtained from both parents at the current time."} // "informed consent obtained from both parents"
(declare-const informed_consent_obtained_from_guardian_now Bool) ;; {"when_to_set_to_true":"Set to true if informed consent has been obtained from a guardian at the current time.","when_to_set_to_false":"Set to false if informed consent has not been obtained from a guardian at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether informed consent has been obtained from a guardian at the current time.","meaning":"Boolean indicating whether informed consent has been obtained from a guardian at the current time."} // "informed consent obtained from guardian"
(declare-const assent_obtained_from_child_now Bool) ;; {"when_to_set_to_true":"Set to true if assent has been obtained from the child at the current time.","when_to_set_to_false":"Set to false if assent has not been obtained from the child at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether assent has been obtained from the child at the current time.","meaning":"Boolean indicating whether assent has been obtained from the child at the current time."} // "assent from the child (from 8 to 17 years old)"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: ((informed consent obtained from the participant) OR (informed consent obtained from both parents) OR (informed consent obtained from guardian))
(assert
  (! (or informed_consent_obtained_from_participant_now
         informed_consent_obtained_from_both_parents_now
         informed_consent_obtained_from_guardian_now)
     :named REQ4_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have ((informed consent obtained from the participant) OR (informed consent obtained from both parents) OR (informed consent obtained from guardian))."

;; Component 1: If age ≥ 8 years AND age ≤ 17 years, assent from the child.
(assert
  (! (or (not (and (>= patient_age_value_recorded_now_in_years 8)
                   (<= patient_age_value_recorded_now_in_years 17)))
         assent_obtained_from_child_now)
     :named REQ4_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "if age ≥ 8 years AND age ≤ 17 years, assent from the child."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_can_undergo_encounter_for_check_up_inthefuture42days Bool) ;; {"when_to_set_to_true":"Set to true if the patient is willing and able to return to the health facility for check-up encounters within the next 42 days.","when_to_set_to_false":"Set to false if the patient is not willing or unable to return for check-up encounters within the next 42 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can undergo check-up encounters within the next 42 days.","meaning":"Boolean indicating whether the patient can undergo an encounter for check-up within the next 42 days."} // "willing to return to the health facility for regular check-ups during the follow-up period of 42 days"
(declare-const patient_can_undergo_encounter_for_check_up_inthefuture42days@@regularly_during_follow_up_period Bool) ;; {"when_to_set_to_true":"Set to true if the patient can undergo check-up encounters within the next 42 days and these encounters are scheduled to occur regularly during the follow-up period.","when_to_set_to_false":"Set to false if the patient can undergo check-up encounters within the next 42 days but these encounters are not regular during the follow-up period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the check-up encounters are regular during the follow-up period.","meaning":"Boolean indicating whether the patient can undergo regular check-up encounters during the 42-day follow-up period."} // "regular check-ups during the follow-up period of 42 days"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_can_undergo_encounter_for_check_up_inthefuture42days@@regularly_during_follow_up_period
         patient_can_undergo_encounter_for_check_up_inthefuture42days)
     :named REQ5_AUXILIARY0)) ;; "regular check-ups during the follow-up period of 42 days" implies "check-up within the next 42 days"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! patient_can_undergo_encounter_for_check_up_inthefuture42days@@regularly_during_follow_up_period
     :named REQ5_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "willing to return to the health facility for regular check-ups during the follow-up period of 42 days"

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_will_undergo_therapeutic_procedure_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is scheduled or expected to undergo a therapeutic procedure (treatment) in the future.","when_to_set_to_false":"Set to false if the patient is not scheduled or expected to undergo a therapeutic procedure (treatment) in the future.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient will undergo a therapeutic procedure (treatment) in the future.","meaning":"Boolean indicating whether the patient will undergo a therapeutic procedure (treatment) in the future."} // "to start treatment"
(declare-const patient_will_undergo_therapeutic_procedure_inthefuture@@at_hospital_de_apoyo_iquitos Bool) ;; {"when_to_set_to_true":"Set to true if the patient will undergo a therapeutic procedure (treatment) in the future at Hospital de Apoyo Iquitos.","when_to_set_to_false":"Set to false if the patient will not undergo a therapeutic procedure (treatment) in the future at Hospital de Apoyo Iquitos.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient will undergo a therapeutic procedure (treatment) in the future at Hospital de Apoyo Iquitos.","meaning":"Boolean indicating whether the patient will undergo a therapeutic procedure (treatment) in the future at Hospital de Apoyo Iquitos."} // "to Hospital de Apoyo Iquitos to start treatment"
(declare-const patient_will_undergo_therapeutic_procedure_inthefuture@@willing_to_transfer Bool) ;; {"when_to_set_to_true":"Set to true if the patient is willing to transfer in order to undergo a therapeutic procedure (treatment) in the future.","when_to_set_to_false":"Set to false if the patient is not willing to transfer in order to undergo a therapeutic procedure (treatment) in the future.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to transfer in order to undergo a therapeutic procedure (treatment) in the future.","meaning":"Boolean indicating whether the patient is willing to transfer in order to undergo a therapeutic procedure (treatment) in the future."} // "must be willing to transfer to Hospital de Apoyo Iquitos to start treatment"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_will_undergo_therapeutic_procedure_inthefuture@@at_hospital_de_apoyo_iquitos
         patient_will_undergo_therapeutic_procedure_inthefuture)
     :named REQ6_AUXILIARY0)) ;; "to start treatment at Hospital de Apoyo Iquitos"

(assert
  (! (=> patient_will_undergo_therapeutic_procedure_inthefuture@@willing_to_transfer
         patient_will_undergo_therapeutic_procedure_inthefuture)
     :named REQ6_AUXILIARY1)) ;; "willing to transfer to Hospital de Apoyo Iquitos to start treatment"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! (and patient_will_undergo_therapeutic_procedure_inthefuture@@at_hospital_de_apoyo_iquitos
          patient_will_undergo_therapeutic_procedure_inthefuture@@willing_to_transfer)
     :named REQ6_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "must be willing to transfer to Hospital de Apoyo Iquitos to start treatment"
