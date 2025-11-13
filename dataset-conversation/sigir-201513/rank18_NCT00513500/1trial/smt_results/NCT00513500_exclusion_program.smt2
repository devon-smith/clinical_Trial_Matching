;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_months Real) ;; {"when_to_set_to_value":"Set to the patient's current age in months if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in months is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in months."} ;; "the patient is younger than 6 months OR the patient is older than 5 years"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "the patient is younger than 6 months OR the patient is older than 5 years"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion: patient is younger than 6 months
(assert
(! (not (< patient_age_value_recorded_now_in_months 6))
    :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is younger than 6 months."

;; Exclusion: patient is older than 5 years
(assert
(! (not (> patient_age_value_recorded_now_in_years 5))
    :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is older than 5 years."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_clinical_signs_of_sign_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has clinical signs of severe illness.","when_to_set_to_false":"Set to false if the patient currently does not have clinical signs of severe illness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has clinical signs of severe illness.","meaning":"Boolean indicating whether the patient currently has clinical signs of severe illness."} ;; "the patient has signs of severe illness"
(declare-const patient_has_symptoms_of_severe_illness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms of severe illness.","when_to_set_to_false":"Set to false if the patient currently does not have symptoms of severe illness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptoms of severe illness.","meaning":"Boolean indicating whether the patient currently has symptoms of severe illness."} ;; "the patient has symptoms of severe illness"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_clinical_signs_of_sign_now)
    :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has signs of severe illness."

(assert
(! (not patient_has_symptoms_of_severe_illness_now)
    :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has symptoms of severe illness."
