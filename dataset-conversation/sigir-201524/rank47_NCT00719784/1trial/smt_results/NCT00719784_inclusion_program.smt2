;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged ≥ 21 years"
(declare-const patient_is_inpatient_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently admitted as an inpatient.","when_to_set_to_false":"Set to false if the patient is currently not admitted as an inpatient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently admitted as an inpatient.","meaning":"Boolean indicating whether the patient is currently admitted as an inpatient."}  ;; "be an inpatient"
(declare-const patient_is_outpatient_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently registered as an outpatient.","when_to_set_to_false":"Set to false if the patient is currently not registered as an outpatient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently registered as an outpatient.","meaning":"Boolean indicating whether the patient is currently registered as an outpatient."}  ;; "be an outpatient"
(declare-const patient_is_under_care_of_department_of_critical_care_medicine_between_2008_07_01_and_2009_05_31 Bool) ;; {"when_to_set_to_true":"Set to true if the patient was under the care of the Department of Critical Care Medicine at any time between 1 July 2008 and 31 May 2009.","when_to_set_to_false":"Set to false if the patient was not under the care of the Department of Critical Care Medicine at any time between 1 July 2008 and 31 May 2009.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was under the care of the Department of Critical Care Medicine between 1 July 2008 and 31 May 2009.","meaning":"Boolean indicating whether the patient was under the care of the Department of Critical Care Medicine between 1 July 2008 and 31 May 2009."}  ;; "be under the care of the Department of Critical Care Medicine BETWEEN 1 July 2008 and 31 May 2009"
(declare-const patient_is_under_care_of_department_of_respiratory_medicine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently under the care of the Department of Respiratory Medicine.","when_to_set_to_false":"Set to false if the patient is currently not under the care of the Department of Respiratory Medicine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently under the care of the Department of Respiratory Medicine.","meaning":"Boolean indicating whether the patient is currently under the care of the Department of Respiratory Medicine."}  ;; "be under the care of the Department of Respiratory Medicine"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: To be included, the patient must be aged ≥ 21 years.
(assert
  (! (>= patient_age_value_recorded_now_in_years 21.0)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "aged ≥ 21 years"

;; Component 1: To be included, the patient must be an inpatient OR be an outpatient.
(assert
  (! (or patient_is_inpatient_now patient_is_outpatient_now)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "be an inpatient OR be an outpatient"

;; Component 2: To be included, the patient must be under the care of the Department of Respiratory Medicine AND be under the care of the Department of Critical Care Medicine BETWEEN 1 July 2008 and 31 May 2009.
(assert
  (! (and patient_is_under_care_of_department_of_respiratory_medicine_now
          patient_is_under_care_of_department_of_critical_care_medicine_between_2008_07_01_and_2009_05_31)
     :named REQ0_COMPONENT2_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "be under the care of the Department of Respiratory Medicine AND be under the care of the Department of Critical Care Medicine BETWEEN 1 July 2008 and 31 May 2009"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_ability_to_provide_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the ability to provide informed consent.","when_to_set_to_false":"Set to false if the patient currently does not have the ability to provide informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the ability to provide informed consent.","meaning":"Boolean indicating whether the patient currently has the ability to provide informed consent."}  ;; "the patient must have the ability to provide informed consent."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_ability_to_provide_informed_consent_now
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must have the ability to provide informed consent."
