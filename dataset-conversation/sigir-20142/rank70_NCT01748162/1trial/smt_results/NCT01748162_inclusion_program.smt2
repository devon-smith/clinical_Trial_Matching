;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_months Real) ;; {"when_to_set_to_value":"Set to the patient's current age in months if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in months is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in months."} // "age ≥ 6 months AND age ≤ 15 years"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "age ≥ 6 months AND age ≤ 15 years"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Definition in the requirement: pediatric population is defined as age ≥ 6 months AND age ≤ 15 years
(assert
  (! (= (and (>= patient_age_value_recorded_now_in_months 6.0)
             (<= patient_age_value_recorded_now_in_years 15.0))
        (and (>= patient_age_value_recorded_now_in_months 6.0)
             (<= patient_age_value_recorded_now_in_months 180.0)))
     :named REQ0_AUXILIARY0)) ;; "pediatric population, defined as age ≥ 6 months AND age ≤ 15 years"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: patient must be in the pediatric population (age ≥ 6 months AND age ≤ 15 years)
(assert
  (! (and (>= patient_age_value_recorded_now_in_months 6.0)
          (<= patient_age_value_recorded_now_in_years 15.0))
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be in the pediatric population, defined as (age ≥ 6 months AND age ≤ 15 years)."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_croup_value_recorded_inthepast12months_withunit_count Real) ;; {"when_to_set_to_value":"Set to the number of documented croup episodes the patient has had in the past 12 months.","when_to_set_to_null":"Set to null if the number of croup episodes in the past 12 months is unknown, not documented, or cannot be determined.","meaning":"Numeric count of croup episodes the patient has had in the past 12 months."} // "number of episodes of croup in a 12 month period ≥ 2"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (>= patient_croup_value_recorded_inthepast12months_withunit_count 2)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "number of episodes of croup in a 12 month period ≥ 2"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_barking_cough_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of barking cough.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of barking cough.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has barking cough.","meaning":"Boolean indicating whether the patient currently has barking cough."} // "barking cough"
(declare-const patient_has_finding_of_inspiratory_stridor_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of inspiratory stridor.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of inspiratory stridor.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has inspiratory stridor.","meaning":"Boolean indicating whether the patient currently has inspiratory stridor."} // "inspiratory stridor"
(declare-const patient_has_finding_of_inspiratory_stridor_now@@acute_onset Bool) ;; {"when_to_set_to_true":"Set to true if the patient's inspiratory stridor has an acute onset.","when_to_set_to_false":"Set to false if the patient's inspiratory stridor does not have an acute onset.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the inspiratory stridor has an acute onset.","meaning":"Boolean indicating whether the patient's inspiratory stridor has an acute onset."} // "acute onset inspiratory stridor"
(declare-const patient_has_finding_of_respiratory_distress_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of respiratory distress.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of respiratory distress.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has respiratory distress.","meaning":"Boolean indicating whether the patient currently has respiratory distress."} // "respiratory distress"
(declare-const patient_has_finding_of_croup_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of croup.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of croup.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has croup.","meaning":"Boolean indicating whether the patient currently has croup."} // "the patient must have croup defined as (acute onset inspiratory stridor AND barking cough AND respiratory distress)"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable for acute onset inspiratory stridor implies inspiratory stridor
(assert
  (! (=> patient_has_finding_of_inspiratory_stridor_now@@acute_onset
         patient_has_finding_of_inspiratory_stridor_now)
     :named REQ2_AUXILIARY0)) ;; "acute onset inspiratory stridor" implies "inspiratory stridor"

;; Croup is defined as (acute onset inspiratory stridor AND barking cough AND respiratory distress)
(assert
  (! (= patient_has_finding_of_croup_now
        (and patient_has_finding_of_inspiratory_stridor_now@@acute_onset
             patient_has_finding_of_barking_cough_now
             patient_has_finding_of_respiratory_distress_now))
     :named REQ2_AUXILIARY1)) ;; "croup defined as (acute onset inspiratory stridor AND barking cough AND respiratory distress)"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_finding_of_croup_now
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must have croup defined as (acute onset inspiratory stridor AND barking cough AND respiratory distress)"
