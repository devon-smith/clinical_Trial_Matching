;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_acute_gastroenteritis_now Bool) ;; "To be included, the patient must have acute gastroenteritis." {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of acute gastroenteritis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of acute gastroenteritis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of acute gastroenteritis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of acute gastroenteritis."}

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_diagnosis_of_acute_gastroenteritis_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have acute gastroenteritis."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; "aged ≥ 1 years AND aged ≤ 14 years" {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must be aged ≥ 1 years.
(assert
  (! (>= patient_age_value_recorded_now_in_years 1)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 1 years."

;; Component 1: To be included, the patient must be aged ≤ 14 years.
(assert
  (! (<= patient_age_value_recorded_now_in_years 14)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≤ 14 years."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_diarrhea_now Bool) ;; "diarrhea" {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of diarrhea.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of diarrhea.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of diarrhea.","meaning":"Boolean indicating whether the patient currently has diarrhea."}
(declare-const patient_has_finding_of_diarrhea_now@@present_at_primary_emergency_center_al_saad Bool) ;; "present to Primary Emergency Center Al Saad with diarrhea" {"when_to_set_to_true":"Set to true if the patient's current diarrhea is present at the time of presentation to Primary Emergency Center Al Saad.","when_to_set_to_false":"Set to false if the patient's current diarrhea is not present at the time of presentation to Primary Emergency Center Al Saad.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current diarrhea is present at the time of presentation to Primary Emergency Center Al Saad.","meaning":"Boolean indicating whether the patient's current diarrhea is present at the time of presentation to Primary Emergency Center Al Saad."}

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_diarrhea_now@@present_at_primary_emergency_center_al_saad
         patient_has_finding_of_diarrhea_now)
     :named REQ2_AUXILIARY0)) ;; "present to Primary Emergency Center Al Saad with diarrhea"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_finding_of_diarrhea_now@@present_at_primary_emergency_center_al_saad
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must present to Primary Emergency Center Al Saad with diarrhea."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_finding_of_persistent_vomiting_now Bool) ;; "persistent vomiting" {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of persistent vomiting.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of persistent vomiting.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of persistent vomiting.","meaning":"Boolean indicating whether the patient currently has persistent vomiting."}
(declare-const patient_has_finding_of_persistent_vomiting_now@@present_at_primary_emergency_center_al_saad Bool) ;; "present to Primary Emergency Center Al Saad with persistent vomiting" {"when_to_set_to_true":"Set to true if the patient's persistent vomiting is present at Primary Emergency Center Al Saad.","when_to_set_to_false":"Set to false if the patient's persistent vomiting is not present at Primary Emergency Center Al Saad.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's persistent vomiting is present at Primary Emergency Center Al Saad.","meaning":"Boolean indicating whether the patient's persistent vomiting is present at Primary Emergency Center Al Saad."}

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_persistent_vomiting_now@@present_at_primary_emergency_center_al_saad
         patient_has_finding_of_persistent_vomiting_now)
     :named REQ3_AUXILIARY0)) ;; "present to Primary Emergency Center Al Saad with persistent vomiting"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_has_finding_of_persistent_vomiting_now@@present_at_primary_emergency_center_al_saad
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must present to Primary Emergency Center Al Saad with persistent vomiting."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_undergone_oral_rehydration_therapy_inthehistory_outcome_is_negative Bool) ;; "To be included, the patient must have failed oral rehydration." {"when_to_set_to_true":"Set to true if the patient has undergone oral rehydration therapy at any time in the past and the outcome was negative (the therapy failed).","when_to_set_to_false":"Set to false if the patient has undergone oral rehydration therapy at any time in the past and the outcome was not negative (the therapy succeeded or was indeterminate).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone oral rehydration therapy and the outcome was negative.","meaning":"Boolean indicating whether the patient has undergone oral rehydration therapy in the past and the therapy failed."}

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! patient_has_undergone_oral_rehydration_therapy_inthehistory_outcome_is_negative
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have failed oral rehydration."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_is_admitted_to_observation_unit_now Bool) ;; "To be included, the patient must be admitted to the observation unit for intravenous hydration." {"when_to_set_to_true":"Set to true if the patient is currently admitted to the observation unit.","when_to_set_to_false":"Set to false if the patient is currently not admitted to the observation unit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently admitted to the observation unit.","meaning":"Boolean indicating whether the patient is currently admitted to the observation unit."}
(declare-const patient_is_undergoing_intravenous_fluid_replacement_now Bool) ;; "To be included, the patient must be admitted to the observation unit for intravenous hydration." {"when_to_set_to_true":"Set to true if the patient is currently undergoing intravenous fluid replacement (intravenous hydration).","when_to_set_to_false":"Set to false if the patient is currently not undergoing intravenous fluid replacement (intravenous hydration).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing intravenous fluid replacement (intravenous hydration).","meaning":"Boolean indicating whether the patient is currently undergoing intravenous fluid replacement (intravenous hydration)."}

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! (and patient_is_admitted_to_observation_unit_now
          patient_is_undergoing_intravenous_fluid_replacement_now)
     :named REQ5_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must be admitted to the observation unit for intravenous hydration."
