;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const hospital_inpatient_treatment_date_value_recorded_in_days_ago Real) ;; {"when_to_set_to_value":"Set to the number of days ago the patient's most recent hospital inpatient treatment occurred.","when_to_set_to_null":"Set to null if the date of the patient's most recent hospital inpatient treatment is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the number of days ago the patient's most recent hospital inpatient treatment occurred."} ;; "the number of days ago the patient's most recent hospital inpatient treatment occurred"
(declare-const patient_has_hospital_inpatient_treatment_within_last_28_days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had hospital inpatient treatment at any time within the last twenty-eight days.","when_to_set_to_false":"Set to false if the patient has not had hospital inpatient treatment within the last twenty-eight days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had hospital inpatient treatment within the last twenty-eight days.","meaning":"Boolean indicating whether the patient has had hospital inpatient treatment within the last twenty-eight days."} ;; "the patient has had hospital inpatient treatment within the last twenty-eight days"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Definition: patient_has_hospital_inpatient_treatment_within_last_28_days is true iff the most recent hospital inpatient treatment was 28 or fewer days ago
(assert
(! (= patient_has_hospital_inpatient_treatment_within_last_28_days
     (<= hospital_inpatient_treatment_date_value_recorded_in_days_ago 28))
:named REQ0_AUXILIARY0)) ;; "the patient has had hospital inpatient treatment within the last twenty-eight days"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_hospital_inpatient_treatment_within_last_28_days)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had hospital inpatient treatment within the last twenty-eight days."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_immunosuppression_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of immunosuppression.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of immunosuppression.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of immunosuppression.","meaning":"Boolean indicating whether the patient currently has immunosuppression."} ;; "immune suppression"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_immunosuppression_now)
    :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has immune suppression."
