;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "aged < 35 years OR aged > 86 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (or (< patient_age_value_recorded_now_in_years 35)
            (> patient_age_value_recorded_now_in_years 86)))
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient is aged < 35 years) OR (the patient is aged > 86 years))."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_hemorrhagic_cerebral_infarction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with hemorrhagic cerebral infarction (hemorrhagic stroke) at any time in the past, regardless of current status.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with hemorrhagic cerebral infarction (hemorrhagic stroke) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of hemorrhagic cerebral infarction (hemorrhagic stroke).","meaning":"Boolean indicating whether the patient has ever had a diagnosis of hemorrhagic cerebral infarction (hemorrhagic stroke) at any time in the past."} ;; "hemorrhagic stroke"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_diagnosis_of_hemorrhagic_cerebral_infarction_inthehistory)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient had a hemorrhagic stroke."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_systolic_blood_pressure_value_recorded_inthehistory_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's systolic blood pressure was recorded at any time in the patient's history in millimeters of mercury.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value of the patient's systolic blood pressure recorded in the patient's history, in millimeters of mercury."} ;; "systolic blood pressure > 220 millimeters of mercury during an acute phase"
(declare-const patient_systolic_blood_pressure_value_recorded_inthehistory_withunit_millimeters_of_mercury@@measured_during_acute_phase Bool) ;; {"when_to_set_to_true":"Set to true if the systolic blood pressure measurement was taken during an acute phase.","when_to_set_to_false":"Set to false if the measurement was not taken during an acute phase.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the measurement was taken during an acute phase.","meaning":"Indicates whether the systolic blood pressure measurement was taken during an acute phase."} ;; "during an acute phase"
(declare-const patient_diastolic_blood_pressure_value_recorded_inthehistory_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's diastolic blood pressure was recorded at any time in the patient's history in millimeters of mercury.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value of the patient's diastolic blood pressure recorded in the patient's history, in millimeters of mercury."} ;; "diastolic blood pressure > 120 millimeters of mercury during an acute phase"
(declare-const patient_diastolic_blood_pressure_value_recorded_inthehistory_withunit_millimeters_of_mercury@@measured_during_acute_phase Bool) ;; {"when_to_set_to_true":"Set to true if the diastolic blood pressure measurement was taken during an acute phase.","when_to_set_to_false":"Set to false if the measurement was not taken during an acute phase.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the measurement was taken during an acute phase.","meaning":"Indicates whether the diastolic blood pressure measurement was taken during an acute phase."} ;; "during an acute phase"
(declare-const patient_systolic_blood_pressure_value_recorded_inthepast1weeks_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's systolic blood pressure was recorded one week in the past in millimeters of mercury.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value of the patient's systolic blood pressure recorded one week in the past, in millimeters of mercury."} ;; "systolic blood pressure > 180 millimeters of mercury one week after the hospital visit"
(declare-const patient_systolic_blood_pressure_value_recorded_inthepast1weeks_withunit_millimeters_of_mercury@@temporalcontext_within_1_week_after_hospital_visit Bool) ;; {"when_to_set_to_true":"Set to true if the systolic blood pressure measurement was taken within one week after the hospital visit.","when_to_set_to_false":"Set to false if the measurement was not taken within one week after the hospital visit.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the measurement was taken within one week after the hospital visit.","meaning":"Indicates whether the systolic blood pressure measurement was taken within one week after the hospital visit."} ;; "one week after the hospital visit"
(declare-const patient_diastolic_blood_pressure_value_recorded_inthepast1weeks_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's diastolic blood pressure was recorded one week in the past in millimeters of mercury.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value of the patient's diastolic blood pressure recorded one week in the past, in millimeters of mercury."} ;; "diastolic blood pressure > 110 millimeters of mercury one week after the hospital visit"
(declare-const patient_diastolic_blood_pressure_value_recorded_inthepast1weeks_withunit_millimeters_of_mercury@@temporalcontext_within_1_week_after_hospital_visit Bool) ;; {"when_to_set_to_true":"Set to true if the diastolic blood pressure measurement was taken within one week after the hospital visit.","when_to_set_to_false":"Set to false if the measurement was not taken within one week after the hospital visit.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the measurement was taken within one week after the hospital visit.","meaning":"Indicates whether the diastolic blood pressure measurement was taken within one week after the hospital visit."} ;; "one week after the hospital visit"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (and
    (not (and patient_systolic_blood_pressure_value_recorded_inthehistory_withunit_millimeters_of_mercury@@measured_during_acute_phase
              (> patient_systolic_blood_pressure_value_recorded_inthehistory_withunit_millimeters_of_mercury 220))) ;; "systolic blood pressure > 220 millimeters of mercury during an acute phase"
    (not (and patient_diastolic_blood_pressure_value_recorded_inthehistory_withunit_millimeters_of_mercury@@measured_during_acute_phase
              (> patient_diastolic_blood_pressure_value_recorded_inthehistory_withunit_millimeters_of_mercury 120))) ;; "diastolic blood pressure > 120 millimeters of mercury during an acute phase"
    (not (and patient_systolic_blood_pressure_value_recorded_inthepast1weeks_withunit_millimeters_of_mercury@@temporalcontext_within_1_week_after_hospital_visit
              (> patient_systolic_blood_pressure_value_recorded_inthepast1weeks_withunit_millimeters_of_mercury 180))) ;; "systolic blood pressure > 180 millimeters of mercury one week after the hospital visit"
    (not (and patient_diastolic_blood_pressure_value_recorded_inthepast1weeks_withunit_millimeters_of_mercury@@temporalcontext_within_1_week_after_hospital_visit
              (> patient_diastolic_blood_pressure_value_recorded_inthepast1weeks_withunit_millimeters_of_mercury 110))) ;; "diastolic blood pressure > 110 millimeters of mercury one week after the hospital visit"
))
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient had systolic blood pressure > 220 millimeters of mercury during an acute phase) OR (the patient had diastolic blood pressure > 120 millimeters of mercury during an acute phase) OR (the patient had systolic blood pressure > 180 millimeters of mercury one week after the hospital visit of the patient) OR (the patient had diastolic blood pressure > 110 millimeters of mercury one week after the hospital visit of the patient))."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_secondary_hypertension_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of secondary hypertension.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of secondary hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of secondary hypertension.","meaning":"Boolean indicating whether the patient currently has secondary hypertension."} ;; "secondary hypertension"
(declare-const patient_has_finding_of_secondary_hypertension_now@@related_to_renovascular_disease Bool) ;; {"when_to_set_to_true":"Set to true if the patient's secondary hypertension is related to renovascular disease.","when_to_set_to_false":"Set to false if the patient's secondary hypertension is not related to renovascular disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's secondary hypertension is related to renovascular disease.","meaning":"Boolean indicating whether the patient's secondary hypertension is related to renovascular disease."} ;; "secondary hypertension related to renovascular disease"
(declare-const patient_has_finding_of_secondary_hypertension_now@@related_to_endocrinologic_disease Bool) ;; {"when_to_set_to_true":"Set to true if the patient's secondary hypertension is related to endocrinologic disease.","when_to_set_to_false":"Set to false if the patient's secondary hypertension is not related to endocrinologic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's secondary hypertension is related to endocrinologic disease.","meaning":"Boolean indicating whether the patient's secondary hypertension is related to endocrinologic disease."} ;; "secondary hypertension related to endocrinologic disease"
(declare-const patient_has_finding_of_secondary_hypertension_now@@related_to_pregnancy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's secondary hypertension is related to pregnancy.","when_to_set_to_false":"Set to false if the patient's secondary hypertension is not related to pregnancy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's secondary hypertension is related to pregnancy.","meaning":"Boolean indicating whether the patient's secondary hypertension is related to pregnancy."} ;; "secondary hypertension related to pregnancy"
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "secondary hypertension related to pregnancy"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_secondary_hypertension_now@@related_to_renovascular_disease
      patient_has_finding_of_secondary_hypertension_now)
