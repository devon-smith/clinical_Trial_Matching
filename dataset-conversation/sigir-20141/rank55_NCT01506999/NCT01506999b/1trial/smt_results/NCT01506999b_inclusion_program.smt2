;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_acute_coronary_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of acute coronary syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of acute coronary syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of acute coronary syndrome.","meaning":"Boolean indicating whether the patient currently has acute coronary syndrome."}  ;; "acute coronary syndrome"
(declare-const patient_has_finding_of_acute_coronary_syndrome_now@@is_first_manifestation_of_coronary_disease Bool) ;; {"when_to_set_to_true":"Set to true if the patient's acute coronary syndrome is the first manifestation of coronary disease.","when_to_set_to_false":"Set to false if the patient's acute coronary syndrome is not the first manifestation of coronary disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether acute coronary syndrome is the first manifestation of coronary disease.","meaning":"Boolean indicating whether the patient's acute coronary syndrome is the first manifestation of coronary disease."}  ;; "acute coronary syndrome as the first manifestation of coronary disease"
(declare-const patient_admitted_to_coronary_care_unit_time_from_symptom_onset_in_hours Real) ;; {"when_to_set_to_value":"Set to the number of hours between the onset of symptoms and the patient's admission to the coronary care unit.","when_to_set_to_null":"Set to null if the time from symptom onset to coronary care unit admission is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the time in hours from symptom onset to admission to the coronary care unit."}  ;; "admitted to the coronary care unit within 6 hours from the onset of symptoms"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies the stem variable
(assert
  (! (=> patient_has_finding_of_acute_coronary_syndrome_now@@is_first_manifestation_of_coronary_disease
         patient_has_finding_of_acute_coronary_syndrome_now)
     :named REQ0_AUXILIARY0)) ;; "acute coronary syndrome as the first manifestation of coronary disease"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: Patient must have acute coronary syndrome as the first manifestation of coronary disease
(assert
  (! patient_has_finding_of_acute_coronary_syndrome_now@@is_first_manifestation_of_coronary_disease
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "have acute coronary syndrome as the first manifestation of coronary disease"

;; Component 1: Patient must be admitted to the coronary care unit within 6 hours from the onset of symptoms
(assert
  (! (<= patient_admitted_to_coronary_care_unit_time_from_symptom_onset_in_hours 6.0)
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "be admitted to the coronary care unit within 6 hours from the onset of symptoms"
