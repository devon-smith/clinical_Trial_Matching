;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged ≥ 18 years AND aged ≤ 89 years"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: To be included, the patient must be aged ≥ 18 years.
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be aged ≥ 18 years."

;; Component 1: To be included, the patient must be aged ≤ 89 years.
(assert
  (! (<= patient_age_value_recorded_now_in_years 89)
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be aged ≤ 89 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_dyspnea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently presents to the emergency department with a chief complaint of shortness of breath (dyspnea).","when_to_set_to_false":"Set to false if the patient currently does not present to the emergency department with a chief complaint of shortness of breath (dyspnea).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently presents to the emergency department with a chief complaint of shortness of breath (dyspnea).","meaning":"Boolean indicating whether the patient currently presents to the emergency department with a chief complaint of shortness of breath (dyspnea)." } ;; "shortness of breath OR dyspnea as chief complaint at ED presentation"
(declare-const patient_has_finding_of_dyspnea_now@@chief_complaint_at_emergency_department_presentation Bool) ;; {"when_to_set_to_true":"Set to true if the patient’s dyspnea (shortness of breath) is documented as the chief complaint at emergency department presentation.","when_to_set_to_false":"Set to false if the patient’s dyspnea (shortness of breath) is not the chief complaint at emergency department presentation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether dyspnea (shortness of breath) is the chief complaint at emergency department presentation.","meaning":"Boolean indicating whether the patient’s dyspnea (shortness of breath) is the chief complaint at emergency department presentation."} ;; "chief complaint of shortness of breath OR chief complaint of dyspnea at ED presentation"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies the stem variable
(assert
  (! (=> patient_has_finding_of_dyspnea_now@@chief_complaint_at_emergency_department_presentation
         patient_has_finding_of_dyspnea_now)
     :named REQ1_AUXILIARY0)) ;; "chief complaint of dyspnea at ED presentation" implies "dyspnea at ED presentation"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must present to the emergency department with (a chief complaint of shortness of breath OR a chief complaint of dyspnea).
(assert
  (! patient_has_finding_of_dyspnea_now@@chief_complaint_at_emergency_department_presentation
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "chief complaint of shortness of breath OR chief complaint of dyspnea at ED presentation" is required for inclusion
