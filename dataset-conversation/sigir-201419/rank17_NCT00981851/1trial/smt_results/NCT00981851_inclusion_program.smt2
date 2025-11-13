;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_chronic_obstructive_lung_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of chronic obstructive pulmonary disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of chronic obstructive pulmonary disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of chronic obstructive pulmonary disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of chronic obstructive pulmonary disease."} // "chronic obstructive pulmonary disease Gold stage II-III"
(declare-const patient_forced_expired_volume_in_one_second_forced_vital_capacity_ratio_value_recorded_now_withunit_ratio Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's FEV1/FVC ratio is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current FEV1/FVC ratio."} // "forced expiratory volume in one second divided by forced vital capacity < 0.70"
(declare-const patient_forced_expired_volume_in_1_second_value_recorded_now_withunit_percent_of_predicted Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's FEV1 (% of predicted) is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current FEV1 as a percentage of predicted value."} // "forced expiratory volume in one second ≥ 30 % of predicted value AND forced expiratory volume in one second ≤ 80 % of predicted value"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Definition of GOLD stage II-III COPD as per requirement
(assert
  (! (= patient_has_diagnosis_of_chronic_obstructive_lung_disease_now
        (and (< patient_forced_expired_volume_in_one_second_forced_vital_capacity_ratio_value_recorded_now_withunit_ratio 0.70)
             (>= patient_forced_expired_volume_in_1_second_value_recorded_now_withunit_percent_of_predicted 30.0)
             (<= patient_forced_expired_volume_in_1_second_value_recorded_now_withunit_percent_of_predicted 80.0)))
     :named REQ0_AUXILIARY0)) ;; "chronic obstructive pulmonary disease Gold stage II-III, defined as (forced expiratory volume in one second divided by forced vital capacity < 0.70) AND (forced expiratory volume in one second ≥ 30 % of predicted value AND forced expiratory volume in one second ≤ 80 % of predicted value)"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_diagnosis_of_chronic_obstructive_lung_disease_now
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have chronic obstructive pulmonary disease Gold stage II-III"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_cigarette_smoker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is a cigarette smoker at the present time (i.e., currently smoking cigarettes).","when_to_set_to_false":"Set to false if the patient is not a cigarette smoker at the present time (i.e., not currently smoking cigarettes).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is a cigarette smoker at the present time.","meaning":"Boolean indicating whether the patient is a cigarette smoker now."} // "the patient must be a current cigarette smoker at the time of performing the study"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_finding_of_cigarette_smoker_now
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must be a current cigarette smoker at the time of performing the study"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_is_willing_to_provide_written_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient is willing to provide written informed consent.","when_to_set_to_false":"Set to false if the patient is not willing to provide written informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to provide written informed consent.","meaning":"Boolean indicating whether the patient is willing to provide written informed consent."} // "the patient must be willing to provide written informed consent"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_is_willing_to_provide_written_informed_consent
     :named REQ2_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must be willing to provide written informed consent"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_refrained_from_cigarette_smoking_for_duration_before_test_in_hours Real) ;; {"when_to_set_to_value":"Set to the number of hours the patient has refrained from cigarette smoking before the test.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many hours the patient has refrained from cigarette smoking before the test.","meaning":"Numeric value indicating the number of hours the patient has refrained from cigarette smoking prior to the test."} // "refrain from cigarette smoking for > 8 hours before the test"
(declare-const patient_has_refrained_from_bronchodilator_administration_for_duration_before_test_in_hours Real) ;; {"when_to_set_to_value":"Set to the number of hours the patient has refrained from bronchodilator administration before the test.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many hours the patient has refrained from bronchodilator administration before the test.","meaning":"Numeric value indicating the number of hours the patient has refrained from bronchodilator administration prior to the test."} // "refrain from bronchodilator administration for > 8 hours before the test"
(declare-const patient_has_refrained_from_bronchodilator_administration_for_duration_before_test_in_hours@@required_duration_depends_on_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the required duration for refraining from bronchodilator administration before the test is determined by the treatment the patient is receiving.","when_to_set_to_false":"Set to false if the required duration for refraining from bronchodilator administration before the test does not depend on the treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the required duration depends on the treatment.","meaning":"Boolean indicating whether the required duration for refraining from bronchodilator administration before the test depends on the treatment."} // "the required duration depends on treatment"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: The patient must refrain from cigarette smoking for > 8 hours before the test.
(assert
  (! (> patient_has_refrained_from_cigarette_smoking_for_duration_before_test_in_hours 8.0)
     :named REQ3_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "refrain from cigarette smoking for > 8 hours before the test"

;; Component 1: The patient must refrain from bronchodilator administration for > 8 hours before the test (the required duration depends on treatment).
(assert
  (! (> patient_has_refrained_from_bronchodilator_administration_for_duration_before_test_in_hours 8.0)
     :named REQ3_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "refrain from bronchodilator administration for > 8 hours before the test (the required duration depends on treatment)"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; The required duration for bronchodilator administration depends on treatment (definition only, does not constrain eligibility directly)
;; No further logical relationship is specified in the requirement between the qualifier and the numeric value, so no auxiliary assertion is needed beyond declaration.

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_is_registered_in_recruitment_institute Bool) ;; {"when_to_set_to_true":"Set to true if the patient is registered in any of the recruitment institutes.","when_to_set_to_false":"Set to false if the patient is not registered in any of the recruitment institutes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is registered in any of the recruitment institutes.","meaning":"Boolean indicating whether the patient is registered in one of the recruitment institutes."} // "the patient must be registered in one of the recruitment institutes"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! patient_is_registered_in_recruitment_institute
     :named REQ4_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must be registered in one of the recruitment institutes"
