;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_is_in_intensive_care_unit_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently in the intensive care unit.","when_to_set_to_false":"Set to false if the patient is currently not in the intensive care unit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently in the intensive care unit.","meaning":"Boolean indicating whether the patient is currently in the intensive care unit."} // "a patient in the intensive care unit"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 18 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_is_in_intensive_care_unit_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be a patient in the intensive care unit."

(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 18 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_is_surgical_patient_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently classified as a surgical patient.","when_to_set_to_false":"Set to false if the patient is currently not classified as a surgical patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently classified as a surgical patient.","meaning":"Boolean indicating whether the patient is currently classified as a surgical patient."} // "a surgical patient"
(declare-const patient_is_medical_patient_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently classified as a medical patient.","when_to_set_to_false":"Set to false if the patient is currently not classified as a medical patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently classified as a medical patient.","meaning":"Boolean indicating whether the patient is currently classified as a medical patient."} // "a medical patient"
(declare-const patient_is_neurology_patient_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently classified as a neurology patient.","when_to_set_to_false":"Set to false if the patient is currently not classified as a neurology patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently classified as a neurology patient.","meaning":"Boolean indicating whether the patient is currently classified as a neurology patient."} // "a neurology patient"
(declare-const patient_is_neurosurgical_patient_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently classified as a neurosurgical patient.","when_to_set_to_false":"Set to false if the patient is currently not classified as a neurosurgical patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently classified as a neurosurgical patient.","meaning":"Boolean indicating whether the patient is currently classified as a neurosurgical patient."} // "a neurosurgical patient"
(declare-const patient_has_finding_of_traumatic_injury_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented finding or diagnosis of traumatic injury.","when_to_set_to_false":"Set to false if the patient currently does not have a documented finding or diagnosis of traumatic injury.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of traumatic injury.","meaning":"Boolean indicating whether the patient currently has a finding of traumatic injury."} // "a trauma patient"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must be (a surgical patient) OR (a medical patient) OR (a neurology patient) OR (a neurosurgical patient) OR (a trauma patient).
(assert
  (! (or patient_is_surgical_patient_now
         patient_is_medical_patient_now
         patient_is_neurology_patient_now
         patient_is_neurosurgical_patient_now
         patient_has_finding_of_traumatic_injury_now)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be (a surgical patient) OR (a medical patient) OR (a neurology patient) OR (a neurosurgical patient) OR (a trauma patient)."
