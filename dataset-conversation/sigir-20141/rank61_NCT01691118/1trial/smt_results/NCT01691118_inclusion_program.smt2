;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_hypertensive_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hypertension.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of hypertension.","meaning":"Boolean indicating whether the patient currently has hypertension."}  ;; "hypertension"
(declare-const patient_has_finding_of_hypertensive_disorder_now@@untreated Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hypertension and the hypertension is untreated.","when_to_set_to_false":"Set to false if the patient currently has hypertension and the hypertension is treated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's hypertension is untreated.","meaning":"Boolean indicating whether the patient's current hypertension is untreated."}  ;; "untreated hypertension"
(declare-const patient_has_finding_of_hypertensive_disorder_now@@treated Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hypertension and the hypertension is treated.","when_to_set_to_false":"Set to false if the patient currently has hypertension and the hypertension is untreated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's hypertension is treated.","meaning":"Boolean indicating whether the patient's current hypertension is treated."}  ;; "treated hypertension"
(declare-const patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if a current systolic blood pressure measurement in millimeters of mercury is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value of the patient's current systolic blood pressure in millimeters of mercury."}  ;; "systolic blood pressure"
(declare-const patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if a current diastolic blood pressure measurement in millimeters of mercury is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value of the patient's current diastolic blood pressure in millimeters of mercury."}  ;; "diastolic blood pressure"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply the stem variable (hypertension)
(assert
  (! (=> patient_has_finding_of_hypertensive_disorder_now@@untreated
         patient_has_finding_of_hypertensive_disorder_now)
     :named REQ0_AUXILIARY0)) ;; "untreated hypertension" implies "hypertension"

(assert
  (! (=> patient_has_finding_of_hypertensive_disorder_now@@treated
         patient_has_finding_of_hypertensive_disorder_now)
     :named REQ0_AUXILIARY1)) ;; "treated hypertension" implies "hypertension"

;; Untreated hypertension is defined as hypertension with either systolic BP ≥ 140 mmHg or diastolic BP ≥ 90 mmHg and not treated
(assert
  (! (= patient_has_finding_of_hypertensive_disorder_now@@untreated
        (and patient_has_finding_of_hypertensive_disorder_now
             (or (>= patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 140.0)
                 (>= patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 90.0))
             (not patient_has_finding_of_hypertensive_disorder_now@@treated)))
     :named REQ0_AUXILIARY2)) ;; "untreated hypertension (defined as (systolic blood pressure ≥ 140 mmHg OR diastolic blood pressure ≥ 90 mmHg))"

;; Treated and untreated qualifiers are mutually exclusive if both are known
(assert
  (! (not (and patient_has_finding_of_hypertensive_disorder_now@@untreated
               patient_has_finding_of_hypertensive_disorder_now@@treated))
     :named REQ0_AUXILIARY3)) ;; "treated" and "untreated" hypertension are mutually exclusive

;; ===================== Constraint Assertions (REQ 0) =====================
;; To be included, the patient must ((have untreated hypertension (defined as (systolic blood pressure ≥ 140 mmHg OR diastolic blood pressure ≥ 90 mmHg))) OR (have treated hypertension)).
(assert
  (! (or patient_has_finding_of_hypertensive_disorder_now@@untreated
         patient_has_finding_of_hypertensive_disorder_now@@treated)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must ((have untreated hypertension (defined as (systolic blood pressure ≥ 140 millimeters of mercury OR diastolic blood pressure ≥ 90 millimeters of mercury))) OR (have treated hypertension))."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_current_symptoms_of_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms of heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have symptoms of heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptoms of heart failure.","meaning":"Boolean indicating whether the patient currently has symptoms of heart failure."}  ;; "To be included, the patient must have current symptoms of heart failure."
(declare-const patient_is_classified_as_nyha_class_ii_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently classified as NYHA class II.","when_to_set_to_false":"Set to false if the patient is currently not classified as NYHA class II.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently classified as NYHA class II.","meaning":"Boolean indicating whether the patient is currently classified as NYHA class II."}  ;; "To be included, the patient must have New York Heart Association class II."

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must have current symptoms of heart failure.
(assert
  (! patient_has_current_symptoms_of_heart_failure_now
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have current symptoms of heart failure."

;; Component 1: To be included, the patient must have New York Heart Association class II.
(assert
  (! patient_is_classified_as_nyha_class_ii_now
     :named REQ1_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have New York Heart Association class II."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_diastolic_dysfunction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has evidence of diastolic dysfunction.","when_to_set_to_false":"Set to false if the patient currently does not have evidence of diastolic dysfunction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has diastolic dysfunction.","meaning":"Boolean indicating whether the patient currently has diastolic dysfunction."} ;; "evidence of diastolic dysfunction"
(declare-const patient_ratio_of_early_mitral_inflow_velocity_to_early_diastolic_mitral_annular_velocity_value_recorded_now_withunit_unitless Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the ratio of early mitral inflow velocity to early diastolic mitral annular velocity is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current ratio of early mitral inflow velocity to early diastolic mitral annular velocity, unitless."} ;; "ratio of early mitral inflow velocity to early diastolic mitral annular velocity"
(declare-const patient_left_ventricular_posterior_wall_thickness_value_recorded_now_withunit_millimeters Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of left ventricular posterior wall thickness in millimeters is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current left ventricular posterior wall thickness in millimeters."} ;; "left ventricular posterior wall thickness"
(declare-const patient_brain_natriuretic_peptide_measurement_value_recorded_now_withunit_picograms_per_milliliter Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of B-type natriuretic peptide (BNP) level in picograms per milliliter is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current B-type natriuretic peptide (BNP) level in picograms per milliliter."} ;; "B-type natriuretic peptide level"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Definition of the three findings for diastolic dysfunction evidence
(define-fun diastolic_dysfunction_evidence_count () Int
  (+ (ite (> patient_ratio_of_early_mitral_inflow_velocity_to_early_diastolic_mitral_annular_velocity_value_recorded_now_withunit_unitless 10.0) 1 0) ;; "ratio of early mitral inflow velocity to early diastolic mitral annular velocity > 10"
     (ite (> patient_left_ventricular_posterior_wall_thickness_value_recorded_now_withunit_millimeters 11.0) 1 0) ;; "left ventricular posterior wall thickness > 11 millimeters"
     (ite (> patient_brain_natriuretic_peptide_measurement_value_recorded_now_withunit_picograms_per_milliliter 40.0) 1 0))) ;; "B-type natriuretic peptide level > 40 picograms per milliliter"

;; Evidence of diastolic dysfunction is present if at least two findings are present
(assert
  (! (=> (>= diastolic_dysfunction_evidence_count 2)
         patient_has_finding_of_diastolic_dysfunction_now)
     :named REQ2_AUXILIARY0)) ;; "To be included, the patient must have evidence of diastolic dysfunction showing at least two of the following..."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (>= diastolic_dysfunction_evidence_count 2)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have evidence of diastolic dysfunction showing at least two of the following..."
