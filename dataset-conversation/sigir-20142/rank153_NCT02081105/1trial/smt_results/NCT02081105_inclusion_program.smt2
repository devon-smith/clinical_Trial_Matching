;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_undergone_insertion_of_endotracheal_tube_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an endotracheal tube inserted (i.e., is intubated now).","when_to_set_to_false":"Set to false if the patient does not currently have an endotracheal tube inserted.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an endotracheal tube inserted.","meaning":"Boolean indicating whether the patient currently has an endotracheal tube inserted."}  ;; "have endotracheal intubation"
(declare-const patient_is_undergoing_artificial_respiration_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving mechanical ventilation (artificial respiration) now.","when_to_set_to_false":"Set to false if the patient is not currently receiving mechanical ventilation now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving mechanical ventilation.","meaning":"Boolean indicating whether the patient is currently receiving mechanical ventilation (artificial respiration) now."}  ;; "be receiving mechanical ventilation"
(declare-const patient_is_undergoing_artificial_respiration_now@@in_intensive_care_unit Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving mechanical ventilation in the intensive care unit.","when_to_set_to_false":"Set to false if the patient is currently receiving mechanical ventilation but not in the intensive care unit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the mechanical ventilation is occurring in the intensive care unit.","meaning":"Boolean indicating whether the patient is currently receiving mechanical ventilation in the intensive care unit."}  ;; "in the intensive care unit"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_is_undergoing_artificial_respiration_now@@in_intensive_care_unit
         patient_is_undergoing_artificial_respiration_now)
     :named REQ0_AUXILIARY0)) ;; "be receiving mechanical ventilation in the intensive care unit" implies "be receiving mechanical ventilation"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: patient must have endotracheal intubation
(assert
  (! patient_has_undergone_insertion_of_endotracheal_tube_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "have endotracheal intubation"

;; Component 1: patient must be receiving mechanical ventilation in the intensive care unit
(assert
  (! patient_is_undergoing_artificial_respiration_now@@in_intensive_care_unit
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "be receiving mechanical ventilation in the intensive care unit"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_is_undergoing_sedation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing sedation.","when_to_set_to_false":"Set to false if the patient is currently not undergoing sedation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing sedation.","meaning":"Boolean indicating whether the patient is currently undergoing sedation."}  ;; "sedation"
(declare-const patient_has_finding_of_no_sensitivity_to_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has no sensitivity to pain (is under analgesia).","when_to_set_to_false":"Set to false if the patient currently does not have no sensitivity to pain (is not under analgesia).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has no sensitivity to pain.","meaning":"Boolean indicating whether the patient currently has no sensitivity to pain (is under analgesia)."}  ;; "analgesia"
(declare-const ramsay_sedation_score_value_recorded_now_withunit_integer Int) ;; {"when_to_set_to_value":"Set to the integer value of the Ramsay sedation score recorded for the patient at the current time.","when_to_set_to_null":"Set to null if the Ramsay sedation score value is unknown, not documented, or cannot be determined for the patient at the current time.","meaning":"Numeric variable indicating the Ramsay sedation score value recorded for the patient at the current time, expressed as an integer."}  ;; "Ramsay sedation score"

;; ===================== Constraint Assertions (REQ 1) =====================
;; The patient must have a Ramsay sedation score of 6 while under both sedation and analgesia.
(assert
  (! (and (= ramsay_sedation_score_value_recorded_now_withunit_integer 6)
          patient_is_undergoing_sedation_now
          patient_has_finding_of_no_sensitivity_to_pain_now)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a Ramsay sedation score of 6 while under both sedation and analgesia."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_is_on_intensive_care_unit_respirator_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently on an intensive care unit respirator.","when_to_set_to_false":"Set to false if the patient is currently not on an intensive care unit respirator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently on an intensive care unit respirator.","meaning":"Boolean indicating whether the patient is currently on an intensive care unit respirator."} ;; "the patient must be on an intensive care unit respirator"
(declare-const patient_is_on_intensive_care_unit_respirator_now@@implemented_with_pressure_volume_curve_device Bool) ;; {"when_to_set_to_true":"Set to true if the intensive care unit respirator the patient is currently on is implemented with a pressure-volume curve device.","when_to_set_to_false":"Set to false if the intensive care unit respirator the patient is currently on is not implemented with a pressure-volume curve device.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the intensive care unit respirator the patient is currently on is implemented with a pressure-volume curve device.","meaning":"Boolean indicating whether the intensive care unit respirator the patient is currently on is implemented with a pressure-volume curve device."} ;; "implemented with a pressure-volume curve device"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_is_on_intensive_care_unit_respirator_now@@implemented_with_pressure_volume_curve_device
         patient_is_on_intensive_care_unit_respirator_now)
     :named REQ2_AUXILIARY0)) ;; "implemented with a pressure-volume curve device" implies "on an intensive care unit respirator"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: To be included, the patient must be on an intensive care unit respirator implemented with a pressure-volume curve device.
(assert
  (! patient_is_on_intensive_care_unit_respirator_now@@implemented_with_pressure_volume_curve_device
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "must be on an intensive care unit respirator implemented with a pressure-volume curve device"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "age ≥ 18 years"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18.0)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have age ≥ 18 years."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_finding_of_acute_respiratory_distress_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of acute respiratory distress syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of acute respiratory distress syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has acute respiratory distress syndrome.","meaning":"Boolean indicating whether the patient currently has acute respiratory distress syndrome."}  ;; "acute respiratory distress syndrome"
(declare-const patient_has_finding_of_acute_respiratory_distress_syndrome_now@@defined_by_berlin_criteria Bool) ;; {"when_to_set_to_true":"Set to true if the patient's acute respiratory distress syndrome diagnosis is defined by the Berlin criteria.","when_to_set_to_false":"Set to false if the patient's acute respiratory distress syndrome diagnosis is not defined by the Berlin criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the Berlin criteria were used to define the patient's acute respiratory distress syndrome.","meaning":"Boolean indicating whether the patient's acute respiratory distress syndrome diagnosis is defined by the Berlin criteria."}  ;; "defined from the Berlin criteria"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_acute_respiratory_distress_syndrome_now@@defined_by_berlin_criteria
         patient_has_finding_of_acute_respiratory_distress_syndrome_now)
     :named REQ4_AUXILIARY0)) ;; "defined from the Berlin criteria" implies "acute respiratory distress syndrome"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: To be included, the patient must have acute respiratory distress syndrome (defined from the Berlin criteria).
