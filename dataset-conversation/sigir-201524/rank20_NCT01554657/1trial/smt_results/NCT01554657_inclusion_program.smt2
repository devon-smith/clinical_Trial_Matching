;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of pneumonia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of pneumonia."}  ;; "To be included, the patient must have a new diagnosis of pneumonia."
(declare-const patient_has_diagnosis_of_pneumonia_now@@newly_diagnosed Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of pneumonia is newly established (i.e., recent or first-time diagnosis).","when_to_set_to_false":"Set to false if the patient's current diagnosis of pneumonia is not newly established (i.e., it is a chronic or longstanding diagnosis).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of pneumonia is newly established.","meaning":"Boolean indicating whether the patient's current diagnosis of pneumonia is newly established (recent or first-time)."}  ;; "To be included, the patient must have a new diagnosis of pneumonia."

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies the stem variable
(assert
  (! (=> patient_has_diagnosis_of_pneumonia_now@@newly_diagnosed
         patient_has_diagnosis_of_pneumonia_now)
     :named REQ0_AUXILIARY0)) ;; "To be included, the patient must have a new diagnosis of pneumonia."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_diagnosis_of_pneumonia_now@@newly_diagnosed
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have a new diagnosis of pneumonia."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_is_in_medical_intensive_care_unit_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently in a medical intensive care unit.","when_to_set_to_false":"Set to false if the patient is currently not in a medical intensive care unit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently in a medical intensive care unit.","meaning":"Boolean indicating whether the patient is currently in a medical intensive care unit."} ;; "To be included, the patient must be in a medical intensive care unit..."
(declare-const patient_is_in_surgical_intensive_care_unit_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently in a surgical intensive care unit.","when_to_set_to_false":"Set to false if the patient is currently not in a surgical intensive care unit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently in a surgical intensive care unit.","meaning":"Boolean indicating whether the patient is currently in a surgical intensive care unit."} ;; "To be included, the patient must be ... in a surgical intensive care unit."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (or patient_is_in_medical_intensive_care_unit_now
         patient_is_in_surgical_intensive_care_unit_now)
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be (in a medical intensive care unit OR in a surgical intensive care unit)."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "To be included, the patient must be aged greater than or equal to 18 years old."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged greater than or equal to 18 years old."
