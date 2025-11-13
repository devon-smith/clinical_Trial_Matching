;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_antibiotic_therapy_value_recorded_now_withunit_hours Real) ;; {"when_to_set_to_value":"Set to the total number of hours of antibiotic therapy received by the patient up to now, if known.","when_to_set_to_null":"Set to null if the total duration of antibiotic therapy received by the patient up to now is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the total hours of antibiotic therapy received by the patient up to now."} ;; "antibiotic therapy"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (> patient_antibiotic_therapy_value_recorded_now_withunit_hours 12))
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received antibiotic therapy for greater than twelve hours."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_undergone_intubation_of_respiratory_tract_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone intubation of the respiratory tract.","when_to_set_to_false":"Set to false if the patient has never undergone intubation of the respiratory tract.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone intubation of the respiratory tract.","meaning":"Boolean indicating whether the patient has ever undergone intubation of the respiratory tract."} ;; "intubated"

(declare-const patient_has_undergone_intubation_of_respiratory_tract_inthehistory@@duration_greater_than_24_hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone intubation of the respiratory tract and the duration was greater than twenty-four hours.","when_to_set_to_false":"Set to false if the patient has undergone intubation of the respiratory tract and the duration was not greater than twenty-four hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the duration of intubation was greater than twenty-four hours.","meaning":"Boolean indicating whether the patient's intubation of the respiratory tract lasted greater than twenty-four hours."} ;; "has been intubated for greater than twenty-four hours"

(declare-const patient_intubation_duration_value_recorded_in_hours Real) ;; {"when_to_set_to_value":"Set to the number of hours the patient has been intubated, if known and documented.","when_to_set_to_null":"Set to null if the duration of intubation is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the duration in hours for which the patient has been intubated."} ;; "duration, in hours, for which the patient has been intubated"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Definition: duration > 24 hours implies the qualifier variable
(assert
(! (= patient_has_undergone_intubation_of_respiratory_tract_inthehistory@@duration_greater_than_24_hours
     (and patient_has_undergone_intubation_of_respiratory_tract_inthehistory
          (> patient_intubation_duration_value_recorded_in_hours 24)))
:named REQ1_AUXILIARY0)) ;; "has been intubated for greater than twenty-four hours"

;; Qualifier variable implies stem variable
(assert
(! (=> patient_has_undergone_intubation_of_respiratory_tract_inthehistory@@duration_greater_than_24_hours
       patient_has_undergone_intubation_of_respiratory_tract_inthehistory)
:named REQ1_AUXILIARY1)) ;; "duration_greater_than_24_hours" implies "intubated"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_undergone_intubation_of_respiratory_tract_inthehistory@@duration_greater_than_24_hours)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has been intubated for greater than twenty-four hours."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_unable_to_tolerate_non_bronchoscopic_bronchoalveolar_lavage_procedure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unable to tolerate a non-bronchoscopic bronchoalveolar lavage procedure.","when_to_set_to_false":"Set to false if the patient is currently able to tolerate a non-bronchoscopic bronchoalveolar lavage procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unable to tolerate a non-bronchoscopic bronchoalveolar lavage procedure.","meaning":"Boolean indicating whether the patient is currently unable to tolerate a non-bronchoscopic bronchoalveolar lavage procedure."} ;; "unable to tolerate non-bronchoscopic bronchoalveolar lavage procedure"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_is_unable_to_tolerate_non_bronchoscopic_bronchoalveolar_lavage_procedure_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is unable to tolerate non-bronchoscopic bronchoalveolar lavage procedure."
