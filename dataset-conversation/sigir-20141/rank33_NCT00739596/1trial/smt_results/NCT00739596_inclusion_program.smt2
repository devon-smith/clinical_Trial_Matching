;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_is_eligible_to_participate_in_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient is eligible to participate in the study.","when_to_set_to_false":"Set to false if the patient is not eligible to participate in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is eligible to participate in the study.","meaning":"Boolean indicating whether the patient is eligible to participate in the study."} // "be eligible to participate in the study"
(declare-const patient_is_able_to_participate_in_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able to participate in the study.","when_to_set_to_false":"Set to false if the patient is not able to participate in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to participate in the study.","meaning":"Boolean indicating whether the patient is able to participate in the study."} // "be able to participate in the study"
(declare-const patient_has_given_written_informed_consent_before_any_assessment Bool) ;; {"when_to_set_to_true":"Set to true if the patient has given written informed consent before any assessment is performed.","when_to_set_to_false":"Set to false if the patient has not given written informed consent before any assessment is performed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has given written informed consent before any assessment is performed.","meaning":"Boolean indicating whether the patient has given written informed consent before any assessment is performed."} // "give written informed consent before any assessment is performed"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_is_eligible_to_participate_in_study
     :named REQ0_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "be eligible to participate in the study"
(assert
  (! patient_is_able_to_participate_in_study
     :named REQ0_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "be able to participate in the study"
(assert
  (! patient_has_given_written_informed_consent_before_any_assessment
     :named REQ0_COMPONENT2_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "give written informed consent before any assessment is performed"

;; ===================== Declarations for the inclusion criteria (REQ 1) =====================
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as male.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not male (e.g., female or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is male."} // "be a man"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female (e.g., male or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is female."} // "be a woman"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 18 years"
(declare-const patient_has_african_american_background_self_identified_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently self-identifies as having African American background.","when_to_set_to_false":"Set to false if the patient currently does not self-identify as having African American background.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently self-identifies as having African American background.","meaning":"Boolean indicating whether the patient currently self-identifies as having African American background."} // "have African American background (self identified)"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: (be a man OR be a woman)
(assert
  (! (or patient_sex_is_male_now patient_sex_is_female_now)
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "be a man OR be a woman"

;; Component 1: (be aged ≥ 18 years)
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ1_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "be aged ≥ 18 years"

;; Component 2: (have African American background (self identified))
(assert
  (! patient_has_african_american_background_self_identified_now
     :named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "have African American background (self identified)"

;; ===================== Declarations for the inclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_stage_2_hypertension_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has stage 2 hypertension.","when_to_set_to_false":"Set to false if the patient currently does not have stage 2 hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has stage 2 hypertension.","meaning":"Boolean indicating whether the patient currently has stage 2 hypertension."} // "have stage 2 hypertension"

(declare-const patient_systolic_blood_pressure_value_recorded_inthehistory_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's systolic blood pressure is recorded at any time in the patient's history, with units of millimeters of mercury.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value of the patient's systolic blood pressure recorded in millimeters of mercury at some point in history."} // "systolic blood pressure"

(declare-const patient_systolic_blood_pressure_value_recorded_inthehistory_withunit_millimeters_of_mercury@@mean_of_sitting_measurements Bool) ;; {"when_to_set_to_true":"Set to true if the systolic blood pressure value represents the mean of sitting measurements.","when_to_set_to_false":"Set to false if the systolic blood pressure value does not represent the mean of sitting measurements.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the value is the mean of sitting measurements.","meaning":"Boolean indicating whether the systolic blood pressure value is the mean of sitting measurements."} // "mean sitting systolic blood pressure"

(declare-const patient_systolic_blood_pressure_value_recorded_inthehistory_withunit_millimeters_of_mercury@@measured_at_visit_5_randomization Bool) ;; {"when_to_set_to_true":"Set to true if the systolic blood pressure value was measured at Visit 5 (randomization).","when_to_set_to_false":"Set to false if the systolic blood pressure value was not measured at Visit 5 (randomization).","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the value was measured at Visit 5 (randomization).","meaning":"Boolean indicating whether the systolic blood pressure value was measured at Visit 5 (randomization)."} // "at Visit 5 (randomization)"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; The mean sitting systolic blood pressure at Visit 5 (randomization) is the value with both qualifiers true
;; (No explicit auxiliary assertion needed unless further relationships are defined.)

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: The patient must have stage 2 hypertension.
(assert
  (! patient_has_finding_of_stage_2_hypertension_now
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must have stage 2 hypertension"

;; Component 1: The patient must have mean sitting systolic blood pressure ≥ 160 mmHg at Visit 5 (randomization).
(assert
  (! (and patient_systolic_blood_pressure_value_recorded_inthehistory_withunit_millimeters_of_mercury@@mean_of_sitting_measurements
          patient_systolic_blood_pressure_value_recorded_inthehistory_withunit_millimeters_of_mercury@@measured_at_visit_5_randomization
          (>= patient_systolic_blood_pressure_value_recorded_inthehistory_withunit_millimeters_of_mercury 160.0))
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "mean sitting systolic blood pressure ≥ 160 millimeters of mercury at Visit 5 (randomization)"

;; Component 2: The patient must have mean sitting systolic blood pressure < 200 mmHg at Visit 5 (randomization).
(assert
  (! (and patient_systolic_blood_pressure_value_recorded_inthehistory_withunit_millimeters_of_mercury@@mean_of_sitting_measurements
          patient_systolic_blood_pressure_value_recorded_inthehistory_withunit_millimeters_of_mercury@@measured_at_visit_5_randomization
          (< patient_systolic_blood_pressure_value_recorded_inthehistory_withunit_millimeters_of_mercury 200.0))
     :named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "mean sitting systolic blood pressure < 200 millimeters of mercury at Visit 5 (randomization)"
