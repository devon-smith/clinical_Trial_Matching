;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged ≥ 40 years AND aged ≤ 75 years"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: To be included, the patient must be aged ≥ 40 years.
(assert
  (! (>= patient_age_value_recorded_now_in_years 40)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 40 years."

;; Component 1: To be included, the patient must be aged ≤ 75 years.
(assert
  (! (<= patient_age_value_recorded_now_in_years 75)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≤ 75 years."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_renal_artery_stenosis_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured percentage value if a numeric measurement of the diameter of stenosis of the renal artery is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric percentage representing the patient's current diameter of stenosis of the renal artery."} ;; "diameter of stenosis of the renal artery"
(declare-const patient_main_branch_of_renal_artery_stenosis_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured percentage value if a numeric measurement of the diameter of stenosis of the main branch of the renal artery is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric percentage representing the patient's current diameter of stenosis of the main branch of the renal artery."} ;; "diameter of stenosis of the main branch of the renal artery"
(declare-const patient_pressure_difference_between_proximal_and_distal_end_of_renal_artery_value_recorded_now_withunit_millimeter_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured pressure difference value in millimeters of mercury if a numeric measurement is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current pressure difference between the proximal and distal end of the renal artery in millimeters of mercury."} ;; "pressure difference between the proximal end of the renal artery and the distal end of the renal artery"
(declare-const patient_has_positive_captopril_renography_result_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a positive captopril renography result.","when_to_set_to_false":"Set to false if the patient currently does not have a positive captopril renography result.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a positive captopril renography result.","meaning":"Boolean indicating whether the patient currently has a positive captopril renography result."} ;; "positive captopril renography result"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; None required for this requirement (all logic is direct from the requirement).

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: ((diameter of stenosis of the renal artery ≥ 60%) OR (diameter of stenosis of the main branch of the renal artery ≥ 60%))
(assert
  (! (or (>= patient_renal_artery_stenosis_value_recorded_now_withunit_percent 60.0)
         (>= patient_main_branch_of_renal_artery_stenosis_value_recorded_now_withunit_percent 60.0))
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "diameter of stenosis of the renal artery ≥ 60% OR diameter of stenosis of the main branch of the renal artery ≥ 60%"

;; Component 1: IF ((diameter of stenosis of the renal artery ≥ 60% AND ≤ 75%) OR (diameter of stenosis of the main branch of the renal artery ≥ 60% AND ≤ 75%)), THEN ((pressure difference ≥ 20 mmHg) OR (positive captopril renography result))
(assert
  (! (=> 
        (or (and (>= patient_renal_artery_stenosis_value_recorded_now_withunit_percent 60.0)
                 (<= patient_renal_artery_stenosis_value_recorded_now_withunit_percent 75.0))
            (and (>= patient_main_branch_of_renal_artery_stenosis_value_recorded_now_withunit_percent 60.0)
                 (<= patient_main_branch_of_renal_artery_stenosis_value_recorded_now_withunit_percent 75.0)))
        (or (>= patient_pressure_difference_between_proximal_and_distal_end_of_renal_artery_value_recorded_now_withunit_millimeter_of_mercury 20.0)
            patient_has_positive_captopril_renography_result_now))
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "If stenosis is 60%-75%, then pressure difference ≥ 20 mmHg or positive captopril renography result"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's systolic blood pressure is recorded now in millimeters of mercury.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's systolic blood pressure measured now, in millimeters of mercury."} ;; "systolic blood pressure"
(declare-const patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@measured_before_taking_antihypertensive_medication Bool) ;; {"when_to_set_to_true":"Set to true if the systolic blood pressure measurement was taken before the patient took antihypertensive medication.","when_to_set_to_false":"Set to false if the measurement was not taken before antihypertensive medication.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the measurement was taken before antihypertensive medication.","meaning":"Boolean indicating whether the systolic blood pressure measurement was taken before antihypertensive medication."} ;; "systolic blood pressure before taking antihypertensive medication"

(declare-const patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's diastolic blood pressure is recorded now in millimeters of mercury.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's diastolic blood pressure measured now, in millimeters of mercury."} ;; "diastolic blood pressure"
(declare-const patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@measured_before_taking_antihypertensive_medication Bool) ;; {"when_to_set_to_true":"Set to true if the diastolic blood pressure measurement was taken before the patient took antihypertensive medication.","when_to_set_to_false":"Set to false if the measurement was not taken before antihypertensive medication.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the measurement was taken before antihypertensive medication.","meaning":"Boolean indicating whether the diastolic blood pressure measurement was taken before antihypertensive medication."} ;; "diastolic blood pressure before taking antihypertensive medication"

(declare-const patient_is_taking_hypotensive_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any antihypertensive agent.","when_to_set_to_false":"Set to false if the patient is not currently taking any antihypertensive agent.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the patient is currently taking any antihypertensive agent.","meaning":"Boolean indicating whether the patient is currently taking any antihypertensive agent."} ;; "antihypertensive medications"
(declare-const patient_number_of_antihypertensive_medications_now Real) ;; {"when_to_set_to_value":"Set to the total number of antihypertensive medications the patient is currently taking.","when_to_set_to_null":"Set to null if the number is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the total number of antihypertensive medications the patient is currently taking."} ;; "number of antihypertensive medications"
(declare-const patient_number_of_diuretic_medications_now Real) ;; {"when_to_set_to_value":"Set to the number of diuretic medications the patient is currently taking.","when_to_set_to_null":"Set to null if the number is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the number of diuretic medications the patient is currently taking."} ;; "number of diuretic medications"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Systolic blood pressure before antihypertensive medication: only valid if qualifier is true
(assert
  (! (=> patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@measured_before_taking_antihypertensive_medication
         (>= patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 0))
     :named REQ2_AUXILIARY0)) ;; "systolic blood pressure before taking antihypertensive medication"

;; Diastolic blood pressure before antihypertensive medication: only valid if qualifier is true
(assert
  (! (=> patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@measured_before_taking_antihypertensive_medication
         (>= patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 0))
     :named REQ2_AUXILIARY1)) ;; "diastolic blood pressure before taking antihypertensive medication"

;; ===================== Constraint Assertions (REQ 2) =====================
;; To be included, the patient must ((systolic BP before antihypertensive medication ≥ 180 mmHg) OR (diastolic BP before antihypertensive medication ≥ 110 mmHg) OR ((taking ≥ 3 antihypertensive medications including ≥ 1 diuretic) AND ((systolic BP ≥ 140 mmHg) OR (diastolic BP ≥ 90 mmHg))))
(assert
  (! (or
        ;; Systolic BP before antihypertensive medication ≥ 180 mmHg
        (and patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@measured_before_taking_antihypertensive_medication
             (>= patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 180.0))
        ;; Diastolic BP before antihypertensive medication ≥ 110 mmHg
        (and patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@measured_before_taking_antihypertensive_medication
             (>= patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 110.0))
        ;; (Taking ≥ 3 antihypertensive medications including ≥ 1 diuretic) AND (systolic BP ≥ 140 mmHg OR diastolic BP ≥ 90 mmHg)
        (and (>= patient_number_of_antihypertensive_medications_now 3.0)
             (>= patient_number_of_diuretic_medications_now 1.0)
             (or (>= patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 140.0)
                 (>= patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 90.0))))
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must ((systolic blood pressure before taking antihypertensive medication ≥ 180 millimeters of mercury) OR (diastolic blood pressure before taking antihypertensive medication ≥ 110 millimeters of mercury) OR ((taking ≥ 3 antihypertensive medications including ≥ 1 diuretic) AND ((systolic blood pressure ≥ 140 millimeters of mercury) OR (diastolic blood pressure ≥ 90 millimeters of mercury))))"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const ipsilateral_kidney_length_value_recorded_now_withunit_cm Real) ;; {"when_to_set_to_value":"Set to the measured value (in centimeters) if the length of the ipsilateral kidney is recorded now.","when_to_set_to_null":"Set to null if the length of the ipsilateral kidney is not recorded, unknown, or cannot be determined at the current time.","meaning":"Numeric value for the length of the ipsilateral kidney, recorded now, in centimeters."} ;; "length of the ipsilateral kidney > 7.0 centimeters"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (> ipsilateral_kidney_length_value_recorded_now_withunit_cm 7.0)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have length of the ipsilateral kidney > 7.0 centimeters."
