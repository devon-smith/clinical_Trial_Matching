;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_feeding_tube_decision_made_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if a feeding tube decision has been made for the patient at any time prior to assessment.","when_to_set_to_false":"Set to false if a feeding tube decision has never been made for the patient prior to assessment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether a feeding tube decision has been made for the patient prior to assessment.","meaning":"Boolean indicating whether a feeding tube decision has been made for the patient at any time prior to assessment."} ;; "The patient is excluded if the patient has had a feeding tube decision made."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_feeding_tube_decision_made_in_the_history)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a feeding tube decision made."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_in_hospice_care_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently in hospice care at the time of assessment.","when_to_set_to_false":"Set to false if the patient is not currently in hospice care at the time of assessment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently in hospice care at the time of assessment.","meaning":"Boolean indicating whether the patient is currently in hospice care at the time of assessment."} ;; "The patient is excluded if the patient is in hospice care."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (not patient_is_in_hospice_care_now)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is in hospice care."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 Real) ;; {"when_to_set_to_value":"Set to the measured BMI value if a numeric measurement of the patient's body mass index (BMI) recorded now is available, in kg/m^2.","when_to_set_to_null":"Set to null if no such BMI measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current body mass index (BMI) in kg/m^2."} ;; "body mass index"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (> patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 26))
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "A patient is excluded if the patient has a body mass index greater than 26."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_developmental_delay_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has developmental delay.","when_to_set_to_false":"Set to false if the patient currently does not have developmental delay.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has developmental delay.","meaning":"Boolean indicating whether the patient currently has developmental delay."} ;; "developmental delay"

(declare-const patient_has_finding_of_psychotic_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a psychotic disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a psychotic disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a psychotic disorder.","meaning":"Boolean indicating whether the patient currently has a psychotic disorder."} ;; "psychosis"

(declare-const patient_has_finding_of_psychotic_disorder_now@@major Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current psychotic disorder is major in severity.","when_to_set_to_false":"Set to false if the patient's current psychotic disorder is not major in severity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current psychotic disorder is major in severity.","meaning":"Boolean indicating whether the patient's current psychotic disorder is major in severity."} ;; "major psychosis"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_psychotic_disorder_now@@major
       patient_has_finding_of_psychotic_disorder_now)
   :named REQ3_AUXILIARY0)) ;; "major psychosis" implies "psychotic disorder"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_psychotic_disorder_now@@major)
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has major psychosis."

(assert
(! (not patient_has_finding_of_developmental_delay_now)
   :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has developmental delay."
