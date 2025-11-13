;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_has_undergone_emergency_room_admission_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone an emergency department admission.","when_to_set_to_false":"Set to false if the patient has never undergone an emergency department admission.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone an emergency department admission.","meaning":"Boolean indicating whether the patient has ever undergone an emergency department admission."}  ;; "emergency department admission"
(declare-const patient_has_undergone_emergency_room_admission_inthehistory@@admission_for_critical_illness_or_major_trauma Bool) ;; {"when_to_set_to_true":"Set to true if the emergency department admission was for critical illness or major trauma.","when_to_set_to_false":"Set to false if the emergency department admission was not for critical illness or major trauma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the emergency department admission was for critical illness or major trauma.","meaning":"Boolean indicating whether the emergency department admission was for critical illness or major trauma."}  ;; "emergency department admission for (critical illness OR major trauma)"
(declare-const patient_has_undergone_admission_to_intensive_care_unit_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone an intensive care unit admission.","when_to_set_to_false":"Set to false if the patient has never undergone an intensive care unit admission.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone an intensive care unit admission.","meaning":"Boolean indicating whether the patient has ever undergone an intensive care unit admission."}  ;; "intensive care unit admission"
(declare-const patient_has_undergone_admission_to_intensive_care_unit_inthehistory@@admission_for_critical_illness_or_major_trauma Bool) ;; {"when_to_set_to_true":"Set to true if the intensive care unit admission was for critical illness or major trauma.","when_to_set_to_false":"Set to false if the intensive care unit admission was not for critical illness or major trauma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the intensive care unit admission was for critical illness or major trauma.","meaning":"Boolean indicating whether the intensive care unit admission was for critical illness or major trauma."}  ;; "intensive care unit admission for (critical illness OR major trauma)"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable for emergency department admission implies the stem variable
(assert
  (! (=> patient_has_undergone_emergency_room_admission_inthehistory@@admission_for_critical_illness_or_major_trauma
         patient_has_undergone_emergency_room_admission_inthehistory)
     :named REQ0_AUXILIARY0)) ;; "emergency department admission for (critical illness OR major trauma)" implies "emergency department admission"

;; Qualifier variable for intensive care unit admission implies the stem variable
(assert
  (! (=> patient_has_undergone_admission_to_intensive_care_unit_inthehistory@@admission_for_critical_illness_or_major_trauma
         patient_has_undergone_admission_to_intensive_care_unit_inthehistory)
     :named REQ0_AUXILIARY1)) ;; "intensive care unit admission for (critical illness OR major trauma)" implies "intensive care unit admission"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: Emergency department admission for (critical illness OR major trauma)
(assert
  (! patient_has_undergone_emergency_room_admission_inthehistory@@admission_for_critical_illness_or_major_trauma
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have emergency department admission for (critical illness OR major trauma)."

;; Component 1: Intensive care unit admission for (critical illness OR major trauma)
(assert
  (! patient_has_undergone_admission_to_intensive_care_unit_inthehistory@@admission_for_critical_illness_or_major_trauma
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have intensive care unit admission for (critical illness OR major trauma)."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "age > 18 years"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must be (age > 18 years).
(assert
  (! (> patient_age_value_recorded_now_in_years 18)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be (age > 18 years)."
