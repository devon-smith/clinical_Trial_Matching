;; ===================== Declarations for the inclusion criteria (REQ 0) =====================
(declare-const patient_is_seeking_treatment_for_tobacco_dependence_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently seeking treatment for tobacco dependence.","when_to_set_to_false":"Set to false if the patient is currently not seeking treatment for tobacco dependence.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently seeking treatment for tobacco dependence.","meaning":"Boolean indicating whether the patient is currently seeking treatment for tobacco dependence."}  ;; "a patient seeking treatment for tobacco dependence"
(declare-const patient_has_finding_of_smoker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a smoker.","when_to_set_to_false":"Set to false if the patient is currently not a smoker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a smoker.","meaning":"Boolean indicating whether the patient is currently a smoker."}  ;; "a smoker"
(declare-const patient_has_finding_of_tobacco_dependence_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of tobacco dependence syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of tobacco dependence syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has tobacco dependence syndrome.","meaning":"Boolean indicating whether the patient currently has tobacco dependence syndrome."}  ;; "tobacco dependence"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: The patient must be a patient seeking treatment for tobacco dependence.
(assert
  (! patient_is_seeking_treatment_for_tobacco_dependence_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must be a patient seeking treatment for tobacco dependence"

;; Component 1: The patient must be a smoker.
(assert
  (! patient_has_finding_of_smoker_now
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must be a smoker"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged ≥ 18 years AND aged ≤ 65 years"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must be aged ≥ 18 years.
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "aged ≥ 18 years"

;; Component 1: To be included, the patient must be aged ≤ 65 years.
(assert
  (! (<= patient_age_value_recorded_now_in_years 65)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "aged ≤ 65 years"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_cigarettes_per_day_value_recorded_now_withunit_cigarettes Real) ;; {"when_to_set_to_value":"Set to the number of cigarettes the patient currently smokes per day, as recorded at the present time.","when_to_set_to_null":"Set to null if the number of cigarettes the patient currently smokes per day is unknown, not documented, or cannot be determined.","meaning":"Numeric value for the number of cigarettes the patient currently smokes per day, with unit 'cigarettes'."}  ;; "smokes ≥ 10 cigarettes per day"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (>= patient_cigarettes_per_day_value_recorded_now_withunit_cigarettes 10)
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "smokes ≥ 10 cigarettes per day"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_fagerstrom_test_for_nicotine_dependence_total_score_value_recorded_now_withunit_score Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's Fagerstrom Test for Nicotine Dependence total score is recorded now.","when_to_set_to_null":"Set to null if no such score is recorded now or the value is indeterminate.","meaning":"Numeric value representing the patient's Fagerstrom Test for Nicotine Dependence total score recorded now."}  ;; "Fagerstrom Test of Nicotine Dependence score"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: To be included, the patient must have a Fagerstrom Test of Nicotine Dependence score > 3.
(assert
  (! (> patient_fagerstrom_test_for_nicotine_dependence_total_score_value_recorded_now_withunit_score 3.0)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be a patient who has a Fagerstrom Test of Nicotine Dependence score > 3."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_alcohol_use_disorders_identification_test_score_value_recorded_now_withunit_score Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's Alcohol Use Disorders Identification Test (AUDIT) score is recorded now.","when_to_set_to_null":"Set to null if no such score is recorded now or the value is indeterminate.","meaning":"Numeric value representing the patient's current Alcohol Use Disorders Identification Test (AUDIT) score."}  ;; "Alcohol Use Disorders Identification Test score"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (> patient_alcohol_use_disorders_identification_test_score_value_recorded_now_withunit_score 8)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be a patient who has an Alcohol Use Disorders Identification Test score > 8."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_alcohol_intake_finding_value_recorded_now_withunit_drinks_per_week Real) ;; {"when_to_set_to_value":"Set to the measured number of drinks per week if the patient's current alcohol consumption is recorded.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current alcohol consumption in drinks per week."}  ;; "alcohol consumption"
(declare-const patient_is_female Bool) ;; {"when_to_set_to_true":"Set to true if the patient is female.","when_to_set_to_false":"Set to false if the patient is not female.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or indeterminate.","meaning":"Boolean indicating whether the patient is female."}  ;; "female"
(declare-const patient_is_male Bool) ;; {"when_to_set_to_true":"Set to true if the patient is male.","when_to_set_to_false":"Set to false if the patient is not male.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or indeterminate.","meaning":"Boolean indicating whether the patient is male."}  ;; "male"

;; ===================== Constraint Assertions (REQ 5) =====================
;; To be included, the patient must be ((male AND alcohol consumption > 25 drinks per week) OR (female AND alcohol consumption > 20 drinks per week)).
(assert
  (! (or (and patient_is_male
              (> patient_alcohol_intake_finding_value_recorded_now_withunit_drinks_per_week 25.0))
         (and patient_is_female
              (> patient_alcohol_intake_finding_value_recorded_now_withunit_drinks_per_week 20.0)))
     :named REQ5_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be ((male AND alcohol consumption > 25 drinks per week) OR (female AND alcohol consumption > 20 drinks per week))."

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_is_able_to_provide_written_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to provide written informed consent.","when_to_set_to_false":"Set to false if the patient is currently unable to provide written informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to provide written informed consent.","meaning":"Boolean indicating whether the patient is currently able to provide written informed consent."}  ;; "the patient must be able to provide written informed consent"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! patient_is_able_to_provide_written_informed_consent_now
     :named REQ6_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must be able to provide written informed consent"
