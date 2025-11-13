;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_systemic_inflammatory_response_syndrome_value_recorded_now_withunit_count Real) ;; {"when_to_set_to_value":"Set to the number of systemic inflammatory response syndrome criteria present in the patient now, as defined by the American College of Chest Physicians/Society of Critical Care Medicine.","when_to_set_to_null":"Set to null if the number of criteria present now is unknown, not documented, or cannot be determined.","meaning":"Numeric count of systemic inflammatory response syndrome criteria present in the patient now."} // "the number of systemic inflammatory response syndrome criteria according to American College of Chest Physicians/Society of Critical Care Medicine definition"
(declare-const patient_systemic_inflammatory_response_syndrome_value_recorded_now_withunit_count@@defined_according_to_american_college_of_chest_physicians_society_of_critical_care_medicine Bool) ;; {"when_to_set_to_true":"Set to true if the number of SIRS criteria is determined according to the American College of Chest Physicians/Society of Critical Care Medicine definition.","when_to_set_to_false":"Set to false if the number of SIRS criteria is determined by a different definition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined which definition was used.","meaning":"Boolean indicating whether the SIRS criteria count is defined according to the American College of Chest Physicians/Society of Critical Care Medicine."} // "according to American College of Chest Physicians/Society of Critical Care Medicine definition"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (and 
        patient_systemic_inflammatory_response_syndrome_value_recorded_now_withunit_count@@defined_according_to_american_college_of_chest_physicians_society_of_critical_care_medicine
        (>= patient_systemic_inflammatory_response_syndrome_value_recorded_now_withunit_count 2))
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the number of systemic inflammatory response syndrome criteria according to American College of Chest Physicians/Society of Critical Care Medicine definition ≥ 2"

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_disorder_due_to_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder due to infection.","when_to_set_to_false":"Set to false if the patient currently does not have a disorder due to infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder due to infection.","meaning":"Boolean indicating whether the patient currently has a disorder due to infection."} // "infection"
(declare-const patient_has_finding_of_disorder_due_to_infection_now@@documented Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder due to infection and the infection is documented.","when_to_set_to_false":"Set to false if the patient currently has a disorder due to infection but the infection is not documented.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the infection is documented.","meaning":"Boolean indicating whether the patient's current infection is documented."} // "documented infection"
(declare-const patient_has_finding_of_disorder_due_to_infection_now@@strong_suspicion Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder due to infection and there is strong suspicion of infection.","when_to_set_to_false":"Set to false if the patient currently has a disorder due to infection but there is not strong suspicion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether there is strong suspicion of infection.","meaning":"Boolean indicating whether the patient's current infection is strongly suspected."} // "strong suspicion of infection"
(declare-const patient_is_undergoing_antibiotic_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing antibiotic therapy.","when_to_set_to_false":"Set to false if the patient is currently not undergoing antibiotic therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing antibiotic therapy.","meaning":"Boolean indicating whether the patient is currently undergoing antibiotic therapy."} // "antibiotic treatment"
(declare-const patient_is_undergoing_antibiotic_therapy_now@@adequate Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing antibiotic therapy and the therapy is adequate.","when_to_set_to_false":"Set to false if the patient is currently undergoing antibiotic therapy but the therapy is not adequate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the therapy is adequate.","meaning":"Boolean indicating whether the patient's current antibiotic therapy is adequate."} // "adequate antibiotic treatment"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply their stem variable
(assert
  (! (=> patient_has_finding_of_disorder_due_to_infection_now@@documented
         patient_has_finding_of_disorder_due_to_infection_now)
     :named REQ1_AUXILIARY0)) ;; "documented infection" implies "infection"

(assert
  (! (=> patient_has_finding_of_disorder_due_to_infection_now@@strong_suspicion
         patient_has_finding_of_disorder_due_to_infection_now)
     :named REQ1_AUXILIARY1)) ;; "strong suspicion of infection" implies "infection"

(assert
  (! (=> patient_is_undergoing_antibiotic_therapy_now@@adequate
         patient_is_undergoing_antibiotic_therapy_now)
     :named REQ1_AUXILIARY2)) ;; "adequate antibiotic treatment" implies "antibiotic treatment"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: (documented infection OR strong suspicion of infection)
(assert
  (! (or patient_has_finding_of_disorder_due_to_infection_now@@documented
         patient_has_finding_of_disorder_due_to_infection_now@@strong_suspicion)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "documented infection OR strong suspicion of infection"

;; Component 1: adequate antibiotic treatment
(assert
  (! patient_is_undergoing_antibiotic_therapy_now@@adequate
     :named REQ1_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "adequate antibiotic treatment"

;; ===================== Declarations for the inclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_shock_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of shock.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of shock.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of shock.","meaning":"Boolean indicating whether the patient currently has shock."} // "shock"
(declare-const patient_has_necessity_of_vasopressor_treatment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a necessity for vasopressor treatment.","when_to_set_to_false":"Set to false if the patient currently does not have a necessity for vasopressor treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a necessity for vasopressor treatment.","meaning":"Boolean indicating whether the patient currently has a necessity for vasopressor treatment."} // "necessity of vasopressor treatment"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: The patient must have shock according to American College of Chest Physicians/Society of Critical Care Medicine definition.
(assert
  (! patient_has_finding_of_shock_now
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have shock according to American College of Chest Physicians/Society of Critical Care Medicine definition."

;; Component 1: The patient must have necessity of vasopressor treatment.
(assert
  (! patient_has_necessity_of_vasopressor_treatment_now
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have necessity of vasopressor treatment."