:named REQ3_AUXILIARY0)) ;; "secondary hypertension related to renovascular disease"

(assert
(! (=> patient_has_finding_of_secondary_hypertension_now@@related_to_endocrinologic_disease
      patient_has_finding_of_secondary_hypertension_now)
:named REQ3_AUXILIARY1)) ;; "secondary hypertension related to endocrinologic disease"

(assert
(! (=> patient_has_finding_of_secondary_hypertension_now@@related_to_pregnancy
      patient_has_finding_of_secondary_hypertension_now)
:named REQ3_AUXILIARY2)) ;; "secondary hypertension related to pregnancy"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_secondary_hypertension_now@@related_to_renovascular_disease)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has secondary hypertension related to renovascular disease."

(assert
(! (not patient_has_finding_of_secondary_hypertension_now@@related_to_endocrinologic_disease)
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has secondary hypertension related to endocrinologic disease."

(assert
(! (not patient_has_finding_of_secondary_hypertension_now@@related_to_pregnancy)
:named REQ3_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has secondary hypertension related to pregnancy."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_went_to_bed_in_the_middle_of_the_day Bool) ;; {"when_to_set_to_true":"Set to true if the patient went to bed in the middle of the day.","when_to_set_to_false":"Set to false if the patient did not go to bed in the middle of the day.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient went to bed in the middle of the day.","meaning":"Boolean indicating whether the patient went to bed in the middle of the day."} ;; "the patient went to bed in the middle of the day"
(declare-const patient_went_to_bed_very_late_at_night Bool) ;; {"when_to_set_to_true":"Set to true if the patient went to bed very late at night.","when_to_set_to_false":"Set to false if the patient did not go to bed very late at night.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient went to bed very late at night.","meaning":"Boolean indicating whether the patient went to bed very late at night."} ;; "the patient went to bed very late at night"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not (or patient_went_to_bed_in_the_middle_of_the_day
            patient_went_to_bed_very_late_at_night))
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient went to bed in the middle of the day) OR (the patient went to bed very late at night))."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_is_exposed_to_anticoagulant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to any anticoagulant substance.","when_to_set_to_false":"Set to false if the patient is currently not exposed to any anticoagulant substance.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to any anticoagulant substance.","meaning":"Boolean indicating whether the patient is currently exposed to anticoagulant substances."} ;; "the patient was using intravenous anticoagulant drugs"
(declare-const patient_is_exposed_to_anticoagulant_now@@administered_intravenously Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to anticoagulant substances and the exposure is via intravenous administration.","when_to_set_to_false":"Set to false if the patient is currently exposed to anticoagulant substances but not via intravenous administration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the route of administration is intravenous.","meaning":"Boolean indicating whether the patient's current exposure to anticoagulant substances is via intravenous administration."} ;; "the patient was using intravenous anticoagulant drugs"
(declare-const patient_is_exposed_to_thrombolytic_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to any thrombolytic agent.","when_to_set_to_false":"Set to false if the patient is currently not exposed to any thrombolytic agent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to any thrombolytic agent.","meaning":"Boolean indicating whether the patient is currently exposed to thrombolytic agents."} ;; "the patient was using intravenous thrombolytic drugs"
(declare-const patient_is_exposed_to_thrombolytic_agent_now@@administered_intravenously Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to thrombolytic agents and the exposure is via intravenous administration.","when_to_set_to_false":"Set to false if the patient is currently exposed to thrombolytic agents but not via intravenous administration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the route of administration is intravenous.","meaning":"Boolean indicating whether the patient's current exposure to thrombolytic agents is via intravenous administration."} ;; "the patient was using intravenous thrombolytic drugs"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_is_exposed_to_anticoagulant_now@@administered_intravenously
      patient_is_exposed_to_anticoagulant_now)
   :named REQ5_AUXILIARY0)) ;; "the patient was using intravenous anticoagulant drugs"

