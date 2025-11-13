;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_undergone_hospital_admission_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a hospital admission at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone a hospital admission at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a hospital admission.","meaning":"Boolean indicating whether the patient has ever undergone a hospital admission in the past."} ;; "hospital admission"
(declare-const patient_has_undergone_hospital_admission_inthehistory@@time_since_discharge_less_than_15_days Bool) ;; {"when_to_set_to_true":"Set to true if, for a prior hospital admission, the time since discharge is less than 15 days.","when_to_set_to_false":"Set to false if, for all prior hospital admissions, the time since discharge is 15 days or more.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the time since discharge from any prior hospital admission is less than 15 days.","meaning":"Boolean indicating whether the time since discharge from a prior hospital admission is less than 15 days."} ;; "with time since discharge < 15 days"
(declare-const time_since_discharge_from_prior_hospital_admission_in_days Real) ;; {"when_to_set_to_value":"Set to the number of days since the patient's most recent prior hospital admission discharge.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many days have passed since the patient's most recent prior hospital admission discharge.","meaning":"Numeric value representing the number of days since the patient's most recent prior hospital admission discharge."} ;; "time since discharge < 15 days"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies stem variable
(assert
(! (=> patient_has_undergone_hospital_admission_inthehistory@@time_since_discharge_less_than_15_days
      patient_has_undergone_hospital_admission_inthehistory)
:named REQ0_AUXILIARY0)) ;; "for a prior hospital admission, the time since discharge is less than 15 days"

;; Definition: time_since_discharge_from_prior_hospital_admission_in_days < 15 implies the qualifier
(assert
(! (=> (< time_since_discharge_from_prior_hospital_admission_in_days 15)
       patient_has_undergone_hospital_admission_inthehistory@@time_since_discharge_less_than_15_days)
:named REQ0_AUXILIARY1)) ;; "time since discharge < 15 days" implies the qualifier

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_undergone_hospital_admission_inthehistory@@time_since_discharge_less_than_15_days)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a prior hospital admission with time since discharge < 15 days."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_alternative_diagnosis_now@@temporalcontext_at_time_of_discharge Bool) ;; {"when_to_set_to_true":"Set to true if the patient has an alternative diagnosis specifically at the time of discharge.","when_to_set_to_false":"Set to false if the patient does not have an alternative diagnosis at the time of discharge.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has an alternative diagnosis at the time of discharge.","meaning":"Boolean indicating whether the patient has an alternative diagnosis at the time of discharge."} ;; "has an alternative diagnosis at the time of discharge"

(declare-const patient_has_finding_of_diagnosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis.","meaning":"Boolean indicating whether the patient currently has a diagnosis."} ;; "diagnosis"

(declare-const patient_has_finding_of_diagnosis_now@@temporalcontext_at_time_of_discharge Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis is present specifically at the time of discharge.","when_to_set_to_false":"Set to false if the diagnosis is not present at the time of discharge.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is present at the time of discharge.","meaning":"Boolean indicating whether the diagnosis is present at the time of discharge."} ;; "diagnosis at the time of discharge"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_alternative_diagnosis_now@@temporalcontext_at_time_of_discharge)
    :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an alternative diagnosis at the time of discharge."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_immunosuppression_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of immunosuppression.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of immunosuppression.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has immunosuppression.","meaning":"Boolean indicating whether the patient currently has immunosuppression."} ;; "immunosuppression"
(declare-const patient_has_finding_of_human_immunodeficiency_virus_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of human immunodeficiency virus infection.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of human immunodeficiency virus infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has human immunodeficiency virus infection.","meaning":"Boolean indicating whether the patient currently has human immunodeficiency virus infection."} ;; "human immunodeficiency virus infection"
(declare-const patient_is_undergoing_immunosuppressive_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving immunosuppressive therapy.","when_to_set_to_false":"Set to false if the patient is currently not receiving immunosuppressive therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving immunosuppressive therapy.","meaning":"Boolean indicating whether the patient is currently receiving immunosuppressive therapy."} ;; "immunosuppressive therapy"
(declare-const patient_has_finding_of_neutropenia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of neutropenia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of neutropenia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has neutropenia.","meaning":"Boolean indicating whether the patient currently has neutropenia."} ;; "neutropenia"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Non-exhaustive example: human immunodeficiency virus infection implies immunosuppression
(assert
(! (=> patient_has_finding_of_human_immunodeficiency_virus_infection_now
      patient_has_finding_of_immunosuppression_now)
   :named REQ2_AUXILIARY0)) ;; "immunosuppression with non-exhaustive examples (human immunodeficiency virus infection)"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Exclusion: patient must NOT have immunosuppression
(assert
(! (not patient_has_finding_of_immunosuppression_now)
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has immunosuppression with non-exhaustive examples (human immunodeficiency virus infection)."

;; Exclusion: patient must NOT be receiving immunosuppressive therapy
(assert
(! (not patient_is_undergoing_immunosuppressive_therapy_now)
   :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is receiving immunosuppressive therapy."

;; Exclusion: patient must NOT have neutropenia
(assert
(! (not patient_has_finding_of_neutropenia_now)
   :named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has neutropenia."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_risk_factor_value_recorded_now_withunit_count Real) ;; {"when_to_set_to_value":"Set to the number of risk factors for unusual etiologies the patient currently has, as counted at the present time.","when_to_set_to_null":"Set to null if the number of risk factors for unusual etiologies is unknown, not documented, or cannot be determined at the present time.","meaning":"Numeric value indicating the count of risk factors for unusual etiologies present in the patient now."} ;; "risk factor for unusual etiologies"
(declare-const patient_risk_factor_value_recorded_now_withunit_count@@for_unusual_etiologies Bool) ;; {"when_to_set_to_true":"Set to true if the risk factors counted are specifically for unusual etiologies.","when_to_set_to_false":"Set to false if the risk factors counted are not specifically for unusual etiologies.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the risk factors are for unusual etiologies.","meaning":"Boolean indicating whether the risk factors counted are specifically for unusual etiologies."} ;; "risk factor for unusual etiologies"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies the count is for unusual etiologies
(assert
(! (=> patient_risk_factor_value_recorded_now_withunit_count@@for_unusual_etiologies
    (>= patient_risk_factor_value_recorded_now_withunit_count 0))
:named REQ3_AUXILIARY0)) ;; "risk factors counted are specifically for unusual etiologies"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Exclusion: patient must NOT have ≥ 1 risk factor for unusual etiologies
(assert
(! (not (and patient_risk_factor_value_recorded_now_withunit_count@@for_unusual_etiologies
             (>= patient_risk_factor_value_recorded_now_withunit_count 1)))
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has ≥ 1 risk factor for unusual etiologies."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as confirmed by clinical assessment or documentation.","when_to_set_to_false":"Set to false if the patient is currently confirmed not to be pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_is_pregnant_now)
    :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."
