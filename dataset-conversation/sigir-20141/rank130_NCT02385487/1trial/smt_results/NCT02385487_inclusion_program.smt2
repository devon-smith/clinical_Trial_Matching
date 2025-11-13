;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 21 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 21)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be aged ≥ 21 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_is_admitted_to_medical_intensive_care_unit_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently admitted to the medical intensive care unit.","when_to_set_to_false":"Set to false if the patient is currently not admitted to the medical intensive care unit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently admitted to the medical intensive care unit.","meaning":"Boolean indicating whether the patient is currently admitted to the medical intensive care unit."} // "admitted to the medical intensive care unit"
(declare-const patient_is_admitted_to_coronary_care_unit_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently admitted to the coronary care unit.","when_to_set_to_false":"Set to false if the patient is currently not admitted to the coronary care unit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently admitted to the coronary care unit.","meaning":"Boolean indicating whether the patient is currently admitted to the coronary care unit."} // "admitted to the coronary care unit"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (or patient_is_admitted_to_medical_intensive_care_unit_now
         patient_is_admitted_to_coronary_care_unit_now)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be (admitted to the medical intensive care unit) OR (admitted to the coronary care unit)."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_sepsis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has sepsis.","when_to_set_to_false":"Set to false if the patient currently does not have sepsis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has sepsis.","meaning":"Boolean indicating whether the patient currently has sepsis."} // "have sepsis"
(declare-const patient_has_finding_of_respiratory_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has respiratory failure.","when_to_set_to_false":"Set to false if the patient currently does not have respiratory failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has respiratory failure.","meaning":"Boolean indicating whether the patient currently has respiratory failure."} // "have respiratory failure"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (or patient_has_finding_of_sepsis_now
         patient_has_finding_of_respiratory_failure_now)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must (have sepsis) OR (have respiratory failure)."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_undergone_troponin_measurement_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a troponin measurement at any time in their history.","when_to_set_to_false":"Set to false if the patient has never undergone a troponin measurement at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a troponin measurement.","meaning":"Boolean indicating whether the patient has ever undergone a troponin measurement at any time in their history."} // "troponin measurement"
(declare-const patient_has_undergone_troponin_measurement_inthehistory@@clinically_indicated Bool) ;; {"when_to_set_to_true":"Set to true if the troponin measurement was clinically indicated.","when_to_set_to_false":"Set to false if the troponin measurement was not clinically indicated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the troponin measurement was clinically indicated.","meaning":"Boolean indicating whether the troponin measurement was clinically indicated."} // "clinically indicated troponin measurement"
(declare-const patient_has_undergone_troponin_measurement_inthehistory@@temporalcontext_within_24_hours_of_intensive_care_unit_admission Bool) ;; {"when_to_set_to_true":"Set to true if the troponin measurement occurred within 24 hours of intensive care unit admission.","when_to_set_to_false":"Set to false if the troponin measurement did not occur within 24 hours of intensive care unit admission.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the troponin measurement occurred within 24 hours of intensive care unit admission.","meaning":"Boolean indicating whether the troponin measurement occurred within 24 hours of intensive care unit admission."} // "within 24 hours of intensive care unit admission"
(declare-const patient_has_undergone_troponin_measurement_inthehistory@@clinically_indicated@@temporalcontext_within_24_hours_of_intensive_care_unit_admission Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a clinically indicated troponin measurement that occurred within 24 hours of intensive care unit admission.","when_to_set_to_false":"Set to false if the patient has never undergone a clinically indicated troponin measurement within 24 hours of intensive care unit admission.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a clinically indicated troponin measurement within 24 hours of intensive care unit admission.","meaning":"Boolean indicating whether the patient has ever undergone a clinically indicated troponin measurement within 24 hours of intensive care unit admission."} // "clinically indicated troponin measurement within 24 hours of intensive care unit admission"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_undergone_troponin_measurement_inthehistory@@clinically_indicated
         patient_has_undergone_troponin_measurement_inthehistory)
     :named REQ3_AUXILIARY0)) ;; "clinically indicated troponin measurement" implies "troponin measurement"

;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_undergone_troponin_measurement_inthehistory@@temporalcontext_within_24_hours_of_intensive_care_unit_admission
         patient_has_undergone_troponin_measurement_inthehistory)
     :named REQ3_AUXILIARY1)) ;; "troponin measurement within 24 hours of ICU admission" implies "troponin measurement"

;; Both qualifiers together imply both single qualifiers
(assert
  (! (=> patient_has_undergone_troponin_measurement_inthehistory@@clinically_indicated@@temporalcontext_within_24_hours_of_intensive_care_unit_admission
         (and patient_has_undergone_troponin_measurement_inthehistory@@clinically_indicated
              patient_has_undergone_troponin_measurement_inthehistory@@temporalcontext_within_24_hours_of_intensive_care_unit_admission))
     :named REQ3_AUXILIARY2)) ;; "clinically indicated troponin measurement within 24 hours of ICU admission" implies both single qualifiers

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_has_undergone_troponin_measurement_inthehistory@@clinically_indicated@@temporalcontext_within_24_hours_of_intensive_care_unit_admission
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have had a clinically indicated troponin measurement within 24 hours of intensive care unit admission."