(assert
(! (=> patient_is_exposed_to_thrombolytic_agent_now@@administered_intravenously
      patient_is_exposed_to_thrombolytic_agent_now)
   :named REQ5_AUXILIARY1)) ;; "the patient was using intravenous thrombolytic drugs"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_is_exposed_to_anticoagulant_now@@administered_intravenously)
   :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient was using intravenous anticoagulant drugs."

(assert
(! (not patient_is_exposed_to_thrombolytic_agent_now@@administered_intravenously)
   :named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient was using intravenous thrombolytic drugs."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const nih_stroke_scale_value_recorded_now_withunit_score Real) ;; {"when_to_set_to_value":"Set to the value of the patient's current National Institutes of Health stroke scale score if it is recorded now.","when_to_set_to_null":"Set to null if the patient's current National Institutes of Health stroke scale score is unknown, not documented, or cannot be determined.","meaning":"Numeric variable indicating the patient's current National Institutes of Health stroke scale score, recorded now, with unit 'score'."} ;; "National Institutes of Health stroke scale > 20"
(declare-const patient_has_diagnosis_of_cerebrovascular_accident_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of cerebrovascular accident (stroke).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of cerebrovascular accident (stroke).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of cerebrovascular accident (stroke).","meaning":"Boolean indicating whether the patient currently has a diagnosis of cerebrovascular accident (stroke)."} ;; "stroke"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not (and patient_has_diagnosis_of_cerebrovascular_accident_now
             (> nih_stroke_scale_value_recorded_now_withunit_score 20)))
   :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a severe stroke (National Institutes of Health stroke scale > 20)."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_could_not_give_consent_to_investigators_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently could not give consent to investigators.","when_to_set_to_false":"Set to false if the patient currently could give consent to investigators.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently could not give consent to investigators.","meaning":"Boolean indicating whether the patient currently could not give consent to investigators."} ;; "The patient is excluded if the patient could not give consent to investigators."

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_could_not_give_consent_to_investigators_now)
:named REQ7_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient could not give consent to investigators."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_aspartate_aminotransferase_value_recorded_now_withunit_units_per_liter Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's aspartate aminotransferase (AST) is recorded now in units per liter.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current aspartate aminotransferase (AST) in units per liter."} ;; "aspartate aminotransferase ≥ 100 units per liter"
(declare-const patient_alanine_aminotransferase_value_recorded_now_withunit_units_per_liter Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's alanine aminotransferase (ALT) is recorded now in units per liter.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current alanine aminotransferase (ALT) in units per liter."} ;; "alanine aminotransferase ≥ 100 units per liter"
(declare-const patients_liver_function_is_abnormal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current liver function is abnormal (not within the normal range) as determined now.","when_to_set_to_false":"Set to false if the patient's current liver function is normal as determined now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current liver function is abnormal.","meaning":"Boolean indicating whether the patient's current liver function is abnormal now."} ;; "liver function abnormal"
(declare-const patients_liver_function_is_abnormal_now@@severely_impaired Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current liver function is severely impaired (not just abnormal).","when_to_set_to_false":"Set to false if the patient's current liver function is abnormal but not severely impaired, or is normal.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current liver function is severely impaired.","meaning":"Boolean indicating whether the patient's current liver function is severely impaired now."} ;; "severely impaired liver function"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Definition: severely impaired liver function is present if either AST ≥ 100 or ALT ≥ 100
(assert
(! (= patients_liver_function_is_abnormal_now@@severely_impaired
(or (>= patient_aspartate_aminotransferase_value_recorded_now_withunit_units_per_liter 100)
    (>= patient_alanine_aminotransferase_value_recorded_now_withunit_units_per_liter 100)))
:named REQ8_AUXILIARY0)) ;; "severely impaired liver function (aspartate aminotransferase ≥ 100 units per liter OR alanine aminotransferase ≥ 100 units per liter)"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patients_liver_function_is_abnormal_now@@severely_impaired
      patients_liver_function_is_abnormal_now)
:named REQ8_AUXILIARY1)) ;; "severely impaired liver function is a subset of abnormal liver function"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patients_liver_function_is_abnormal_now@@severely_impaired)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has severely impaired liver function (aspartate aminotransferase ≥ 100 units per liter)) OR (the patient has severely impaired liver function (alanine aminotransferase ≥ 100 units per liter)))."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_creatinine_measurement_serum_value_recorded_now_withunit_milligrams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of serum creatinine recorded now in milligrams per deciliter is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's serum creatinine measured now in milligrams per deciliter."} ;; "serum creatinine ≥ 2.0 milligrams per deciliter"

