;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "younger than eighteen years old"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (< patient_age_value_recorded_now_in_years 18))
:named REQ0_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is younger than eighteen years old."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_mental_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a mental disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a mental disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a mental disorder.","meaning":"Boolean indicating whether the patient currently has a mental disorder."} ;; "psychiatric illness"
(declare-const patient_has_finding_of_mental_disorder_now@@serious Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a mental disorder and the disorder is serious.","when_to_set_to_false":"Set to false if the patient currently has a mental disorder but the disorder is not serious.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's mental disorder is serious.","meaning":"Boolean indicating whether the patient's current mental disorder is serious."} ;; "serious psychiatric illness"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies the stem variable
(assert
(! (=> patient_has_finding_of_mental_disorder_now@@serious
      patient_has_finding_of_mental_disorder_now)
   :named REQ1_AUXILIARY0)) ;; "serious psychiatric illness" implies "psychiatric illness"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_mental_disorder_now@@serious)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a serious psychiatric illness."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_intellectual_disability_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of intellectual disability.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of intellectual disability.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of intellectual disability.","meaning":"Boolean indicating whether the patient currently has intellectual disability."} ;; "intellectual disability"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_intellectual_disability_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has intellectual disability."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_inpatient_stay_inthepast14days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had an inpatient stay (hospitalization) within the past fourteen days.","when_to_set_to_false":"Set to false if the patient has not had an inpatient stay (hospitalization) within the past fourteen days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had an inpatient stay (hospitalization) within the past fourteen days.","meaning":"Boolean indicating whether the patient has had an inpatient stay (hospitalization) within the past fourteen days."} ;; "hospitalized within the last fourteen days"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_inpatient_stay_inthepast14days)
:named REQ3_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has been hospitalized within the last fourteen days."
