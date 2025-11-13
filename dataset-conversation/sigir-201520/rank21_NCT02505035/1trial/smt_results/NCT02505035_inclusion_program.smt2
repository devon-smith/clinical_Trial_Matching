;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 65 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 65)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 65 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_duration_of_inpatient_stay_value_recorded_now_withunit_days Real) ;; {"when_to_set_to_value":"Set to the number of calendar days if the duration of the patient's current inpatient stay is recorded now.","when_to_set_to_null":"Set to null if the duration of the current inpatient stay is not recorded now or is indeterminate.","meaning":"Numeric value representing the duration (in days) of the patient's current inpatient stay, recorded now."} // "length of stay ≥ 3 calendar days"
(declare-const patient_has_finding_of_inpatient_stay_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently hospitalized (has an active inpatient stay now).","when_to_set_to_false":"Set to false if the patient is not currently hospitalized (no active inpatient stay now).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently hospitalized.","meaning":"Boolean indicating whether the patient is currently hospitalized (active inpatient stay now)."} // "current hospitalization"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (and patient_has_finding_of_inpatient_stay_now
          (>= patient_duration_of_inpatient_stay_value_recorded_now_withunit_days 3))
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a current hospitalization with length of stay ≥ 3 calendar days (modified intention-to-treat)."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_end_stage_renal_failure_on_dialysis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of end-stage renal disease and is on dialysis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of end-stage renal disease on dialysis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of end-stage renal disease on dialysis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of end-stage renal disease and is on dialysis."} // "a diagnosis of end-stage renal disease on dialysis"
(declare-const patient_has_diagnosis_of_chronic_obstructive_lung_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of chronic obstructive pulmonary disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of chronic obstructive pulmonary disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of chronic obstructive pulmonary disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of chronic obstructive pulmonary disease."} // "a diagnosis of chronic obstructive pulmonary disease"
(declare-const patient_has_diagnosis_of_chronic_obstructive_lung_disease_now@@has_home_oxygen_dependence Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of chronic obstructive pulmonary disease and is dependent on home oxygen.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of chronic obstructive pulmonary disease but is not dependent on home oxygen.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is dependent on home oxygen.","meaning":"Boolean indicating whether the patient with COPD is dependent on home oxygen."} // "a diagnosis of chronic obstructive pulmonary disease with home oxygen dependence"
(declare-const patient_number_of_hospitalizations_in_past_12_months_integer Int) ;; {"when_to_set_to_value":"Set to the integer value representing the number of hospitalizations the patient has had in the past 12 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many hospitalizations the patient has had in the past 12 months.","meaning":"Integer indicating the number of hospitalizations the patient has had in the past 12 months."} // "number of hospitalizations in the past 12 months ≥ 2"
(declare-const patient_has_diagnosis_of_dementia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of dementia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of dementia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of dementia."} // "a diagnosis of dementia"
(declare-const patient_has_diagnosis_of_dementia_now@@admitted_from_long_term_care_facility Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of dementia and was admitted from a long-term care facility.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of dementia but was not admitted from a long-term care facility.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was admitted from a long-term care facility.","meaning":"Boolean indicating whether the patient with dementia was admitted from a long-term care facility."} // "a diagnosis of dementia admitted from a long-term care facility"
(declare-const patient_has_diagnosis_of_dementia_now@@had_prior_placement_of_surgical_feeding_tube Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of dementia and had prior placement of a surgical feeding tube.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of dementia but did not have prior placement of a surgical feeding tube.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient had prior placement of a surgical feeding tube.","meaning":"Boolean indicating whether the patient with dementia had prior placement of a surgical feeding tube."} // "a diagnosis of dementia with prior placement of a surgical feeding tube"
(declare-const patient_number_of_additional_hospitalizations_in_past_12_months_integer Int) ;; {"when_to_set_to_value":"Set to the integer value representing the number of additional hospitalizations the patient has had in the past 12 months, beyond an initial hospitalization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many additional hospitalizations the patient has had in the past 12 months.","meaning":"Integer indicating the number of additional hospitalizations the patient has had in the past 12 months, beyond an initial hospitalization."} // "number of additional hospitalizations in the past 12 months ≥ 2"
(declare-const patient_has_finding_of_dependence_on_supplemental_oxygen_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has dependence on supplemental oxygen.","when_to_set_to_false":"Set to false if the patient currently does not have dependence on supplemental oxygen.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has dependence on supplemental oxygen.","meaning":"Boolean indicating whether the patient currently has dependence on supplemental oxygen."} // "home oxygen dependence"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable for COPD with home oxygen dependence implies both COPD and oxygen dependence
(assert
  (! (=> patient_has_diagnosis_of_chronic_obstructive_lung_disease_now@@has_home_oxygen_dependence
         (and patient_has_diagnosis_of_chronic_obstructive_lung_disease_now
              patient_has_finding_of_dependence_on_supplemental_oxygen_now))
     :named REQ2_AUXILIARY0)) ;; "a diagnosis of chronic obstructive pulmonary disease with home oxygen dependence"

;; Qualifier variable for dementia admitted from long-term care facility implies dementia
(assert
  (! (=> patient_has_diagnosis_of_dementia_now@@admitted_from_long_term_care_facility
         patient_has_diagnosis_of_dementia_now)
     :named REQ2_AUXILIARY1)) ;; "a diagnosis of dementia admitted from a long-term care facility"

;; Qualifier variable for dementia with prior placement of surgical feeding tube implies dementia
(assert
  (! (=> patient_has_diagnosis_of_dementia_now@@had_prior_placement_of_surgical_feeding_tube
         patient_has_diagnosis_of_dementia_now)
     :named REQ2_AUXILIARY2)) ;; "a diagnosis of dementia with prior placement of a surgical feeding tube"

;; ===================== Constraint Assertions (REQ 2) =====================
;; At least one of the following must be true:
;; (a diagnosis of end-stage renal disease on dialysis)
;; OR (a diagnosis of chronic obstructive pulmonary disease with home oxygen dependence)
;; OR (a diagnosis of chronic obstructive pulmonary disease with number of hospitalizations in the past 12 months ≥ 2)
;; OR (a diagnosis of dementia admitted from a long-term care facility)
;; OR (a diagnosis of dementia with prior placement of a surgical feeding tube)
;; OR (a diagnosis of dementia with number of additional hospitalizations in the past 12 months ≥ 2)
(assert
  (! (or
        patient_has_diagnosis_of_end_stage_renal_failure_on_dialysis_now
        patient_has_diagnosis_of_chronic_obstructive_lung_disease_now@@has_home_oxygen_dependence
        (and patient_has_diagnosis_of_chronic_obstructive_lung_disease_now
             (>= patient_number_of_hospitalizations_in_past_12_months_integer 2))
        patient_has_diagnosis_of_dementia_now@@admitted_from_long_term_care_facility
        patient_has_diagnosis_of_dementia_now@@had_prior_placement_of_surgical_feeding_tube
        (and patient_has_diagnosis_of_dementia_now
             (>= patient_number_of_additional_hospitalizations_in_past_12_months_integer 2))
     )
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have ((a diagnosis of end-stage renal disease on dialysis) OR (a diagnosis of chronic obstructive pulmonary disease with home oxygen dependence) OR (a diagnosis of chronic obstructive pulmonary disease with number of hospitalizations in the past 12 months ≥ 2) OR (a diagnosis of dementia admitted from a long-term care facility) OR (a diagnosis of dementia with prior placement of a surgical feeding tube) OR (a diagnosis of dementia with number of additional hospitalizations in the past 12 months ≥ 2))."
