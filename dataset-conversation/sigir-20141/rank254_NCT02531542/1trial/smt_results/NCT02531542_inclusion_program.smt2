;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_undergone_emergency_room_admission_now Bool) ;; "admitted to the emergency department" {"when_to_set_to_true":"Set to true if the patient has currently undergone admission to the emergency department.","when_to_set_to_false":"Set to false if the patient has not currently undergone admission to the emergency department.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has currently undergone admission to the emergency department.","meaning":"Boolean indicating whether the patient has currently undergone admission to the emergency department."}

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_undergone_emergency_room_admission_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have been admitted to the emergency department."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; "aged ≥ 75 years" {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 75.0)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 75 years."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_dyspnea_now Bool) ;; "dyspnoea" {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of dyspnoea.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of dyspnoea.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has dyspnoea.","meaning":"Boolean indicating whether the patient currently has dyspnoea."}
(declare-const patient_respiratory_rate_value_recorded_now_withunit_cycles_per_minute Real) ;; "breathe rate" {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's respiratory rate in cycles per minute recorded now is available.","when_to_set_to_null":"Set to null if no such measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current respiratory rate in cycles per minute."}
(declare-const patient_partial_pressure_of_oxygen_value_recorded_now_withunit_millimeters_of_mercury Real) ;; "partial pressure of oxygen" {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's partial pressure of oxygen in millimeters of mercury recorded now is available.","when_to_set_to_null":"Set to null if no such measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current partial pressure of oxygen in millimeters of mercury."}
(declare-const patient_peripheral_oxygen_saturation_value_recorded_now_withunit_percent Real) ;; "peripheral capillary oxygen saturation" {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's peripheral capillary oxygen saturation in percent recorded now is available.","when_to_set_to_null":"Set to null if no such measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current peripheral capillary oxygen saturation in percent."}
(declare-const patient_peripheral_oxygen_saturation_value_recorded_now_withunit_percent@@measured_in_room_air Bool) ;; "peripheral capillary oxygen saturation measured in room air" {"when_to_set_to_true":"Set to true if the measurement of peripheral capillary oxygen saturation was performed in room air.","when_to_set_to_false":"Set to false if the measurement was not performed in room air.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the measurement was performed in room air.","meaning":"Boolean indicating whether the peripheral capillary oxygen saturation measurement was performed in room air."}
(declare-const patient_partial_pressure_of_carbon_dioxide_value_recorded_now_withunit_millimeters_of_mercury Real) ;; "partial pressure of carbon dioxide" {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's partial pressure of carbon dioxide in millimeters of mercury recorded now is available.","when_to_set_to_null":"Set to null if no such measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current partial pressure of carbon dioxide in millimeters of mercury."}
(declare-const patient_blood_ph_value_recorded_now Real) ;; "blood pH" {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's blood pH recorded now is available.","when_to_set_to_null":"Set to null if no such measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current blood pH."}

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Definition of acute dyspnoea per requirement
(assert
  (! (= patient_has_finding_of_dyspnea_now
        (or
          (>= patient_respiratory_rate_value_recorded_now_withunit_cycles_per_minute 25.0) ;; "breathe rate ≥ 25 cycles per minute"
          (<= patient_partial_pressure_of_oxygen_value_recorded_now_withunit_millimeters_of_mercury 70.0) ;; "partial pressure of oxygen ≤ 70 millimeters of mercury"
          (and
            (<= patient_peripheral_oxygen_saturation_value_recorded_now_withunit_percent 92.0) ;; "peripheral capillary oxygen saturation ≤ 92 percent"
            patient_peripheral_oxygen_saturation_value_recorded_now_withunit_percent@@measured_in_room_air) ;; "in room air"
          (and
            (>= patient_partial_pressure_of_carbon_dioxide_value_recorded_now_withunit_millimeters_of_mercury 45.0) ;; "partial pressure of carbon dioxide ≥ 45 millimeters of mercury"
            (<= patient_blood_ph_value_recorded_now 7.35)) ;; "blood pH ≤ 7.35"
        ))
     :named REQ2_AUXILIARY0)) ;; "acute dyspnoea (defined as ...)"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_finding_of_dyspnea_now
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must meet criteria of acute dyspnoea (defined as ...)"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_finding_of_sinus_rhythm_now Bool) ;; "sinus rhythm at admission" {"when_to_set_to_true":"Set to true if the patient has a finding of sinus rhythm at the time of admission.","when_to_set_to_false":"Set to false if the patient does not have a finding of sinus rhythm at the time of admission.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a finding of sinus rhythm at the time of admission.","meaning":"Boolean indicating whether the patient has a finding of sinus rhythm at the time of admission."}
(declare-const patient_has_undergone_electrocardiographic_procedure_now Bool) ;; "electrocardiogram at admission" {"when_to_set_to_true":"Set to true if the patient has undergone an electrocardiographic procedure (electrocardiogram) at the time of admission.","when_to_set_to_false":"Set to false if the patient has not undergone an electrocardiographic procedure (electrocardiogram) at the time of admission.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone an electrocardiographic procedure (electrocardiogram) at the time of admission.","meaning":"Boolean indicating whether the patient has undergone an electrocardiographic procedure (electrocardiogram) at the time of admission."}

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: "To be included, the patient must have an electrocardiogram showing sinus rhythm at admission."
(assert
  (! (and patient_has_undergone_electrocardiographic_procedure_now
          patient_has_finding_of_sinus_rhythm_now)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have an electrocardiogram showing sinus rhythm at admission."
