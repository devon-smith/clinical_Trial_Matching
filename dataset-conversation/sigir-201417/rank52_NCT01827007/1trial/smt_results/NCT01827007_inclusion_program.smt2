;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_written_informed_consent_provided_by_patient_or_relative Bool) ;; {"when_to_set_to_true":"Set to true if there is written informed consent and it is provided either by the patient or by a relative.","when_to_set_to_false":"Set to false if there is not written informed consent, or if written informed consent is not provided by the patient or a relative.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether written informed consent is provided by the patient or a relative.","meaning":"Boolean indicating whether the patient has written informed consent, where the consent is provided either by the patient or by a relative."} // "To be included, the patient must have written informed consent (provided by the patient OR provided by a relative)."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_written_informed_consent_provided_by_patient_or_relative
     :named REQ0_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have written informed consent (provided by the patient OR provided by a relative)."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_duration_in_intensive_care_unit_in_hours Real) ;; {"when_to_set_to_value":"Set to the total number of hours the patient has been in the intensive care unit, as documented in the medical record.","when_to_set_to_null":"Set to null if the duration is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the total hours the patient has been in the intensive care unit."} // "the patient must have been in the intensive care unit for less than 48 hours."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (< patient_duration_in_intensive_care_unit_in_hours 48.0)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must have been in the intensive care unit for less than 48 hours."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_septic_shock_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of septic shock.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of septic shock.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of septic shock.","meaning":"Boolean indicating whether the patient currently has septic shock."} // "To be included, the patient must have septic shock."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_finding_of_septic_shock_now
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have septic shock."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_undergone_pulmonary_catheterization_with_swan_ganz_catheter_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has undergone pulmonary artery catheterization with a Swan-Ganz catheter (i.e., the catheter is in place now).","when_to_set_to_false":"Set to false if the patient has not undergone pulmonary artery catheterization with a Swan-Ganz catheter now (i.e., no catheter in place now).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has undergone pulmonary artery catheterization with a Swan-Ganz catheter.","meaning":"Boolean indicating whether the patient currently has a pulmonary artery catheter (Swan-Ganz) in place."} // "To be included, the patient must have a pulmonary artery catheter."
(declare-const patient_has_undergone_radial_artery_cannula_insertion_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has undergone radial artery cannula insertion (i.e., the catheter is in place now).","when_to_set_to_false":"Set to false if the patient has not undergone radial artery cannula insertion now (i.e., no catheter in place now).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has undergone radial artery cannula insertion.","meaning":"Boolean indicating whether the patient currently has a radial arterial catheter in place."} // "To be included, the patient must have a radial arterial catheter."

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: The patient must have a pulmonary artery catheter.
(assert
  (! patient_has_undergone_pulmonary_catheterization_with_swan_ganz_catheter_now
     :named REQ3_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have a pulmonary artery catheter."

;; Component 1: The patient must have a radial arterial catheter.
(assert
  (! patient_has_undergone_radial_artery_cannula_insertion_now
     :named REQ3_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have a radial arterial catheter."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 18 years AND aged ≤ 75 years"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: To be included, the patient must be aged ≥ 18 years.
(assert
  (! (>= patient_age_value_recorded_now_in_years 18.0)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 18 years."

;; Component 1: To be included, the patient must be aged ≤ 75 years.
(assert
  (! (<= patient_age_value_recorded_now_in_years 75.0)
     :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≤ 75 years."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_finding_of_sinus_rhythm_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of sinus rhythm.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of sinus rhythm.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has sinus rhythm.","meaning":"Boolean indicating whether the patient currently has sinus rhythm."} // "To be included, the patient must have sinus rhythm."

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! patient_has_finding_of_sinus_rhythm_now
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have sinus rhythm."

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_has_finding_of_hemodynamically_stable_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently hemodynamically stable.","when_to_set_to_false":"Set to false if the patient is currently not hemodynamically stable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently hemodynamically stable.","meaning":"Boolean indicating whether the patient is currently hemodynamically stable."} // "otherwise be hemodynamically stable (defined as NOT needing to change the dose over the last 15 minute period before the study)"
(declare-const patient_norepinephrine_value_recorded_15_minutes_ago_withunit_micrograms_per_kilogram_per_minute Real) ;; {"when_to_set_to_value":"Set to the measured dose if the patient's norepinephrine dose in micrograms per kilogram per minute recorded 15 minutes ago is available.","when_to_set_to_null":"Set to null if no such dose measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's norepinephrine dose in micrograms per kilogram per minute recorded 15 minutes ago."} // "norepinephrine at a dose > 0.1 micrograms per kilogram per minute"
(declare-const patient_norepinephrine_value_recorded_now_withunit_micrograms_per_kilogram_per_minute Real) ;; {"when_to_set_to_value":"Set to the measured dose if the patient's current norepinephrine dose in micrograms per kilogram per minute is available.","when_to_set_to_null":"Set to null if no such dose measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current dose of norepinephrine in micrograms per kilogram per minute."} // "norepinephrine at a dose > 0.1 micrograms per kilogram per minute"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Definition: Hemodynamically stable is defined as NOT needing to change the dose over the last 15 minute period before the study
(assert
  (! (= patient_has_finding_of_hemodynamically_stable_now
        (= patient_norepinephrine_value_recorded_now_withunit_micrograms_per_kilogram_per_minute
           patient_norepinephrine_value_recorded_15_minutes_ago_withunit_micrograms_per_kilogram_per_minute))
     :named REQ6_AUXILIARY0)) ;; "hemodynamically stable (defined as NOT needing to change the dose over the last 15 minute period before the study)"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Component 0: Patient must need norepinephrine at a dose > 0.1 micrograms per kilogram per minute
(assert
  (! (> patient_norepinephrine_value_recorded_now_withunit_micrograms_per_kilogram_per_minute 0.1)
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "need norepinephrine at a dose > 0.1 micrograms per kilogram per minute"

;; Component 1: Patient must otherwise be hemodynamically stable (as defined above)
(assert
  (! patient_has_finding_of_hemodynamically_stable_now
     :named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "otherwise be hemodynamically stable (defined as NOT needing to change the dose over the last 15 minute period before the study)"

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_is_undergoing_artificial_respiration_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing artificial respiration (mechanical ventilation) now.","when_to_set_to_false":"Set to false if the patient is not currently undergoing artificial respiration (mechanical ventilation) now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing artificial respiration (mechanical ventilation) now.","meaning":"Boolean indicating whether the patient is currently undergoing artificial respiration (mechanical ventilation) now."} // "mechanical ventilation"
(declare-const patient_is_undergoing_sedation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing sedation now.","when_to_set_to_false":"Set to false if the patient is not currently undergoing sedation now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing sedation now.","meaning":"Boolean indicating whether the patient is currently undergoing sedation now."} // "sedation"

;; ===================== Constraint Assertions (REQ 7) =====================
;; Component 0: To be included, the patient must be on mechanical ventilation.
(assert
  (! patient_is_undergoing_artificial_respiration_now
     :named REQ7_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be on mechanical ventilation."

;; Component 1: To be included, the patient must be on sedation.
(assert
  (! patient_is_undergoing_sedation_now
     :named REQ7_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be on sedation."

;; ===================== Declarations for the criterion (REQ 8) =====================
(declare-const patient_pulmonary_artery_wedge_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's pulmonary artery wedge pressure is recorded now in millimeters of mercury.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's pulmonary artery wedge pressure measured now, in millimeters of mercury."} // "pulmonary wedge capillary pressure"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
  (! (< patient_pulmonary_artery_wedge_pressure_value_recorded_now_withunit_millimeters_of_mercury 18.0)
     :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have pulmonary wedge capillary pressure < 18 millimeters of mercury."
