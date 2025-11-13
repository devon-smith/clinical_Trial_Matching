;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_acute_respiratory_distress_syndrome_inthehistory Bool) ;; "acute respiratory distress syndrome" {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with acute respiratory distress syndrome at any time in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with acute respiratory distress syndrome at any time in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with acute respiratory distress syndrome.","meaning":"Boolean indicating whether the patient has ever been diagnosed with acute respiratory distress syndrome."}

;; ===================== Constraint Assertions (REQ 0) =====================
;; To be included, the patient must have been diagnosed with acute respiratory distress syndrome.
(assert
  (! patient_has_diagnosis_of_acute_respiratory_distress_syndrome_inthehistory
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE))

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_inspired_oxygen_concentration_value_recorded_now_withunit_fraction Real) ;; "fraction of inspired oxygen" {"when_to_set_to_value":"Set to the measured value if the patient's current fraction of inspired oxygen (FiO2) is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's current fraction of inspired oxygen (FiO2) as a fraction."}
(declare-const patient_oxygen_measurement_partial_pressure_arterial_value_recorded_now_withunit_millimeters_of_mercury Real) ;; "partial pressure of oxygen in arterial blood" {"when_to_set_to_value":"Set to the measured value if the patient's current partial pressure of oxygen in arterial blood (PaO2) in millimeters of mercury is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's current partial pressure of oxygen in arterial blood (PaO2) in millimeters of mercury."}
(declare-const patient_oxygen_measurement_partial_pressure_arterial_value_recorded_now_withunit_millimeters_of_mercury@@acutely_decreased Bool) ;; "acute decrease in partial pressure of oxygen in arterial blood" {"when_to_set_to_true":"Set to true if the patient's PaO2 value is acutely decreased (i.e., the decrease occurred rapidly, consistent with acute onset).","when_to_set_to_false":"Set to false if the patient's PaO2 value is not acutely decreased (i.e., no evidence of rapid onset).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the decrease in PaO2 is acute.","meaning":"Boolean indicating whether the patient's PaO2 decrease is acute (rapid onset)."}

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_oxygen_measurement_partial_pressure_arterial_value_recorded_now_withunit_millimeters_of_mercury@@acutely_decreased
         (not (= patient_oxygen_measurement_partial_pressure_arterial_value_recorded_now_withunit_millimeters_of_mercury 0.0)))
     :named REQ1_AUXILIARY0)) ;; "acute decrease in partial pressure of oxygen in arterial blood" (if acutely decreased, PaO2 must be defined)

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must have an acute decrease in (partial pressure of oxygen in arterial blood to fraction of inspired oxygen ratio ≤ 200 millimeters of mercury).
(assert
  (! (and patient_oxygen_measurement_partial_pressure_arterial_value_recorded_now_withunit_millimeters_of_mercury@@acutely_decreased
          (<= (/ patient_oxygen_measurement_partial_pressure_arterial_value_recorded_now_withunit_millimeters_of_mercury
                 patient_inspired_oxygen_concentration_value_recorded_now_withunit_fraction)
              200.0))
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "acute decrease in (partial pressure of oxygen in arterial blood to fraction of inspired oxygen ratio ≤ 200 millimeters of mercury)"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_radiologic_infiltrate_of_lung_now Bool) ;; "pulmonary infiltrates" {"when_to_set_to_true":"Set to true if the patient currently has radiologic infiltrates of the lung.","when_to_set_to_false":"Set to false if the patient currently does not have radiologic infiltrates of the lung.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has radiologic infiltrates of the lung.","meaning":"Boolean indicating whether the patient currently has radiologic infiltrates of the lung."}
(declare-const patient_has_finding_of_radiologic_infiltrate_of_lung_now@@bilateral Bool) ;; "bilateral pulmonary infiltrates" {"when_to_set_to_true":"Set to true if the patient's radiologic infiltrates of the lung are bilateral.","when_to_set_to_false":"Set to false if the patient's radiologic infiltrates of the lung are not bilateral.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's radiologic infiltrates of the lung are bilateral.","meaning":"Boolean indicating whether the patient's radiologic infiltrates of the lung are bilateral."}
(declare-const patient_has_undergone_plain_chest_x_ray_now Bool) ;; "chest radiograph" {"when_to_set_to_true":"Set to true if the patient has undergone a plain chest x-ray now.","when_to_set_to_false":"Set to false if the patient has not undergone a plain chest x-ray now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a plain chest x-ray now.","meaning":"Boolean indicating whether the patient has undergone a plain chest x-ray now."}
(declare-const patient_has_undergone_plain_chest_x_ray_now@@consistent_with_edema Bool) ;; "chest radiograph consistent with edema" {"when_to_set_to_true":"Set to true if the patient's plain chest x-ray is consistent with edema.","when_to_set_to_false":"Set to false if the patient's plain chest x-ray is not consistent with edema.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's plain chest x-ray is consistent with edema.","meaning":"Boolean indicating whether the patient's plain chest x-ray is consistent with edema."}

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable for bilateral pulmonary infiltrates implies the stem variable
(assert
  (! (=> patient_has_finding_of_radiologic_infiltrate_of_lung_now@@bilateral
         patient_has_finding_of_radiologic_infiltrate_of_lung_now)
     :named REQ2_AUXILIARY0)) ;; "bilateral pulmonary infiltrates" implies "pulmonary infiltrates"

;; Qualifier variable for chest x-ray consistent with edema implies the patient had a chest x-ray
(assert
  (! (=> patient_has_undergone_plain_chest_x_ray_now@@consistent_with_edema
         patient_has_undergone_plain_chest_x_ray_now)
     :named REQ2_AUXILIARY1)) ;; "chest radiograph consistent with edema" implies "chest radiograph"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: To be included, the patient must have (bilateral pulmonary infiltrates) OR (a chest radiograph consistent with edema).
(assert
  (! (or patient_has_finding_of_radiologic_infiltrate_of_lung_now@@bilateral
         patient_has_undergone_plain_chest_x_ray_now@@consistent_with_edema)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (bilateral pulmonary infiltrates) OR (a chest radiograph consistent with edema)."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_clinical_evidence_of_left_atrial_hypertension_now Bool) ;; "clinical evidence of left atrial hypertension" {"when_to_set_to_true":"Set to true if the patient currently has clinical evidence of left atrial hypertension.","when_to_set_to_false":"Set to false if the patient currently does not have clinical evidence of left atrial hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has clinical evidence of left atrial hypertension.","meaning":"Boolean indicating whether the patient currently has clinical evidence of left atrial hypertension."}

;; ===================== Constraint Assertions (REQ 3) =====================
;; The patient must NOT have clinical evidence of left atrial hypertension.
(assert
  (! (not patient_has_clinical_evidence_of_left_atrial_hypertension_now)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS))

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_requires_positive_pressure_ventilation_now Bool) ;; "To be included, the patient must require positive pressure ventilation." {"when_to_set_to_true":"Set to true if the patient currently requires positive pressure ventilation.","when_to_set_to_false":"Set to false if the patient currently does not require positive pressure ventilation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently requires positive pressure ventilation.","meaning":"Boolean indicating whether the patient currently requires positive pressure ventilation."}

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! patient_requires_positive_pressure_ventilation_now
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must require positive pressure ventilation."
