;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_influenza_due_to_influenza_a_virus_subtype_h1n1_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of influenza A (H1N1) virus infection.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of influenza A (H1N1) virus infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of influenza A (H1N1) virus infection.","meaning":"Boolean indicating whether the patient currently has influenza A (H1N1) virus infection."} // "confirmed influenza A (H1N1) virus infection by real time reverse transcription polymerase chain reaction"
(declare-const patient_has_finding_of_influenza_due_to_influenza_a_virus_subtype_h1n1_now@@confirmed_by_real_time_reverse_transcription_polymerase_chain_reaction Bool) ;; {"when_to_set_to_true":"Set to true if the patient's influenza A (H1N1) virus infection is confirmed by real time reverse transcription polymerase chain reaction (RT-PCR).","when_to_set_to_false":"Set to false if the patient's influenza A (H1N1) virus infection is not confirmed by real time reverse transcription polymerase chain reaction (RT-PCR).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's influenza A (H1N1) virus infection is confirmed by real time reverse transcription polymerase chain reaction (RT-PCR).","meaning":"Boolean indicating whether the patient's influenza A (H1N1) virus infection is confirmed by real time reverse transcription polymerase chain reaction (RT-PCR)."} // "confirmed influenza A (H1N1) virus infection by real time reverse transcription polymerase chain reaction"

(declare-const patient_has_finding_of_influenza_caused_by_influenza_a_virus_subtype_h3n2_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of influenza A (H3N2) virus infection.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of influenza A (H3N2) virus infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of influenza A (H3N2) virus infection.","meaning":"Boolean indicating whether the patient currently has influenza A (H3N2) virus infection."} // "confirmed influenza A (H3N2) virus infection by real time reverse transcription polymerase chain reaction"
(declare-const patient_has_finding_of_influenza_caused_by_influenza_a_virus_subtype_h3n2_now@@confirmed_by_real_time_reverse_transcription_polymerase_chain_reaction Bool) ;; {"when_to_set_to_true":"Set to true if the patient's influenza A (H3N2) virus infection is confirmed by real time reverse transcription polymerase chain reaction (RT-PCR).","when_to_set_to_false":"Set to false if the patient's influenza A (H3N2) virus infection is not confirmed by real time reverse transcription polymerase chain reaction (RT-PCR).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's influenza A (H3N2) virus infection is confirmed by real time reverse transcription polymerase chain reaction (RT-PCR).","meaning":"Boolean indicating whether the patient's influenza A (H3N2) virus infection is confirmed by real time reverse transcription polymerase chain reaction (RT-PCR)."} // "confirmed influenza A (H3N2) virus infection by real time reverse transcription polymerase chain reaction"

(declare-const patient_has_finding_of_influenza_due_to_influenza_b_virus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of influenza B virus infection.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of influenza B virus infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of influenza B virus infection.","meaning":"Boolean indicating whether the patient currently has influenza B virus infection."} // "confirmed influenza B virus infection by real time reverse transcription polymerase chain reaction"
(declare-const patient_has_finding_of_influenza_due_to_influenza_b_virus_now@@confirmed_by_real_time_reverse_transcription_polymerase_chain_reaction Bool) ;; {"when_to_set_to_true":"Set to true if the patient's influenza B virus infection is confirmed by real time reverse transcription polymerase chain reaction (RT-PCR).","when_to_set_to_false":"Set to false if the patient's influenza B virus infection is not confirmed by real time reverse transcription polymerase chain reaction (RT-PCR).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's influenza B virus infection is confirmed by real time reverse transcription polymerase chain reaction (RT-PCR).","meaning":"Boolean indicating whether the patient's influenza B virus infection is confirmed by real time reverse transcription polymerase chain reaction (RT-PCR)."} // "confirmed influenza B virus infection by real time reverse transcription polymerase chain reaction"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_finding_of_influenza_due_to_influenza_a_virus_subtype_h1n1_now@@confirmed_by_real_time_reverse_transcription_polymerase_chain_reaction
         patient_has_finding_of_influenza_due_to_influenza_a_virus_subtype_h1n1_now)
     :named REQ0_AUXILIARY0)) ;; "confirmed influenza A (H1N1) virus infection by real time reverse transcription polymerase chain reaction"

(assert
  (! (=> patient_has_finding_of_influenza_caused_by_influenza_a_virus_subtype_h3n2_now@@confirmed_by_real_time_reverse_transcription_polymerase_chain_reaction
         patient_has_finding_of_influenza_caused_by_influenza_a_virus_subtype_h3n2_now)
     :named REQ0_AUXILIARY1)) ;; "confirmed influenza A (H3N2) virus infection by real time reverse transcription polymerase chain reaction"

(assert
  (! (=> patient_has_finding_of_influenza_due_to_influenza_b_virus_now@@confirmed_by_real_time_reverse_transcription_polymerase_chain_reaction
         patient_has_finding_of_influenza_due_to_influenza_b_virus_now)
     :named REQ0_AUXILIARY2)) ;; "confirmed influenza B virus infection by real time reverse transcription polymerase chain reaction"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: At least one confirmed infection by RT-PCR (A(H1N1), A(H3N2), or B)
