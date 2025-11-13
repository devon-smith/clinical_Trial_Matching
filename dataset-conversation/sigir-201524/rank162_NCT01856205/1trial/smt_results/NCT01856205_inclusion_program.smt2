;; ===================== Declarations for the inclusion criteria (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "child aged between 1 and 14 years"
(declare-const patient_has_diagnosis_of_encephalitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical diagnosis of encephalitis.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical diagnosis of encephalitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical diagnosis of encephalitis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of encephalitis."} // "clinically diagnosed encephalitis"
(declare-const patient_has_finding_of_fever_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of fever.","when_to_set_to_false":"Set to false if the patient does not have a documented history of fever.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of fever.","meaning":"Boolean indicating whether the patient has a history of fever."} // "history of fever"
(declare-const patient_fever_duration_value_in_days_in_the_history Real) ;; {"when_to_set_to_value":"Set to the number of days if the duration of the patient's fever in the history is known and documented.","when_to_set_to_null":"Set to null if the duration of the patient's fever in the history is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the duration in days of the patient's fever as reported in the history."} // "fever lasting less than 14 days"
(declare-const patient_has_finding_of_altered_consciousness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has altered consciousness.","when_to_set_to_false":"Set to false if the patient currently does not have altered consciousness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has altered consciousness.","meaning":"Boolean indicating whether the patient currently has altered consciousness."} // "altered consciousness"
(declare-const patient_has_finding_of_seizure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of seizures.","when_to_set_to_false":"Set to false if the patient does not have a documented history of seizures.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of seizures.","meaning":"Boolean indicating whether the patient has a history of seizures."} // "history of new onset seizures"
(declare-const patient_cell_count_cerebrospinal_fluid_value_recorded_now_withunit_cells_per_mm3 Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of CSF white cell count (cells/mm3) recorded now is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current CSF white cell count in cells per mm3."} // "cerebrospinal fluid white cell count less than 1000 cells/mm3"
(declare-const patient_has_no_organisms_detected_on_gram_stain_now Bool) ;; {"when_to_set_to_true":"Set to true if no organisms are detected on Gram stain of the patient's sample at the current time.","when_to_set_to_false":"Set to false if any organisms are detected on Gram stain of the patient's sample at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether organisms are detected on Gram stain of the patient's sample at the current time.","meaning":"Boolean indicating whether no organisms are detected on Gram stain of the patient's sample at the current time."} // "no organisms on Gram stain"
(declare-const patient_has_undergone_gram_stain_method_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone Gram stain method now.","when_to_set_to_false":"Set to false if the patient has not undergone Gram stain method now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone Gram stain method now.","meaning":"Boolean indicating whether the patient has undergone Gram stain method now."} // "Gram stain"
(declare-const patient_glucose_csf_glucose_plasma_ratio_measurement_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of CSF to plasma glucose ratio (%) recorded now is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current CSF to plasma glucose ratio in percent."} // "cerebrospinal fluid to plasma glucose ratio greater than 40%"
(declare-const patient_has_been_admitted_to_kanti_childrens_hospital_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been admitted to Kanti Children's Hospital at the current time.","when_to_set_to_false":"Set to false if the patient has not been admitted to Kanti Children's Hospital at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been admitted to Kanti Children's Hospital at the current time.","meaning":"Boolean indicating whether the patient has been admitted to Kanti Children's Hospital at the current time."} // "admitted to Kanti Children's Hospital"
(declare-const patient_has_been_admitted_to_bp_koirala_institute_of_health_sciences_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been admitted to BP Koirala Institute of Health Sciences at the current time.","when_to_set_to_false":"Set to false if the patient has not been admitted to BP Koirala Institute of Health Sciences at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been admitted to BP Koirala Institute of Health Sciences at the current time.","meaning":"Boolean indicating whether the patient has been admitted to BP Koirala Institute of Health Sciences at the current time."} // "admitted to BP Koirala Institute of Health Sciences, Nepal"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (and (>= patient_age_value_recorded_now_in_years 1.0)
          (<= patient_age_value_recorded_now_in_years 14.0))
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "child aged between 1 and 14 years"

(assert
  (! (and patient_has_diagnosis_of_encephalitis_now
          patient_has_finding_of_fever_inthehistory
          (< patient_fever_duration_value_in_days_in_the_history 14.0))
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "clinically diagnosed encephalitis based on a history of fever lasting less than 14 days"

(assert
  (! (and patient_has_finding_of_altered_consciousness_now
          (or (not patient_has_finding_of_seizure_inthehistory)
              patient_has_finding_of_seizure_inthehistory))
     :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "altered consciousness with or without a history of new onset seizures"

(assert
  (! (< patient_cell_count_cerebrospinal_fluid_value_recorded_now_withunit_cells_per_mm3 1000.0)
     :named REQ0_COMPONENT3_OTHER_REQUIREMENTS)) ;; "cerebrospinal fluid white cell count less than 1000 cells/mm3"

(assert
  (! (and patient_has_undergone_gram_stain_method_now
          patient_has_no_organisms_detected_on_gram_stain_now)
     :named REQ0_COMPONENT4_OTHER_REQUIREMENTS)) ;; "no organisms on Gram stain"

(assert
  (! (> patient_glucose_csf_glucose_plasma_ratio_measurement_value_recorded_now_withunit_percent 40.0)
     :named REQ0_COMPONENT5_OTHER_REQUIREMENTS)) ;; "cerebrospinal fluid to plasma glucose ratio greater than 40%"

(assert
  (! (or patient_has_been_admitted_to_kanti_childrens_hospital_now
         patient_has_been_admitted_to_bp_koirala_institute_of_health_sciences_now)
     :named REQ0_COMPONENT6_OTHER_REQUIREMENTS)) ;; "admitted to Kanti Children's Hospital or BP Koirala Institute of Health Sciences, Nepal"