(assert
  (! patient_has_finding_of_acute_respiratory_distress_syndrome_now@@defined_by_berlin_criteria
     :named REQ4_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have acute respiratory distress syndrome (defined from the Berlin criteria)."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_finding_of_pneumothorax_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of pneumothorax.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of pneumothorax.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pneumothorax.","meaning":"Boolean indicating whether the patient currently has pneumothorax."}  ;; "pneumothorax"
(declare-const patient_has_finding_of_pneumothorax_on_chest_x_ray_before_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient had pneumothorax on the chest X-ray performed before the study.","when_to_set_to_false":"Set to false if the patient did not have pneumothorax on the chest X-ray performed before the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient had pneumothorax on the chest X-ray performed before the study.","meaning":"Boolean indicating whether the patient had pneumothorax on the chest X-ray performed before the study."}  ;; "absence of pneumothorax on the chest X-ray before the study"
(declare-const patient_has_undergone_plain_chest_x_ray_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a plain chest X-ray at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone a plain chest X-ray in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a plain chest X-ray in the past.","meaning":"Boolean indicating whether the patient has undergone a plain chest X-ray at any time in the past."}  ;; "chest X-ray"
(declare-const patient_has_undergone_plain_chest_x_ray_inthehistory@@performed_before_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient's plain chest X-ray was performed before the study.","when_to_set_to_false":"Set to false if the patient's plain chest X-ray was not performed before the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the chest X-ray was performed before the study.","meaning":"Boolean indicating whether the patient's plain chest X-ray was performed before the study."}  ;; "chest X-ray before the study"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_undergone_plain_chest_x_ray_inthehistory@@performed_before_study
         patient_has_undergone_plain_chest_x_ray_inthehistory)
     :named REQ5_AUXILIARY0)) ;; "chest X-ray before the study"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Component 0: To be included, the patient must have absence of pneumothorax on the chest X-ray before the study.
(assert
  (! (and patient_has_undergone_plain_chest_x_ray_inthehistory@@performed_before_study
          (not patient_has_finding_of_pneumothorax_on_chest_x_ray_before_study))
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "absence of pneumothorax on the chest X-ray before the study"

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_pleural_effusion_value_recorded_now_withunit_milliliters Real) ;; {"when_to_set_to_value":"Set to the measured or estimated volume in milliliters if pleural effusion is present and quantified now.","when_to_set_to_null":"Set to null if pleural effusion volume is not measured, not present, or cannot be determined now.","meaning":"Numeric value representing the patient's current pleural effusion volume in milliliters."} ;; "pleural effusion volume in milliliters"
(declare-const patient_pleural_effusion_value_recorded_now_withunit_milliliters@@estimated_from_ultrasonography Bool) ;; {"when_to_set_to_true":"Set to true if the pleural effusion volume is estimated from ultrasonography.","when_to_set_to_false":"Set to false if the pleural effusion volume is not estimated from ultrasonography.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether ultrasonography was used to estimate the pleural effusion volume.","meaning":"Boolean indicating whether the pleural effusion volume was estimated from ultrasonography."} ;; "estimated from ultrasonography"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Component 0: To be included, the patient must have absence of pleural effusion greater than 500 milliliters (estimated from ultrasonography).
(assert
  (! (or (not patient_pleural_effusion_value_recorded_now_withunit_milliliters@@estimated_from_ultrasonography)
         (<= patient_pleural_effusion_value_recorded_now_withunit_milliliters 500.0))
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "absence of pleural effusion greater than 500 milliliters (estimated from ultrasonography)"

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently considered to have childbearing potential.","when_to_set_to_false":"Set to false if the patient is currently not considered to have childbearing potential.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the patient currently has childbearing potential.","meaning":"Boolean value indicating whether the patient currently has childbearing potential."}  ;; "woman of child-bearing potential"

;; ===================== Constraint Assertions (REQ 7) =====================
;; Component 0: To be included, the patient must NOT be a woman of child-bearing potential.
(assert
  (! (not patient_has_childbearing_potential_now)
     :named REQ7_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE))

;; ===================== Declarations for the criterion (REQ 8) =====================
(declare-const patient_has_written_informed_consent_signed_by_next_of_kin Bool) ;; {"when_to_set_to_true":"Set to true if the patient has written informed consent and it is signed by the next of kin.","when_to_set_to_false":"Set to false if the patient does not have written informed consent signed by the next of kin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has written informed consent signed by the next of kin.","meaning":"Boolean indicating whether the patient has written informed consent signed by the next of kin."} ;; "the patient must have written informed consent signed by the next of kin"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
  (! patient_has_written_informed_consent_signed_by_next_of_kin
     :named REQ8_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must have written informed consent signed by the next of kin"
