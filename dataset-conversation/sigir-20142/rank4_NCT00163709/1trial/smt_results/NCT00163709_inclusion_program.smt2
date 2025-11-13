;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_presents_to_emergency_department_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently presenting to the emergency department.","when_to_set_to_false":"Set to false if the patient is not currently presenting to the emergency department.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently presenting to the emergency department.","meaning":"Boolean indicating whether the patient is currently presenting to the emergency department."} ;; "To be included, the patient must present to the emergency department."
(declare-const patient_has_finding_of_dyspnea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of dyspnea (shortness of breath) at the time of presentation to the emergency department.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of dyspnea (shortness of breath) at the time of presentation to the emergency department.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has dyspnea (shortness of breath) at the time of presentation to the emergency department.","meaning":"Boolean indicating whether the patient currently has dyspnea (shortness of breath) at the time of presentation to the emergency department."} ;; "To be included, the patient must have shortness of breath."
(declare-const patient_has_finding_of_dyspnea_now@@at_time_of_presentation_to_emergency_department Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has dyspnea (shortness of breath) at the time of presentation to the emergency department.","when_to_set_to_false":"Set to false if the patient currently does not have dyspnea (shortness of breath) at the time of presentation to the emergency department.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has dyspnea (shortness of breath) at the time of presentation to the emergency department.","meaning":"Boolean indicating whether the patient currently has dyspnea (shortness of breath) at the time of presentation to the emergency department."} ;; "To be included, the patient must have shortness of breath at the time of presentation to the emergency department."

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_dyspnea_now@@at_time_of_presentation_to_emergency_department
         patient_has_finding_of_dyspnea_now)
     :named REQ0_AUXILIARY0)) ;; "patient_has_finding_of_dyspnea_now@@at_time_of_presentation_to_emergency_department implies patient_has_finding_of_dyspnea_now"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: Patient must present to the emergency department
(assert
  (! patient_presents_to_emergency_department_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must present to the emergency department."

;; Component 1: Patient must have shortness of breath at the time of presentation to the emergency department
(assert
  (! patient_has_finding_of_dyspnea_now@@at_time_of_presentation_to_emergency_department
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have shortness of breath at the time of presentation to the emergency department."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "To be included, the patient must be (age > 40 years)."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (> patient_age_value_recorded_now_in_years 40)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be (age > 40 years)."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const emergency_department_triage_category_value_recorded_now_withunit_integer Real) ;; {"when_to_set_to_value":"Set to the integer value of the patient's emergency department triage category as recorded at the current time.","when_to_set_to_null":"Set to null if the emergency department triage category is unknown, not documented, or cannot be determined for the patient at the current time.","meaning":"Numeric value representing the patient's emergency department triage category as recorded now, in integer units."} ;; "To be included, the patient must present with an emergency department triage category of 3 or higher."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (>= emergency_department_triage_category_value_recorded_now_withunit_integer 3)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must present with an emergency department triage category of 3 or higher."
