;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years.","when_to_set_to_null":"Set to null if the patient's age is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "adolescent aged ≥ 14 years AND ≤ 17 years"
(declare-const patient_lives_at_home_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently living at home.","when_to_set_to_false":"Set to false if the patient is currently not living at home.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently living at home.","meaning":"Boolean indicating whether the patient is currently living at home."} // "living at home"
(declare-const number_of_parents_patient_lives_with_now Real) ;; {"when_to_set_to_value":"Set to the number of parents the patient is currently living with.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many parents the patient is currently living with.","meaning":"Numeric value indicating the number of parents the patient is currently living with."} // "at least one parent"
(declare-const number_of_guardians_patient_lives_with_now Real) ;; {"when_to_set_to_value":"Set to the number of guardians the patient is currently living with.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many guardians the patient is currently living with.","meaning":"Numeric value indicating the number of guardians the patient is currently living with."} // "at least one guardian"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: Adolescent aged ≥ 14 years AND ≤ 17 years
(assert
  (! (and (>= patient_age_value_recorded_now_in_years 14)
          (<= patient_age_value_recorded_now_in_years 17))
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "adolescent aged ≥ 14 years AND ≤ 17 years"

;; Component 1: Living at home with (at least one parent OR at least one guardian)
(assert
  (! (and patient_lives_at_home_now
          (or (>= number_of_parents_patient_lives_with_now 1)
              (>= number_of_guardians_patient_lives_with_now 1)))
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "living at home with (at least one parent OR at least one guardian)"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 Real) ;; {"when_to_set_to_value":"Set to the measured BMI value in kg/m² if a current measurement is available for the patient.","when_to_set_to_null":"Set to null if no current BMI measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current body mass index (BMI) in kg/m²."} // "body mass index"

(declare-const patient_body_mass_index_is_greater_than_or_equal_to_85th_percentile_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current BMI is greater than or equal to the 85th percentile for age and sex.","when_to_set_to_false":"Set to false if the patient's current BMI is less than the 85th percentile for age and sex.","when_to_set_to_null":"Set to null if the percentile threshold or BMI value is unknown, not documented, or cannot be determined.","meaning":"Boolean indicating whether the patient's current BMI is greater than or equal to the 85th percentile for age and sex."} // "body mass index ≥ 85th percentile"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Definition: patient_body_mass_index_is_greater_than_or_equal_to_85th_percentile_now is true iff BMI is ≥ 85th percentile (threshold must be externally provided)
;; NOTE: The actual 85th percentile value depends on age and sex, which must be provided externally.
;; This assertion links the Boolean to the numeric BMI value and the threshold.
(declare-const patient_body_mass_index_85th_percentile_threshold_value_now_withunit_kg_per_m2 Real) ;; {"when_to_set_to_value":"Set to the BMI value corresponding to the 85th percentile for the patient's age and sex, if available.","when_to_set_to_null":"Set to null if the 85th percentile threshold is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the BMI threshold for the 85th percentile for the patient's age and sex."} // "85th percentile"

(assert
  (! (= patient_body_mass_index_is_greater_than_or_equal_to_85th_percentile_now
        (>= patient_body_mass_index_value_recorded_now_withunit_kg_per_m2
            patient_body_mass_index_85th_percentile_threshold_value_now_withunit_kg_per_m2))
     :named REQ1_AUXILIARY0)) ;; "body mass index ≥ 85th percentile"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_body_mass_index_is_greater_than_or_equal_to_85th_percentile_now
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a body mass index ≥ 85th percentile."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_provided_assent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided assent.","when_to_set_to_false":"Set to false if the patient has not provided assent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided assent.","meaning":"Boolean indicating whether the patient has provided assent."} // "the patient must provide assent"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_provided_assent
     :named REQ2_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must provide assent"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_consent_from_parent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has consent from a parent.","when_to_set_to_false":"Set to false if the patient currently does not have consent from a parent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has consent from a parent.","meaning":"Boolean indicating whether the patient currently has consent from a parent."} // "consent from a parent"
(declare-const patient_has_consent_from_guardian_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has consent from a guardian.","when_to_set_to_false":"Set to false if the patient currently does not have consent from a guardian.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has consent from a guardian.","meaning":"Boolean indicating whether the patient currently has consent from a guardian."} // "consent from a guardian"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: To be included, the patient must have (consent from a parent OR consent from a guardian).
(assert
  (! (or patient_has_consent_from_parent_now
         patient_has_consent_from_guardian_now)
     :named REQ3_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have (consent from a parent OR consent from a guardian)."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const number_of_parents_willing_to_participate_in_study_now Real) ;; {"when_to_set_to_value":"Set to the number of parents who are currently willing to participate in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many parents are currently willing to participate in the study.","meaning":"Numeric value indicating the number of parents who are currently willing to participate in the study."} // "at least one parent who is willing to participate in the study"
(declare-const number_of_guardians_willing_to_participate_in_study_now Real) ;; {"when_to_set_to_value":"Set to the number of guardians who are currently willing to participate in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many guardians are currently willing to participate in the study.","meaning":"Numeric value indicating the number of guardians who are currently willing to participate in the study."} // "at least one guardian who is willing to participate in the study"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Define Boolean for "at least one parent living with the patient"
(define-fun at_least_one_parent_living_with_patient_now () Bool
  (>= number_of_parents_patient_lives_with_now 1)) ;; "at least one parent living with the patient"

;; Define Boolean for "at least one parent willing to participate"
(define-fun at_least_one_parent_willing_to_participate_now () Bool
  (>= number_of_parents_willing_to_participate_in_study_now 1)) ;; "at least one parent who is willing to participate in the study"

;; Define Boolean for "at least one guardian living with the patient"
(define-fun at_least_one_guardian_living_with_patient_now () Bool
  (>= number_of_guardians_patient_lives_with_now 1)) ;; "at least one guardian living with the patient"

;; Define Boolean for "at least one guardian willing to participate"
(define-fun at_least_one_guardian_willing_to_participate_now () Bool
  (>= number_of_guardians_willing_to_participate_in_study_now 1)) ;; "at least one guardian who is willing to participate in the study"

;; ===================== Constraint Assertions (REQ 4) =====================
;; The patient must have ((at least one parent living with the patient AND at least one parent who is willing to participate in the study) OR (at least one guardian living with the patient AND at least one guardian who is willing to participate in the study)).
(assert
  (! (or (and at_least_one_parent_living_with_patient_now
              at_least_one_parent_willing_to_participate_now)
         (and at_least_one_guardian_living_with_patient_now
              at_least_one_guardian_willing_to_participate_now))
     :named REQ4_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have ((at least one parent living with the patient AND at least one parent who is willing to participate in the study) OR (at least one guardian living with the patient AND at least one guardian who is willing to participate in the study))."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_is_english_speaking_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently speaks English.","when_to_set_to_false":"Set to false if the patient currently does not speak English.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently speaks English.","meaning":"Boolean indicating whether the patient currently speaks English."} // "the patient must be English speaking"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! patient_is_english_speaking_now
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must be English speaking"
