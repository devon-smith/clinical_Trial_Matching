;; ===================== Declarations for the inclusion criteria (REQ 0) =====================
(declare-const patient_is_outpatient_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently classified as an outpatient.","when_to_set_to_false":"Set to false if the patient is currently not classified as an outpatient (i.e., is an inpatient or other status).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently an outpatient.","meaning":"Boolean indicating whether the patient is currently an outpatient."} ;; "To be included, the patient must be an outpatient."
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "To be included, the patient must be aged ≥ 18 years."
(declare-const patient_has_diagnosis_of_stable_angina_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of clinically stable angina pectoris.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of clinically stable angina pectoris.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of clinically stable angina pectoris.","meaning":"Boolean indicating whether the patient currently has a diagnosis of clinically stable angina pectoris."} ;; "To be included, the patient must have a diagnosis of clinically stable angina pectoris."

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: Patient must be an outpatient
(assert
  (! patient_is_outpatient_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be an outpatient."

;; Component 1: Patient must be aged ≥ 18 years
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 18 years."

;; Component 2: Patient must have a diagnosis of clinically stable angina pectoris
(assert
  (! patient_has_diagnosis_of_stable_angina_now
     :named REQ0_COMPONENT2_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have a diagnosis of clinically stable angina pectoris."
