;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "aged less than eighteen years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (< patient_age_value_recorded_now_in_years 18))
    :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is aged less than eighteen years."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_dead_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever died (i.e., death occurred) at any point in their history.","when_to_set_to_false":"Set to false if the patient has never died (i.e., is alive) at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever died.","meaning":"Boolean indicating whether the patient has ever died (death occurred) at any point in their history."} ;; "died"

(declare-const patient_has_finding_of_dead_inthehistory@@temporalcontext_within_24_hours_after_hospital_admission Bool) ;; {"when_to_set_to_true":"Set to true if the patient's death occurred within twenty-four hours after hospital admission.","when_to_set_to_false":"Set to false if the patient's death did not occur within twenty-four hours after hospital admission.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's death occurred within twenty-four hours after hospital admission.","meaning":"Boolean indicating whether the patient's death occurred within twenty-four hours after hospital admission."} ;; "died within twenty-four hours after hospital admission"

(declare-const time_from_hospital_admission_to_death_in_hours Real) ;; {"when_to_set_to_value":"Set to the number of hours elapsed from the patient's hospital admission to the time of death, if both times are known.","when_to_set_to_null":"Set to null if either the time of hospital admission or the time of death is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the elapsed time in hours from hospital admission to death."} ;; "within twenty-four hours after hospital admission"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies stem variable
(assert
(! (=> patient_has_finding_of_dead_inthehistory@@temporalcontext_within_24_hours_after_hospital_admission
      patient_has_finding_of_dead_inthehistory)
:named REQ1_AUXILIARY0)) ;; "died within twenty-four hours after hospital admission" implies "died"

;; Definition: death within 24 hours after hospital admission
(assert
(! (= patient_has_finding_of_dead_inthehistory@@temporalcontext_within_24_hours_after_hospital_admission
      (and patient_has_finding_of_dead_inthehistory
           (<= time_from_hospital_admission_to_death_in_hours 24)))
:named REQ1_AUXILIARY1)) ;; "death occurred within twenty-four hours after hospital admission" = "died" AND "time from hospital admission to death ≤ 24 hours"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_dead_inthehistory@@temporalcontext_within_24_hours_after_hospital_admission)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient died within twenty-four hours after hospital admission."
