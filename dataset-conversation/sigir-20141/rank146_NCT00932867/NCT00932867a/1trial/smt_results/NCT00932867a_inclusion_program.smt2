;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "over 18 years of age"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (> patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be over 18 years of age."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_hypertensive_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented finding or diagnosis of arterial hypertension (hypertensive disorder).","when_to_set_to_false":"Set to false if the patient currently does not have a documented finding or diagnosis of arterial hypertension (hypertensive disorder).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has arterial hypertension.","meaning":"Boolean indicating whether the patient currently has a finding of hypertensive disorder (arterial hypertension)."} // "arterial hypertension"
(declare-const patient_systolic_blood_pressure_value_recorded_now_withunit_mmhg Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current systolic blood pressure in mmHg is available.","when_to_set_to_null":"Set to null if no current systolic blood pressure measurement in mmHg is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current systolic blood pressure in mmHg."} // "systolic blood pressure"
(declare-const patient_diastolic_blood_pressure_value_recorded_now_withunit_mmhg Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current diastolic blood pressure in mmHg is available.","when_to_set_to_null":"Set to null if no current diastolic blood pressure measurement in mmHg is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current diastolic blood pressure in mmHg."} // "diastolic blood pressure"

;; ===================== Constraint Assertions (REQ 1) =====================
;; The patient must have arterial hypertension (systolic blood pressure < 160 mmHg AND diastolic blood pressure < 100 mmHg)
(assert
  (! (and patient_has_finding_of_hypertensive_disorder_now
          (< patient_systolic_blood_pressure_value_recorded_now_withunit_mmhg 160.0)
          (< patient_diastolic_blood_pressure_value_recorded_now_withunit_mmhg 100.0))
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have arterial hypertension (systolic blood pressure < 160 mmHg AND diastolic blood pressure < 100 mmHg)."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_is_undergoing_angiotensin_converting_enzyme_inhibitor_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing angiotensin-converting enzyme inhibitor therapy.","when_to_set_to_false":"Set to false if the patient is currently not undergoing angiotensin-converting enzyme inhibitor therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing angiotensin-converting enzyme inhibitor therapy.","meaning":"Boolean indicating whether the patient is currently undergoing angiotensin-converting enzyme inhibitor therapy."} // "angiotensin-converting enzyme inhibitor treatment"
(declare-const patients_intolerance_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has intolerance to angiotensin-converting enzyme inhibitor therapy.","when_to_set_to_false":"Set to false if the patient currently does not have intolerance to angiotensin-converting enzyme inhibitor therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has intolerance to angiotensin-converting enzyme inhibitor therapy.","meaning":"Boolean indicating whether the patient currently has intolerance to angiotensin-converting enzyme inhibitor therapy."} // "intolerance"
(declare-const patients_intolerance_is_positive_now@@documented_in_official_ambulant_documentation Bool) ;; {"when_to_set_to_true":"Set to true if the patient's intolerance to angiotensin-converting enzyme inhibitor therapy is documented in the official ambulant documentation.","when_to_set_to_false":"Set to false if the patient's intolerance to angiotensin-converting enzyme inhibitor therapy is not documented in the official ambulant documentation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the intolerance is documented in the official ambulant documentation.","meaning":"Boolean indicating whether the patient's intolerance to angiotensin-converting enzyme inhibitor therapy is documented in the official ambulant documentation."} // "intolerance documented in the official ambulant documentation"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patients_intolerance_is_positive_now@@documented_in_official_ambulant_documentation
         patients_intolerance_is_positive_now)
     :named REQ2_AUXILIARY0)) ;; "intolerance documented in the official ambulant documentation" implies "intolerance"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: Must NOT tolerate ACE inhibitor treatment AND have this intolerance documented in the official ambulant documentation
(assert
  (! (and patients_intolerance_is_positive_now
          patients_intolerance_is_positive_now@@documented_in_official_ambulant_documentation)
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "NOT tolerate angiotensin-converting enzyme inhibitor treatment AND have this intolerance documented in the official ambulant documentation"
