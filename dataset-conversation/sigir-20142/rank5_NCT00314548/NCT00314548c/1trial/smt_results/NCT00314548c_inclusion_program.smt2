;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_acute_respiratory_distress_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of acute respiratory distress syndrome (ARDS).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of acute respiratory distress syndrome (ARDS).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has ARDS.","meaning":"Boolean indicating whether the patient currently has acute respiratory distress syndrome (ARDS)."} // "have adult respiratory distress syndrome"
(declare-const patient_has_finding_of_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has heart failure.","meaning":"Boolean indicating whether the patient currently has heart failure."} // "have signs of heart failure"
(declare-const patient_has_finding_of_hypoxemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hypoxemia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hypoxemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypoxemia.","meaning":"Boolean indicating whether the patient currently has hypoxemia."} // "arterial hypoxemia"
(declare-const patient_has_finding_of_hypoxemia_now@@arterial Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hypoxemia is arterial in nature.","when_to_set_to_false":"Set to false if the patient's hypoxemia is not arterial in nature.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the hypoxemia is arterial.","meaning":"Boolean indicating whether the patient's hypoxemia is arterial in nature."} // "arterial hypoxemia"
(declare-const patient_has_undergone_plain_chest_x_ray_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has currently undergone a chest X-ray.","when_to_set_to_false":"Set to false if the patient has not currently undergone a chest X-ray.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a chest X-ray.","meaning":"Boolean indicating whether the patient has currently undergone a chest X-ray."} // "bilateral infiltrates on chest X-ray"
(declare-const patient_has_undergone_plain_chest_x_ray_now@@shows_bilateral_infiltrates Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current chest X-ray shows bilateral infiltrates.","when_to_set_to_false":"Set to false if the patient's current chest X-ray does not show bilateral infiltrates.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the chest X-ray shows bilateral infiltrates.","meaning":"Boolean indicating whether the patient's current chest X-ray shows bilateral infiltrates."} // "bilateral infiltrates on chest X-ray"
(declare-const patient_inspired_oxygen_concentration_value_recorded_now_withunit_fraction Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current fraction of inspired oxygen (FiO2) as a unitless fraction is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current fraction of inspired oxygen (FiO2) as a unitless fraction."} // "fraction of inspired oxygen"
(declare-const patient_oxygen_measurement_partial_pressure_arterial_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current arterial partial pressure of oxygen (PaO2) in mmHg is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current arterial partial pressure of oxygen (PaO2) in mmHg."} // "arterial partial pressure of oxygen"
(declare-const patient_pulmonary_artery_wedge_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current pulmonary capillary wedge pressure (PCWP) in mmHg is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current pulmonary capillary wedge pressure (PCWP) in mmHg."} // "pulmonary capillary wedge pressure"
(declare-const patient_pulmonary_artery_wedge_pressure_value_recorded_now_withunit_millimeters_of_mercury@@measured_on_swan_ganz_catheterization_parameters Bool) ;; {"when_to_set_to_true":"Set to true if the PCWP measurement was obtained using Swan-Ganz catheterization parameters.","when_to_set_to_false":"Set to false if the PCWP measurement was not obtained using Swan-Ganz catheterization parameters.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the PCWP measurement was obtained using Swan-Ganz catheterization parameters.","meaning":"Boolean indicating whether the PCWP measurement was obtained using Swan-Ganz catheterization parameters."} // "pulmonary capillary wedge pressure < 20 millimeters of mercury on Swan-Ganz catheterization parameters"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable (hypoxemia)
(assert
  (! (=> patient_has_finding_of_hypoxemia_now@@arterial
         patient_has_finding_of_hypoxemia_now)
     :named REQ0_AUXILIARY0)) ;; "arterial hypoxemia"

;; Qualifier variable implies corresponding stem variable (chest x-ray)
(assert
  (! (=> patient_has_undergone_plain_chest_x_ray_now@@shows_bilateral_infiltrates
         patient_has_undergone_plain_chest_x_ray_now)
     :named REQ0_AUXILIARY1)) ;; "bilateral infiltrates on chest X-ray"

;; Qualifier variable implies corresponding stem variable (PCWP Swan-Ganz)
(assert
  (! (=> patient_pulmonary_artery_wedge_pressure_value_recorded_now_withunit_millimeters_of_mercury@@measured_on_swan_ganz_catheterization_parameters
         true)
     :named REQ0_AUXILIARY2)) ;; "measured on Swan-Ganz catheterization parameters"

;; Definition of PaO2/FiO2 ratio < 200
(define-fun patient_paO2_fiO2_ratio_value_recorded_now () Real
  (/ patient_oxygen_measurement_partial_pressure_arterial_value_recorded_now_withunit_millimeters_of_mercury
     patient_inspired_oxygen_concentration_value_recorded_now_withunit_fraction)) ;; "arterial partial pressure of oxygen divided by fraction of inspired oxygen"

;; Definition of ARDS (as per requirement)
(assert
  (! (= patient_has_finding_of_acute_respiratory_distress_syndrome_now
        (and
          (< patient_paO2_fiO2_ratio_value_recorded_now 200.0) ;; "PaO2/FiO2 < 200"
          patient_has_finding_of_hypoxemia_now@@arterial         ;; "arterial hypoxemia"
          patient_has_undergone_plain_chest_x_ray_now@@shows_bilateral_infiltrates ;; "bilateral infiltrates on chest X-ray"
          (< patient_pulmonary_artery_wedge_pressure_value_recorded_now_withunit_millimeters_of_mercury 20.0) ;; "pulmonary capillary wedge pressure < 20 mmHg"
          patient_pulmonary_artery_wedge_pressure_value_recorded_now_withunit_millimeters_of_mercury@@measured_on_swan_ganz_catheterization_parameters ;; "on Swan-Ganz catheterization parameters"
        ))
     :named REQ0_AUXILIARY3)) ;; "adult respiratory distress syndrome (defined as ...)"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: ARDS (as defined above) OR signs of heart failure
(assert
  (! (or patient_has_finding_of_acute_respiratory_distress_syndrome_now
         patient_has_finding_of_heart_failure_now)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must ((have adult respiratory distress syndrome (defined as ...) OR (have signs of heart failure))."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_provided_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided informed consent.","when_to_set_to_false":"Set to false if the patient has not provided informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided informed consent.","meaning":"Boolean indicating whether the patient has provided informed consent."} // "the patient must have provided informed consent"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_provided_informed_consent
     :named REQ1_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must have provided informed consent"
