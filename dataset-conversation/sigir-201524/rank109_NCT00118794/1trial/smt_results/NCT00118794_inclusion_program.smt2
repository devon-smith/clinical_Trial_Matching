;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_presents_at_health_centre_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently presenting at a health centre.","when_to_set_to_false":"Set to false if the patient is not currently presenting at a health centre.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently presenting at a health centre.","meaning":"Boolean indicating whether the patient is currently presenting at a health centre."} // "To be included, the patient must present at a health centre."
(declare-const patient_has_finding_of_disorder_characterized_by_fever_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder characterized by fever (febrile illness).","when_to_set_to_false":"Set to false if the patient currently does not have a disorder characterized by fever (febrile illness).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder characterized by fever (febrile illness).","meaning":"Boolean indicating whether the patient currently has a disorder characterized by fever (febrile illness) now."} // "To be included, the patient must have febrile illness."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_presents_at_health_centre_now
     :named REQ0_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must present at a health centre."
(assert
  (! patient_has_finding_of_disorder_characterized_by_fever_now
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have febrile illness."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_disorder_due_to_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder due to infection.","when_to_set_to_false":"Set to false if the patient currently does not have a disorder due to infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder due to infection.","meaning":"Boolean indicating whether the patient currently has a disorder due to infection."} // "To be included, the patient must have monoinfection with Plasmodium falciparum infection."
(declare-const patient_has_finding_of_disorder_due_to_infection_now@@monoinfection_with_plasmodium_falciparum Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder due to infection and the infection is a monoinfection with Plasmodium falciparum.","when_to_set_to_false":"Set to false if the patient currently has a disorder due to infection but it is not a monoinfection with Plasmodium falciparum.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the infection is a monoinfection with Plasmodium falciparum.","meaning":"Boolean indicating whether the patient's current infection is a monoinfection with Plasmodium falciparum."} // "To be included, the patient must have monoinfection with Plasmodium falciparum infection."
(declare-const patient_has_finding_of_falciparum_malaria_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has Plasmodium falciparum infection.","when_to_set_to_false":"Set to false if the patient currently does not have Plasmodium falciparum infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has Plasmodium falciparum infection.","meaning":"Boolean indicating whether the patient currently has Plasmodium falciparum infection."} // "To be included, the patient must have monoinfection with Plasmodium falciparum infection."
(declare-const patient_has_finding_of_falciparum_malaria_now@@monoinfection Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has Plasmodium falciparum infection and it is a monoinfection.","when_to_set_to_false":"Set to false if the patient currently has Plasmodium falciparum infection but it is not a monoinfection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the infection is a monoinfection.","meaning":"Boolean indicating whether the patient's current Plasmodium falciparum infection is a monoinfection."} // "To be included, the patient must have monoinfection with Plasmodium falciparum infection."

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies stem variable for infection
(assert
  (! (=> patient_has_finding_of_disorder_due_to_infection_now@@monoinfection_with_plasmodium_falciparum
         patient_has_finding_of_disorder_due_to_infection_now)
     :named REQ1_AUXILIARY0)) ;; "To be included, the patient must have monoinfection with Plasmodium falciparum infection."

;; Qualifier variable implies stem variable for falciparum malaria
(assert
  (! (=> patient_has_finding_of_falciparum_malaria_now@@monoinfection
         patient_has_finding_of_falciparum_malaria_now)
     :named REQ1_AUXILIARY1)) ;; "To be included, the patient must have monoinfection with Plasmodium falciparum infection."

;; Monoinfection with Plasmodium falciparum infection is equivalent to monoinfection with Plasmodium falciparum malaria
(assert
  (! (= patient_has_finding_of_disorder_due_to_infection_now@@monoinfection_with_plasmodium_falciparum
        patient_has_finding_of_falciparum_malaria_now@@monoinfection)
     :named REQ1_AUXILIARY2)) ;; "To be included, the patient must have monoinfection with Plasmodium falciparum infection."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_finding_of_disorder_due_to_infection_now@@monoinfection_with_plasmodium_falciparum
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have monoinfection with Plasmodium falciparum infection."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const parasitaemia_value_recorded_now_withunit_per_microlitre Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's parasitaemia (number of parasites per microlitre) measured at the current time.","when_to_set_to_null":"Set to null if the patient's parasitaemia value (per microlitre) at the current time is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's parasitaemia (number of parasites per microlitre) measured at the current time."} // "To be included, the patient must have parasitaemia ≥ 500 per microlitre."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (>= parasitaemia_value_recorded_now_withunit_per_microlitre 500.0)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have parasitaemia ≥ 500 per microlitre."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_finding_of_fever_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of fever at any time in the past.","when_to_set_to_false":"Set to false if the patient does not have a documented history of fever at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of fever.","meaning":"Boolean indicating whether the patient has a history of fever (ever had fever in the past)."} // "To be included, the patient must (have fever OR have a history of fever)."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (or patient_has_finding_of_disorder_characterized_by_fever_now
         patient_has_finding_of_fever_inthehistory)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must (have fever OR have a history of fever)."