(assert
  (! (or patient_has_finding_of_influenza_due_to_influenza_a_virus_subtype_h1n1_now@@confirmed_by_real_time_reverse_transcription_polymerase_chain_reaction
         patient_has_finding_of_influenza_caused_by_influenza_a_virus_subtype_h3n2_now@@confirmed_by_real_time_reverse_transcription_polymerase_chain_reaction
         patient_has_finding_of_influenza_due_to_influenza_b_virus_now@@confirmed_by_real_time_reverse_transcription_polymerase_chain_reaction)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (confirmed influenza A (H1N1) virus infection by real time reverse transcription polymerase chain reaction) OR (confirmed influenza A (H3N2) virus infection by real time reverse transcription polymerase chain reaction) OR (confirmed influenza B virus infection by real time reverse transcription polymerase chain reaction)."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 18 years AND aged ≤ 65 years"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must be aged ≥ 18 years.
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 18 years."

;; Component 1: To be included, the patient must be aged ≤ 65 years.
(assert
  (! (<= patient_age_value_recorded_now_in_years 65)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≤ 65 years."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_axillary_temperature_value_recorded_now_withunit_celsius Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's axillary temperature is recorded now in degrees Celsius.","when_to_set_to_null":"Set to null if no axillary temperature measurement is available for now or the value is indeterminate.","meaning":"Numeric value representing the patient's axillary temperature measured now, in degrees Celsius."} // "axillary temperature ≥ 38 degrees Celsius"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (>= patient_axillary_temperature_value_recorded_now_withunit_celsius 38.0)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have axillary temperature ≥ 38 degrees Celsius."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_constitutional_symptom_count_now Real) ;; {"when_to_set_to_value":"Set to the number of constitutional symptoms (from the set: headache, chill, myalgia, fatigue) the patient currently has.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many constitutional symptoms the patient currently has.","meaning":"Numeric variable indicating the total number of constitutional symptoms (headache, chill, myalgia, fatigue) the patient currently has."} // "at least two constitutional symptoms (headache OR chill OR myalgia OR fatigue)"
(declare-const patient_has_finding_of_headache_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has headache.","when_to_set_to_false":"Set to false if the patient currently does not have headache.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has headache.","meaning":"Boolean indicating whether the patient currently has headache."} // "headache"
(declare-const patient_has_finding_of_chill_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chill.","when_to_set_to_false":"Set to false if the patient currently does not have chill.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chill.","meaning":"Boolean indicating whether the patient currently has chill."} // "chill"
(declare-const patient_has_finding_of_muscle_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has muscle pain (myalgia).","when_to_set_to_false":"Set to false if the patient currently does not have muscle pain (myalgia).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has muscle pain (myalgia).","meaning":"Boolean indicating whether the patient currently has muscle pain (myalgia)."} // "myalgia"
(declare-const patient_has_finding_of_fatigue_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has fatigue.","when_to_set_to_false":"Set to false if the patient currently does not have fatigue.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has fatigue.","meaning":"Boolean indicating whether the patient currently has fatigue."} // "fatigue"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Definition of constitutional symptom count based on the exhaustive list in the requirement
(assert
  (! (= patient_constitutional_symptom_count_now
        (+ (ite patient_has_finding_of_headache_now 1.0 0.0)
           (ite patient_has_finding_of_chill_now 1.0 0.0)
           (ite patient_has_finding_of_muscle_pain_now 1.0 0.0)
           (ite patient_has_finding_of_fatigue_now 1.0 0.0)))
     :named REQ3_AUXILIARY0)) ;; "at least two constitutional symptoms (headache OR chill OR myalgia OR fatigue)"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: patient must have at least two constitutional symptoms
(assert
  (! (>= patient_constitutional_symptom_count_now 2.0)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "at least two constitutional symptoms (headache OR chill OR myalgia OR fatigue)"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_symptoms_of_cough_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the symptom of cough.","when_to_set_to_false":"Set to false if the patient currently does not have the symptom of cough.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the symptom of cough.","meaning":"Boolean indicating whether the patient currently has the symptom of cough."} // "cough"
(declare-const patient_has_symptoms_of_sore_throat_symptom_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the symptom of sore throat.","when_to_set_to_false":"Set to false if the patient currently does not have the symptom of sore throat.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the symptom of sore throat.","meaning":"Boolean indicating whether the patient currently has the symptom of sore throat."} // "sore throat"
(declare-const patient_has_symptoms_of_coryza_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the symptom of coryza.","when_to_set_to_false":"Set to false if the patient currently does not have the symptom of coryza.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the symptom of coryza.","meaning":"Boolean indicating whether the patient currently has the symptom of coryza."} // "coryza"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: To be included, the patient must have at least one respiratory symptom (cough OR sore throat OR coryza).
(assert
  (! (or patient_has_symptoms_of_cough_now
         patient_has_symptoms_of_sore_throat_symptom_now
         patient_has_symptoms_of_coryza_now)
     :named REQ4_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE))

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_time_of_illness_onset_value_recorded_now_withunit_hours Real) ;; {"when_to_set_to_value":"Set to the measured or documented number of hours since the patient's illness onset at the time of evaluation.","when_to_set_to_null":"Set to null if the time since illness onset is unknown, not documented, or cannot be determined at the time of evaluation.","meaning":"Numeric value representing the number of hours since the patient's illness onset at the current evaluation."} // "illness onset within 36 hours"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! (< patient_time_of_illness_onset_value_recorded_now_withunit_hours 36.0)
     :named REQ5_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have illness onset within 36 hours."

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_has_provided_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided informed consent.","when_to_set_to_false":"Set to false if the patient has not provided informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided informed consent.","meaning":"Boolean indicating whether the patient has provided informed consent."} // "To be included, the patient must have provided informed consent."

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! patient_has_provided_informed_consent
     :named REQ6_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have provided informed consent."
