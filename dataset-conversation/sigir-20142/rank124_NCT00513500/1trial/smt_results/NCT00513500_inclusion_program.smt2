;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_months Real) ;; {"when_to_set_to_value":"Set to the patient's current age in months if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in months is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in months."} // "aged ≥ 6 months AND aged ≤ 5 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_months 6.0)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 6 months."

(assert
  (! (<= patient_age_value_recorded_now_in_months 60.0)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≤ 5 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_fever_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of fever.","when_to_set_to_false":"Set to false if the patient does not have a documented history of fever.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of fever.","meaning":"Boolean indicating whether the patient has a history of fever."} // "present with history of fever"
(declare-const patient_has_finding_of_fever_inthehistory@@identified_by_report Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of fever is identified by report (e.g., self-report or caregiver report).","when_to_set_to_false":"Set to false if the patient's history of fever is not identified by report.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the history of fever is identified by report.","meaning":"Boolean indicating whether the patient's history of fever is identified by report."} // "present with reported fever"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies the stem variable (if history of fever is identified by report, then history of fever is present)
(assert
  (! (=> patient_has_finding_of_fever_inthehistory@@identified_by_report
         patient_has_finding_of_fever_inthehistory)
     :named REQ1_AUXILIARY0)) ;; "present with reported fever" implies "present with history of fever"

;; ===================== Constraint Assertions (REQ 1) =====================
;; The patient must present with history of fever OR present with reported fever
(assert
  (! (or patient_has_finding_of_fever_inthehistory
         patient_has_finding_of_fever_inthehistory@@identified_by_report)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "present with history of fever OR present with reported fever"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_cough_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently presents with cough.","when_to_set_to_false":"Set to false if the patient currently does not present with cough.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently presents with cough.","meaning":"Boolean indicating whether the patient currently presents with cough."} // "present with cough"
(declare-const patient_has_finding_of_difficulty_breathing_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently presents with difficult breathing.","when_to_set_to_false":"Set to false if the patient currently does not present with difficult breathing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently presents with difficult breathing.","meaning":"Boolean indicating whether the patient currently presents with difficult breathing."} // "present with difficult breathing"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: To be included, the patient must (present with cough OR present with difficult breathing).
(assert
  (! (or patient_has_finding_of_cough_now
         patient_has_finding_of_difficulty_breathing_now)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must (present with cough OR present with difficult breathing)."
