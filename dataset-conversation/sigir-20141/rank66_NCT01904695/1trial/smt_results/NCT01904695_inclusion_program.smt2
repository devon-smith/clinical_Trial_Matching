;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_essential_hypertension_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of essential hypertension.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of essential hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has essential hypertension.","meaning":"Boolean indicating whether the patient currently has essential hypertension."} ;; "essential hypertension"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_finding_of_essential_hypertension_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be a subject with essential hypertension."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "aged ≥ 18 years AND aged ≤ 70 years"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must be aged ≥ 18 years.
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 18 years."

;; Component 1: To be included, the patient must be aged ≤ 70 years.
(assert
  (! (<= patient_age_value_recorded_now_in_years 70)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≤ 70 years."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_systolic_blood_pressure_value_recorded_now_withunit_mm_hg Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's systolic blood pressure in mm Hg is recorded now.","when_to_set_to_null":"Set to null if no systolic blood pressure measurement in mm Hg is available for now or the value is indeterminate.","meaning":"Numeric value representing the patient's systolic blood pressure in mm Hg recorded now."} ;; "systolic blood pressure"
(declare-const patient_diastolic_blood_pressure_value_recorded_now_withunit_mm_hg Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's diastolic blood pressure in mm Hg is recorded now.","when_to_set_to_null":"Set to null if no diastolic blood pressure measurement in mm Hg is available for now or the value is indeterminate.","meaning":"Numeric value representing the patient's diastolic blood pressure in mm Hg recorded now."} ;; "diastolic blood pressure"
(declare-const patient_antihypertensive_drug_medications_count_value_recorded_now Real) ;; {"when_to_set_to_value":"Set to the number of antihypertensive drug medications the patient is currently taking.","when_to_set_to_null":"Set to null if the count of antihypertensive drug medications currently taken by the patient is unknown, not documented, or indeterminate.","meaning":"Numeric value representing the count of antihypertensive drug medications the patient is currently taking."} ;; "≥ 3 antihypertensive drug medications"
(declare-const patient_antihypertensive_drug_medications_duration_value_recorded_now_in_months Real) ;; {"when_to_set_to_value":"Set to the number of months the patient has continuously been on antihypertensive drug medications.","when_to_set_to_null":"Set to null if the duration in months the patient has been on antihypertensive drug medications is unknown, not documented, or indeterminate.","meaning":"Numeric value representing the duration in months that the patient has continuously been on antihypertensive drug medications."} ;; "for ≥ 1 month"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: Systolic blood pressure > 140 mm Hg OR diastolic blood pressure > 90 mm Hg
(assert
  (! (or (> patient_systolic_blood_pressure_value_recorded_now_withunit_mm_hg 140.0)
         (> patient_diastolic_blood_pressure_value_recorded_now_withunit_mm_hg 90.0))
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (systolic blood pressure > 140 mm Hg OR diastolic blood pressure > 90 mm Hg)."

;; Component 1: Patient has been on ≥ 3 antihypertensive drug medications for ≥ 1 month
(assert
  (! (and (>= patient_antihypertensive_drug_medications_count_value_recorded_now 3.0)
          (>= patient_antihypertensive_drug_medications_duration_value_recorded_now_in_months 1.0))
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have been on (≥ 3 antihypertensive drug medications) for ≥ 1 month."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_phlegm_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of phlegm syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of phlegm syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of phlegm syndrome.","meaning":"Boolean indicating whether the patient currently has a diagnosis of phlegm syndrome."} ;; "a diagnosis of phlegm syndrome"
(declare-const patient_has_diagnosis_of_venous_stasis_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of venous stasis syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of venous stasis syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of venous stasis syndrome.","meaning":"Boolean indicating whether the patient currently has a diagnosis of venous stasis syndrome."} ;; "a diagnosis of stasis syndrome"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: The patient must have a diagnosis of phlegm syndrome.
(assert
  (! patient_has_diagnosis_of_phlegm_syndrome_now
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a diagnosis of phlegm syndrome."

;; Component 1: The patient must have a diagnosis of stasis syndrome.
(assert
  (! patient_has_diagnosis_of_venous_stasis_syndrome_now
     :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a diagnosis of stasis syndrome."
