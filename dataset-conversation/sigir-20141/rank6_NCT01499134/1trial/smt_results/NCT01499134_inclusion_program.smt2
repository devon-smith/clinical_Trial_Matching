;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as male at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not male at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient's sex is male as currently recorded."} // "be a man"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient's sex is female as currently recorded."} // "be a woman"
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is documented as currently pregnant.","when_to_set_to_false":"Set to false if the patient is documented as not currently pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} // "NOT be pregnant"
(declare-const patient_is_lactating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is documented as currently lactating.","when_to_set_to_false":"Set to false if the patient is documented as not currently lactating.","when_to_set_to_null":"Set to null if the patient's current lactation status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently lactating."} // "NOT be lactating"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "be aged greater than or equal to 45 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (or patient_sex_is_male_now patient_sex_is_female_now)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "be a man OR be a woman"

(assert
  (! (not patient_is_pregnant_now)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "NOT be pregnant"

(assert
  (! (not patient_is_lactating_now)
     :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "NOT be lactating"

(assert
  (! (>= patient_age_value_recorded_now_in_years 45)
     :named REQ0_COMPONENT3_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "be aged greater than or equal to 45 years"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_is_able_to_give_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to give informed consent.","when_to_set_to_false":"Set to false if the patient is currently not able to give informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to give informed consent.","meaning":"Boolean indicating whether the patient is currently able to give informed consent."} // "the patient must be able to give informed consent"
(declare-const patient_is_able_to_complete_scheduled_visits_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to complete scheduled visits.","when_to_set_to_false":"Set to false if the patient is currently not able to complete scheduled visits.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to complete scheduled visits.","meaning":"Boolean indicating whether the patient is currently able to complete scheduled visits."} // "the patient must be able to complete scheduled visits"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: The patient must be able to give informed consent.
(assert
  (! patient_is_able_to_give_informed_consent_now
     :named REQ1_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must be able to give informed consent"

;; Component 1: The patient must be able to complete scheduled visits.
(assert
  (! patient_is_able_to_complete_scheduled_visits_now
     :named REQ1_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must be able to complete scheduled visits"

;; ===================== Declarations for the inclusion criterion (REQ 2) =====================
(declare-const patient_ankle_brachial_pressure_index_value_recorded_now_withunit_ratio Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's ankle-brachial pressure index (ABI) recorded now is available.","when_to_set_to_null":"Set to null if no such measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current ankle-brachial pressure index (ABI)."} // "ankle-brachial index measurement"
(declare-const patient_has_finding_of_claudication_symptoms_at_baseline Bool) ;; {"when_to_set_to_true":"Set to true if the patient has claudication symptoms at baseline.","when_to_set_to_false":"Set to false if the patient does not have claudication symptoms at baseline.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has claudication symptoms at baseline.","meaning":"Boolean indicating whether the patient has claudication symptoms at baseline."} // "claudication symptoms at baseline"
(declare-const patient_has_finding_of_claudication_symptoms_at_baseline@@stable_for_3_months_preceding_enrollment Bool) ;; {"when_to_set_to_true":"Set to true if the patient's claudication symptoms at baseline have been stable for the 3 months preceding enrollment.","when_to_set_to_false":"Set to false if the patient's claudication symptoms at baseline have not been stable for the 3 months preceding enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's claudication symptoms at baseline have been stable for the 3 months preceding enrollment.","meaning":"Boolean indicating whether the patient's claudication symptoms at baseline have been stable for the 3 months preceding enrollment."} // "claudication symptoms must be stable for the 3 months preceding enrollment"
(declare-const patient_has_finding_of_peripheral_arterial_occlusive_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has peripheral arterial occlusive disease.","when_to_set_to_false":"Set to false if the patient currently does not have peripheral arterial occlusive disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has peripheral arterial occlusive disease.","meaning":"Boolean indicating whether the patient currently has peripheral arterial occlusive disease."} // "peripheral arterial disease"
(declare-const patient_has_finding_of_peripheral_arterial_occlusive_disease_now@@present_in_both_lower_extremities Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has peripheral arterial occlusive disease and it is present in both lower extremities.","when_to_set_to_false":"Set to false if the patient currently has peripheral arterial occlusive disease but it is not present in both lower extremities.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disease is present in both lower extremities.","meaning":"Boolean indicating whether the patient currently has peripheral arterial occlusive disease present in both lower extremities."} // "of both lower extremities"
(declare-const patient_has_finding_of_peripheral_arterial_occlusive_disease_now@@severity_mild Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has peripheral arterial occlusive disease and the severity is mild.","when_to_set_to_false":"Set to false if the patient currently has peripheral arterial occlusive disease but the severity is not mild.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the severity is mild.","meaning":"Boolean indicating whether the patient currently has peripheral arterial occlusive disease with mild severity."} // "mild peripheral arterial disease"
(declare-const patient_has_finding_of_peripheral_arterial_occlusive_disease_now@@severity_moderate Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has peripheral arterial occlusive disease and the severity is moderate.","when_to_set_to_false":"Set to false if the patient currently has peripheral arterial occlusive disease but the severity is not moderate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the severity is moderate.","meaning":"Boolean indicating whether the patient currently has peripheral arterial occlusive disease with moderate severity."} // "moderate peripheral arterial disease"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply their stem variables
(assert
  (! (=> patient_has_finding_of_peripheral_arterial_occlusive_disease_now@@present_in_both_lower_extremities
         patient_has_finding_of_peripheral_arterial_occlusive_disease_now)
     :named REQ2_AUXILIARY0)) ;; "present in both lower extremities" implies peripheral arterial occlusive disease

(assert
  (! (=> patient_has_finding_of_peripheral_arterial_occlusive_disease_now@@severity_mild
         patient_has_finding_of_peripheral_arterial_occlusive_disease_now)
     :named REQ2_AUXILIARY1)) ;; "severity mild" implies peripheral arterial occlusive disease

(assert
  (! (=> patient_has_finding_of_peripheral_arterial_occlusive_disease_now@@severity_moderate
         patient_has_finding_of_peripheral_arterial_occlusive_disease_now)
     :named REQ2_AUXILIARY2)) ;; "severity moderate" implies peripheral arterial occlusive disease

;; Claudication symptoms stability qualifier implies stem variable
(assert
  (! (=> patient_has_finding_of_claudication_symptoms_at_baseline@@stable_for_3_months_preceding_enrollment
         patient_has_finding_of_claudication_symptoms_at_baseline)
     :named REQ2_AUXILIARY3)) ;; "claudication symptoms at baseline stable for 3 months" implies "claudication symptoms at baseline"

;; Moderate PAD of both lower extremities is defined by ABI in [0.6, 0.9]
(assert
  (! (= patient_has_finding_of_peripheral_arterial_occlusive_disease_now@@severity_moderate
        (and patient_has_finding_of_peripheral_arterial_occlusive_disease_now
             patient_has_finding_of_peripheral_arterial_occlusive_disease_now@@present_in_both_lower_extremities
             (>= patient_ankle_brachial_pressure_index_value_recorded_now_withunit_ratio 0.6)
             (<= patient_ankle_brachial_pressure_index_value_recorded_now_withunit_ratio 0.9)))
     :named REQ2_AUXILIARY4)) ;; "moderate peripheral arterial disease of both lower extremities as defined by ankle-brachial index measurement greater than or equal to 0.6 and less than or equal to 0.9"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: ((mild PAD of both lower extremities) OR (moderate PAD of both lower extremities as defined by ABI 0.6-0.9))
(assert
  (! (or
        (and patient_has_finding_of_peripheral_arterial_occlusive_disease_now@@severity_mild
             patient_has_finding_of_peripheral_arterial_occlusive_disease_now@@present_in_both_lower_extremities)
        patient_has_finding_of_peripheral_arterial_occlusive_disease_now@@severity_moderate)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "((have mild peripheral arterial disease of both lower extremities) OR (have moderate peripheral arterial disease of both lower extremities as defined by ankle-brachial index measurement greater than or equal to 0.6 and less than or equal to 0.9))"

;; Component 1: If the patient has claudication symptoms at baseline, the symptoms must be stable for 3 months preceding enrollment
(assert
  (! (or (not patient_has_finding_of_claudication_symptoms_at_baseline)
         patient_has_finding_of_claudication_symptoms_at_baseline@@stable_for_3_months_preceding_enrollment)
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "if the patient has claudication symptoms at baseline, the claudication symptoms must be stable for the 3 months preceding enrollment"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_hypertensive_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with hypertensive disorder (hypertension) at any time prior to now.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with hypertensive disorder (hypertension) prior to now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with hypertensive disorder (hypertension).","meaning":"Boolean indicating whether the patient has a history of hypertensive disorder (hypertension)."} // "have a history of hypertension"
(declare-const patient_is_currently_prescribed_beta_blocker_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently prescribed beta-blocker therapy.","when_to_set_to_false":"Set to false if the patient is not currently prescribed beta-blocker therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently prescribed beta-blocker therapy.","meaning":"Boolean indicating whether the patient is currently prescribed beta-blocker therapy."} // "if the patient is currently prescribed beta-blocker therapy"
(declare-const systolic_blood_pressure_value_recorded_at_screening_visit_in_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's systolic blood pressure measured at the screening visit, in millimeters of mercury.","when_to_set_to_null":"Set to null if the systolic blood pressure at the screening visit is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's systolic blood pressure measured at the screening visit, in millimeters of mercury."} // "systolic blood pressure at the screening visit"
(declare-const diastolic_blood_pressure_value_recorded_at_screening_visit_in_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's diastolic blood pressure measured at the screening visit, in millimeters of mercury.","when_to_set_to_null":"Set to null if the diastolic blood pressure at the screening visit is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's diastolic blood pressure measured at the screening visit, in millimeters of mercury."} // "diastolic blood pressure at the screening visit"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: History of hypertension
(assert
  (! patient_has_diagnosis_of_hypertensive_disorder_inthehistory
     :named REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "have a history of hypertension"

;; Component 1: Blood pressure requirements at screening visit, conditional on beta-blocker therapy
(assert
  (! (or
        (and patient_is_currently_prescribed_beta_blocker_therapy
             (<= systolic_blood_pressure_value_recorded_at_screening_visit_in_millimeters_of_mercury 140.0)
             (<= diastolic_blood_pressure_value_recorded_at_screening_visit_in_millimeters_of_mercury 90.0))
        (and (not patient_is_currently_prescribed_beta_blocker_therapy)
             (<= systolic_blood_pressure_value_recorded_at_screening_visit_in_millimeters_of_mercury 160.0)
             (>= systolic_blood_pressure_value_recorded_at_screening_visit_in_millimeters_of_mercury 100.0)
             (<= diastolic_blood_pressure_value_recorded_at_screening_visit_in_millimeters_of_mercury 100.0)
             (>= diastolic_blood_pressure_value_recorded_at_screening_visit_in_millimeters_of_mercury 60.0)))
     :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "if the patient is currently prescribed beta-blocker therapy, systolic ≤ 140 and diastolic ≤ 90; if NOT, systolic ≤ 160 and ≥ 100, diastolic ≤ 100 and ≥ 60"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_heart_rate_value_recorded_now_withunit_beats_per_minute Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current heart rate in beats per minute is available.","when_to_set_to_null":"Set to null if no current heart rate measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current heart rate in beats per minute."} // "heart rate must be greater than or equal to 55 beats per minute" / "heart rate must be greater than or equal to 60 beats per minute"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: If the patient is currently prescribed beta-blocker therapy, heart rate must be >= 55 bpm; if not, heart rate must be >= 60 bpm.
(assert
  (! (or
        (and patient_is_currently_prescribed_beta_blocker_therapy
             (>= patient_heart_rate_value_recorded_now_withunit_beats_per_minute 55.0))
        (and (not patient_is_currently_prescribed_beta_blocker_therapy)
             (>= patient_heart_rate_value_recorded_now_withunit_beats_per_minute 60.0)))
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "if the patient is currently prescribed beta-blocker therapy, heart rate must be greater than or equal to 55 beats per minute" OR "if the patient is NOT currently prescribed beta-blocker therapy, heart rate must be greater than or equal to 60 beats per minute"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_coronary_artery_disease_risk_level_value_recorded_now_withunit_standardized_scale Real) ;; {"when_to_set_to_value":"Set to the numeric value representing the patient's current risk level for coronary artery disease, as determined by a standardized risk assessment scale (e.g., 1=low, 2=moderate, 3=high).","when_to_set_to_null":"Set to null if the patient's current risk level for coronary artery disease is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current risk level for coronary artery disease on a standardized scale."} // "the patient must be at least at moderate risk for coronary artery disease"
(declare-const patient_has_finding_of_coronary_arteriosclerosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of coronary artery disease (coronary arteriosclerosis).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of coronary artery disease (coronary arteriosclerosis).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has coronary artery disease (coronary arteriosclerosis).","meaning":"Boolean indicating whether the patient currently has coronary artery disease (coronary arteriosclerosis)."} // "coronary artery disease"

;; ===================== Constraint Assertions (REQ 5) =====================
;; The patient must be at least at moderate risk for coronary artery disease (risk level >= 2)
(assert
  (! (>= patient_coronary_artery_disease_risk_level_value_recorded_now_withunit_standardized_scale 2)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must be at least at moderate risk for coronary artery disease"