(declare-const patient_renal_function_value_recorded_now_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of renal function recorded now is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's renal function measured now."} ;; "renal function"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not (>= patient_creatinine_measurement_serum_value_recorded_now_withunit_milligrams_per_deciliter 2.0))
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severely impaired renal function (serum creatinine ≥ 2.0 milligrams per deciliter)."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malignant neoplastic disease (cancer).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of malignant neoplastic disease (cancer).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of malignant neoplastic disease (cancer).","meaning":"Boolean indicating whether the patient currently has a diagnosis of malignant neoplastic disease (cancer)."} ;; "cancer"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_has_diagnosis_of_malignant_neoplastic_disease_now)
:named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has cancer."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_is_pregnant_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if there is documented evidence that the patient was pregnant at any point in their medical history.","when_to_set_to_false":"Set to false if there is documented evidence that the patient was never pregnant at any point in their medical history.","when_to_set_to_null":"Set to null if there is insufficient information to determine whether the patient was ever pregnant in their medical history.","meaning":"Boolean value indicating whether the patient was ever pregnant at any point in their medical history."} ;; "the patient was pregnant"
(declare-const patient_is_lactating_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if there is documented evidence that the patient was lactating at any point in their medical history.","when_to_set_to_false":"Set to false if there is documented evidence that the patient was never lactating at any point in their medical history.","when_to_set_to_null":"Set to null if there is insufficient information to determine whether the patient was ever lactating in their medical history.","meaning":"Boolean value indicating whether the patient was ever lactating at any point in their medical history."} ;; "the patient was lactating"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_is_pregnant_inthehistory)
:named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient was pregnant."

(assert
(! (not patient_is_lactating_inthehistory)
:named REQ11_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient was lactating."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_finding_of_grave_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any other grave disease (serious or life-threatening illness) not otherwise specified, aside from those already listed (hypertensive encephalopathy, aortic dissection, acute myocardial infarction, severe congestive heart failure).","when_to_set_to_false":"Set to false if the patient currently does not have any other grave disease (serious or life-threatening illness) not otherwise specified.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any other grave disease (serious or life-threatening illness) not otherwise specified.","meaning":"Boolean indicating whether the patient currently has any other grave disease (serious or life-threatening illness) not otherwise specified."} ;; "other grave diseases"
(declare-const patient_has_finding_of_hypertensive_encephalopathy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hypertensive encephalopathy.","when_to_set_to_false":"Set to false if the patient currently does not have hypertensive encephalopathy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypertensive encephalopathy.","meaning":"Boolean indicating whether the patient currently has hypertensive encephalopathy."} ;; "hypertensive encephalopathy"
(declare-const patient_has_finding_of_dissection_of_aorta_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has aortic dissection.","when_to_set_to_false":"Set to false if the patient currently does not have aortic dissection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has aortic dissection.","meaning":"Boolean indicating whether the patient currently has aortic dissection."} ;; "aortic dissection"
(declare-const patient_has_finding_of_acute_myocardial_infarction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has acute myocardial infarction.","when_to_set_to_false":"Set to false if the patient currently does not have acute myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has acute myocardial infarction.","meaning":"Boolean indicating whether the patient currently has acute myocardial infarction."} ;; "acute myocardial infarction"
(declare-const patient_has_finding_of_congestive_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has congestive heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have congestive heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has congestive heart failure.","meaning":"Boolean indicating whether the patient currently has congestive heart failure."} ;; "congestive heart failure"
(declare-const patient_has_finding_of_congestive_heart_failure_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has congestive heart failure and the condition is severe.","when_to_set_to_false":"Set to false if the patient currently has congestive heart failure but the condition is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's congestive heart failure is severe.","meaning":"Boolean indicating whether the patient's congestive heart failure is severe."} ;; "severe congestive heart failure"

;; ===================== Auxiliary Assertions (REQ 12) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_hypertensive_encephalopathy_now
           patient_has_finding_of_dissection_of_aorta_now
           patient_has_finding_of_acute_myocardial_infarction_now
           patient_has_finding_of_congestive_heart_failure_now@@severe)
        patient_has_finding_of_grave_disease_now)
   :named REQ12_AUXILIARY0)) ;; "with non-exhaustive examples ((hypertensive encephalopathy) OR (aortic dissection) OR (acute myocardial infarction) OR (severe congestive heart failure))."

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_congestive_heart_failure_now@@severe
       patient_has_finding_of_congestive_heart_failure_now)
   :named REQ12_AUXILIARY1)) ;; "severe congestive heart failure" implies "congestive heart failure"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not patient_has_finding_of_grave_disease_now)
   :named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has other grave diseases with non-exhaustive examples ((hypertensive encephalopathy) OR (aortic dissection) OR (acute myocardial infarction) OR (severe congestive heart failure))."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_has_allergy_to_drug_or_medicament_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of allergy to any drug or medicament (specifically the test drug).","when_to_set_to_false":"Set to false if the patient does not have a documented history of allergy to any drug or medicament (specifically the test drug).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of allergy to any drug or medicament (specifically the test drug).","meaning":"Boolean indicating whether the patient has a history of allergy to any drug or medicament."} ;; "the patient was allergic to the test drug OR the patient was allergic to the control drug"
