;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_tobacco_dependence_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently diagnosed with tobacco dependence syndrome.","when_to_set_to_false":"Set to false if the patient is currently not diagnosed with tobacco dependence syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently diagnosed with tobacco dependence syndrome.","meaning":"Boolean indicating whether the patient is currently diagnosed with tobacco dependence syndrome."}  ;; "tobacco dependence"
(declare-const patient_has_diagnosis_of_tobacco_dependence_syndrome_now@@seeking_treatment_for_this_condition Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently diagnosed with tobacco dependence syndrome and is seeking treatment for it.","when_to_set_to_false":"Set to false if the patient is currently diagnosed with tobacco dependence syndrome but is not seeking treatment for it.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is seeking treatment for tobacco dependence syndrome.","meaning":"Boolean indicating whether the patient is seeking treatment for tobacco dependence syndrome."}  ;; "seeking treatment for tobacco dependence"
(declare-const patient_has_finding_of_smoker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a smoker.","when_to_set_to_false":"Set to false if the patient is currently not a smoker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a smoker.","meaning":"Boolean indicating whether the patient is currently a smoker."}  ;; "smoker"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable for seeking treatment for tobacco dependence syndrome implies diagnosis of tobacco dependence syndrome
(assert
  (! (=> patient_has_diagnosis_of_tobacco_dependence_syndrome_now@@seeking_treatment_for_this_condition
         patient_has_diagnosis_of_tobacco_dependence_syndrome_now)
     :named REQ0_AUXILIARY0)) ;; "seeking treatment for tobacco dependence" implies "diagnosed with tobacco dependence"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: Patient must be seeking treatment for tobacco dependence
(assert
  (! patient_has_diagnosis_of_tobacco_dependence_syndrome_now@@seeking_treatment_for_this_condition
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be seeking treatment for tobacco dependence."

;; Component 1: Patient must be a smoker
(assert
  (! patient_has_finding_of_smoker_now
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be a smoker."

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
(declare-const patient_tobacco_user_value_recorded_now_withunit_cigarettes_per_day Real) ;; {"when_to_set_to_value":"Set to the measured or reported number of cigarettes per day if a current value is available for the patient.","when_to_set_to_null":"Set to null if no such measurement or report is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current number of cigarettes used per day."}  ;; "tobacco use of ≥ 10 cigarettes per day"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (>= patient_tobacco_user_value_recorded_now_withunit_cigarettes_per_day 10)
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have tobacco use of ≥ 10 cigarettes per day."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_fagerstrom_test_for_nicotine_dependence_total_score_value_recorded_now_withunit_score Real) ;; {"when_to_set_to_value":"Set to the measured total score if a numeric measurement of the Fagerstrom Test for Nicotine Dependence is recorded now.","when_to_set_to_null":"Set to null if no such score measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current total score on the Fagerstrom Test for Nicotine Dependence."}  ;; "Fagerstrom Test of Nicotine Dependence score > 3"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (> patient_fagerstrom_test_for_nicotine_dependence_total_score_value_recorded_now_withunit_score 3.0)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a Fagerstrom Test of Nicotine Dependence score > 3."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_alcohol_use_disorders_identification_test_score_value_recorded_now_withunit_score Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's Alcohol Use Disorders Identification Test (AUDIT) score is recorded at the present time.","when_to_set_to_null":"Set to null if no AUDIT score is recorded at the present time or the value is indeterminate.","meaning":"Numeric value representing the patient's current Alcohol Use Disorders Identification Test (AUDIT) score."}  ;; "Alcohol Use Disorders Identification Test score"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (< patient_alcohol_use_disorders_identification_test_score_value_recorded_now_withunit_score 8)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have an Alcohol Use Disorders Identification Test score < 8."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_alcohol_intake_finding_value_recorded_now_withunit_drinks_per_week Real) ;; {"when_to_set_to_value":"Set to the measured or reported number of drinks per week if the patient's current alcohol consumption is known.","when_to_set_to_null":"Set to null if the patient's current alcohol consumption in drinks per week is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current alcohol consumption in drinks per week."}  ;; "alcohol consumption < 14 drinks per week" / "alcohol consumption < 9 drinks per week"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female (e.g., male, other) at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient's sex is female as currently recorded."}  ;; "be female"
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as male at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not male (e.g., female, other) at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient's sex is male as currently recorded."}  ;; "be male"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Component 0: To be included, the patient must ((be male AND have alcohol consumption < 14 drinks per week) OR (be female AND have alcohol consumption < 9 drinks per week)).
(assert
  (! (or (and patient_sex_is_male_now
              (< patient_alcohol_intake_finding_value_recorded_now_withunit_drinks_per_week 14))
         (and patient_sex_is_female_now
              (< patient_alcohol_intake_finding_value_recorded_now_withunit_drinks_per_week 9)))
     :named REQ5_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must ((be male AND have alcohol consumption < 14 drinks per week) OR (be female AND have alcohol consumption < 9 drinks per week))."

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_is_able_to_provide_written_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to provide written informed consent.","when_to_set_to_false":"Set to false if the patient is currently unable to provide written informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to provide written informed consent.","meaning":"Boolean indicating whether the patient is currently able to provide written informed consent."}  ;; "the patient must be able to provide written informed consent"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! patient_is_able_to_provide_written_informed_consent_now
     :named REQ6_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must be able to provide written informed consent"
