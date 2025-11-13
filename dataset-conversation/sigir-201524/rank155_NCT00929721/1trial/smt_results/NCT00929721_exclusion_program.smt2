;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_been_hospitalized_at_any_inpatient_facility_duration_hours Real) ;; {"when_to_set_to_value":"Set to the total number of hours the patient has already been hospitalized at any other in-patient facility prior to transfer.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many hours the patient has already been hospitalized at any other in-patient facility prior to transfer.","meaning":"Numeric value indicating the total number of hours the patient has already been hospitalized at any other in-patient facility prior to transfer."} ;; "hospitalized for greater than or equal to forty-eight hours at any other in-patient facility"

(declare-const patient_is_transferred_to_study_healthcare_facility_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently being transferred to a study healthcare facility.","when_to_set_to_false":"Set to false if the patient is not currently being transferred to a study healthcare facility.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being transferred to a study healthcare facility.","meaning":"Boolean indicating whether the patient is currently being transferred to a study healthcare facility."} ;; "transferred to a study healthcare facility"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (and patient_is_transferred_to_study_healthcare_facility_now
             (>= patient_has_been_hospitalized_at_any_inpatient_facility_duration_hours 48)))
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is transferred to a study healthcare facility AND the patient has already been hospitalized for greater than or equal to forty-eight hours at any other in-patient facility with non-exhaustive examples (community hospital)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_hospital_acquired_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hospital acquired pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hospital acquired pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hospital acquired pneumonia.","meaning":"Boolean indicating whether the patient currently has hospital acquired pneumonia."} ;; "hospital acquired pneumonia"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Definition: hospital acquired pneumonia = develops signs and symptoms of pneumonia after being hospitalized for >= 48 hours
(assert
(! (= patient_has_finding_of_hospital_acquired_pneumonia_now
    (and
        (>= patient_has_been_hospitalized_at_any_inpatient_facility_duration_hours 48)
        ;; The requirement defines hospital acquired pneumonia as developing signs/symptoms after 48h, but only the duration is explicitly encoded here.
        ;; If a variable for "develops signs and symptoms of pneumonia" existed, it would be included here.
        ;; For now, the definition is based on the available variable for hospitalization duration.
    ))
:named REQ1_AUXILIARY0)) ;; "defined as develops signs and symptoms of pneumonia after being hospitalized for greater than or equal to forty-eight hours"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_hospital_acquired_pneumonia_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hospital acquired pneumonia (defined as develops signs and symptoms of pneumonia after being hospitalized for greater than or equal to forty-eight hours)."