(declare-const patient_has_allergy_to_drug_or_medicament_inthehistory@@test_drug Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament to which the patient is allergic is the test drug.","when_to_set_to_false":"Set to false if the drug or medicament to which the patient is allergic is not the test drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament to which the patient is allergic is the test drug.","meaning":"Boolean indicating whether the allergy is specifically to the test drug."} ;; "the patient was allergic to the test drug"
(declare-const patient_has_allergy_to_drug_or_medicament_inthehistory@@control_drug Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament to which the patient is allergic is the control drug.","when_to_set_to_false":"Set to false if the drug or medicament to which the patient is allergic is not the control drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament to which the patient is allergic is the control drug.","meaning":"Boolean indicating whether the allergy is specifically to the control drug."} ;; "the patient was allergic to the control drug"

;; ===================== Auxiliary Assertions (REQ 13) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_allergy_to_drug_or_medicament_inthehistory@@test_drug
      patient_has_allergy_to_drug_or_medicament_inthehistory)
:named REQ13_AUXILIARY0)) ;; "the patient was allergic to the test drug"

(assert
(! (=> patient_has_allergy_to_drug_or_medicament_inthehistory@@control_drug
      patient_has_allergy_to_drug_or_medicament_inthehistory)
:named REQ13_AUXILIARY1)) ;; "the patient was allergic to the control drug"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not patient_has_allergy_to_drug_or_medicament_inthehistory@@test_drug)
:named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient was allergic to the test drug"

(assert
(! (not patient_has_allergy_to_drug_or_medicament_inthehistory@@control_drug)
:named REQ13_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient was allergic to the control drug"
