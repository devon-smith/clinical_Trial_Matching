;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "an adult with age ≥ 18 years"

(declare-const patient_is_adult_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is considered an adult according to clinical or legal standards at the time of assessment.","when_to_set_to_false":"Set to false if the patient is not considered an adult at the time of assessment.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the patient is an adult.","meaning":"Indicates whether the patient is considered an adult at the time of assessment."} // "To be included, the patient must be an adult."

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Definition: patient is considered an adult if age ≥ 18 years (as per requirement)
(assert
  (! (= patient_is_adult_now
        (>= patient_age_value_recorded_now_in_years 18.0))
     :named REQ0_AUXILIARY0)) ;; "an adult with age ≥ 18 years"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: patient must be an adult
(assert
  (! patient_is_adult_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be an adult."

;; Component 1: patient must have age ≥ 18 years
(assert
  (! (>= patient_age_value_recorded_now_in_years 18.0)
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have age ≥ 18 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_acute_bronchitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of acute bronchitis.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of acute bronchitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of acute bronchitis.","meaning":"Boolean indicating whether the patient currently has acute bronchitis."} // "acute bronchitis"
(declare-const patient_has_finding_of_acute_exacerbation_of_chronic_bronchitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of acute exacerbation of chronic bronchitis.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of acute exacerbation of chronic bronchitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of acute exacerbation of chronic bronchitis.","meaning":"Boolean indicating whether the patient currently has an acute exacerbation of chronic bronchitis."} // "acute exacerbation of chronic bronchitis"
(declare-const patient_has_finding_of_acute_sinusitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of acute sinusitis.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of acute sinusitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of acute sinusitis.","meaning":"Boolean indicating whether the patient currently has acute sinusitis."} // "acute sinusitis"
(declare-const patient_has_finding_of_acute_tonsillopharyngitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of acute tonsillopharyngitis.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of acute tonsillopharyngitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of acute tonsillopharyngitis.","meaning":"Boolean indicating whether the patient currently has acute tonsillopharyngitis."} // "acute tonsillopharyngitis"
(declare-const patient_has_finding_of_acute_tracheitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of acute tracheitis.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of acute tracheitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of acute tracheitis.","meaning":"Boolean indicating whether the patient currently has acute tracheitis."} // "acute tracheitis"
(declare-const patient_has_finding_of_acute_tracheobronchitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of acute tracheobronchitis.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of acute tracheobronchitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of acute tracheobronchitis.","meaning":"Boolean indicating whether the patient currently has acute tracheobronchitis."} // "acute tracheobronchitis"
(declare-const patient_has_finding_of_chronic_sinusitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of chronic sinusitis.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of chronic sinusitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of chronic sinusitis.","meaning":"Boolean indicating whether the patient currently has chronic sinusitis."} // "chronic sinusitis"
(declare-const patient_has_finding_of_community_acquired_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of community-acquired pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of community-acquired pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of community-acquired pneumonia.","meaning":"Boolean indicating whether the patient currently has community-acquired pneumonia."} // "community-acquired pneumonia"
(declare-const patient_has_finding_of_community_acquired_pneumonia_now@@mild Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has community-acquired pneumonia and the pneumonia is mild.","when_to_set_to_false":"Set to false if the patient currently has community-acquired pneumonia but the pneumonia is not mild.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the community-acquired pneumonia is mild.","meaning":"Boolean indicating whether the patient currently has mild community-acquired pneumonia."} // "mild community-acquired pneumonia"
(declare-const patient_has_finding_of_respiratory_tract_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of respiratory tract infection.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of respiratory tract infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of respiratory tract infection.","meaning":"Boolean indicating whether the patient currently has a respiratory tract infection."} // "respiratory tract infection"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable for mild community-acquired pneumonia implies community-acquired pneumonia
(assert
  (! (=> patient_has_finding_of_community_acquired_pneumonia_now@@mild
         patient_has_finding_of_community_acquired_pneumonia_now)
     :named REQ1_AUXILIARY0)) ;; "mild community-acquired pneumonia" is a type of "community-acquired pneumonia"

;; Non-exhaustive examples: each example implies respiratory tract infection, but not vice versa
(assert
  (! (=> patient_has_finding_of_acute_tracheitis_now
         patient_has_finding_of_respiratory_tract_infection_now)
     :named REQ1_AUXILIARY1)) ;; "acute tracheitis" is an example of "respiratory tract infection"
(assert
  (! (=> patient_has_finding_of_acute_tracheobronchitis_now
         patient_has_finding_of_respiratory_tract_infection_now)
     :named REQ1_AUXILIARY2)) ;; "acute tracheobronchitis" is an example of "respiratory tract infection"
(assert
  (! (=> patient_has_finding_of_acute_sinusitis_now
         patient_has_finding_of_respiratory_tract_infection_now)
     :named REQ1_AUXILIARY3)) ;; "acute sinusitis" is an example of "respiratory tract infection"
(assert
  (! (=> patient_has_finding_of_chronic_sinusitis_now
         patient_has_finding_of_respiratory_tract_infection_now)
     :named REQ1_AUXILIARY4)) ;; "chronic sinusitis" is an example of "respiratory tract infection"
(assert
  (! (=> patient_has_finding_of_acute_tonsillopharyngitis_now
         patient_has_finding_of_respiratory_tract_infection_now)
     :named REQ1_AUXILIARY5)) ;; "acute tonsillopharyngitis" is an example of "respiratory tract infection"
(assert
  (! (=> patient_has_finding_of_acute_bronchitis_now
         patient_has_finding_of_respiratory_tract_infection_now)
     :named REQ1_AUXILIARY6)) ;; "acute bronchitis" is an example of "respiratory tract infection"
(assert
  (! (=> patient_has_finding_of_community_acquired_pneumonia_now@@mild
         patient_has_finding_of_respiratory_tract_infection_now)
     :named REQ1_AUXILIARY7)) ;; "mild community-acquired pneumonia" is an example of "respiratory tract infection"
(assert
  (! (=> patient_has_finding_of_acute_exacerbation_of_chronic_bronchitis_now
         patient_has_finding_of_respiratory_tract_infection_now)
     :named REQ1_AUXILIARY8)) ;; "acute exacerbation of chronic bronchitis" is an example of "respiratory tract infection"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_finding_of_respiratory_tract_infection_now
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have a respiratory tract infection with non-exhaustive examples (acute tracheitis OR acute tracheobronchitis OR acute sinusitis OR chronic sinusitis OR acute tonsillopharyngitis OR acute bronchitis OR mild community-acquired pneumonia OR acute exacerbation of chronic bronchitis)."
