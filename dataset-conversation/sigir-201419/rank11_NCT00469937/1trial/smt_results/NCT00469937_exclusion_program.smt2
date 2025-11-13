;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const zubrod_performance_status_value_recorded_now_withunit_none Real) ;; {"when_to_set_to_value":"Set to the value of the patient's Zubrod performance status as recorded now (e.g., 0, 1, 2, etc.).","when_to_set_to_null":"Set to null if the patient's Zubrod performance status is unknown, not documented, or cannot be determined at the current time.","meaning":"Numeric value representing the patient's Zubrod performance status as recorded now, with no physical unit."} ;; "Numeric variable indicating the patient's Zubrod performance status value as recorded at the current time. The Zubrod performance status is a scale from 0 to 5, with no physical unit."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not (or (= zubrod_performance_status_value_recorded_now_withunit_none 0)
              (= zubrod_performance_status_value_recorded_now_withunit_none 1)
              (= zubrod_performance_status_value_recorded_now_withunit_none 2)))
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if NOT ((the patient has Zubrod performance status = 0) OR (the patient has Zubrod performance status = 1) OR (the patient has Zubrod performance status = 2))."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_longevity_value_recorded_now_withunit_weeks Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's current life expectancy in weeks if available.","when_to_set_to_null":"Set to null if the patient's current life expectancy in weeks is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current life expectancy in weeks."} ;; "life expectancy"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not (>= patient_longevity_value_recorded_now_withunit_weeks 8))
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient does not have life expectancy ≥ 8 weeks."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_platelet_count_finding_value_recorded_now_withunit_per_cubic_millimeter Real) ;; {"when_to_set_to_value":"Set to the measured value if a platelet count (per cubic millimeter) is recorded for the patient now.","when_to_set_to_null":"Set to null if no platelet count measurement is available for the patient now or the value is indeterminate.","meaning":"Numeric value representing the patient's current platelet count (per cubic millimeter) measured now."} ;; "platelet count"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (> patient_platelet_count_finding_value_recorded_now_withunit_per_cubic_millimeter 100000))
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient does not have platelet count > 100,000 per cubic millimeter."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const absolute_neutrophil_count_value_recorded_now_withunit_per_cubic_millimeter Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's absolute neutrophil count measured at the current time, in units of per cubic millimeter.","when_to_set_to_null":"Set to null if the patient's absolute neutrophil count at the current time is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's absolute neutrophil count measured now, in units of per cubic millimeter."} ;; "absolute neutrophil count measured at the current time, with units of per cubic millimeter"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not (> absolute_neutrophil_count_value_recorded_now_withunit_per_cubic_millimeter 1500))
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if NOT (the patient has absolute neutrophil count > 1,500 per cubic millimeter)."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_hemoglobin_concentration_dipstick_finding_value_recorded_now_withunit_grams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's hemoglobin concentration in grams per deciliter is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current hemoglobin concentration in grams per deciliter."} ;; "hemoglobin concentration"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not (>= patient_hemoglobin_concentration_dipstick_finding_value_recorded_now_withunit_grams_per_deciliter 10))
    :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if NOT (the patient has hemoglobin concentration ≥ 10 grams per deciliter)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_blood_urea_nitrogen_measurement_value_recorded_now_withunit_milligrams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's blood urea nitrogen concentration (in milligrams per deciliter) is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available now or the value is indeterminate.","meaning":"Numeric value of the patient's current blood urea nitrogen concentration in milligrams per deciliter."} ;; "blood urea nitrogen concentration"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not (< patient_blood_urea_nitrogen_measurement_value_recorded_now_withunit_milligrams_per_deciliter 25))
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if NOT (the patient has blood urea nitrogen concentration < 25 milligrams per deciliter)."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_creatinine_level_finding_value_recorded_now_withunit_milligrams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's creatinine concentration (in milligrams per deciliter) is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value of the patient's current creatinine concentration in milligrams per deciliter."} ;; "creatinine concentration"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not (< patient_creatinine_level_finding_value_recorded_now_withunit_milligrams_per_deciliter 1.5))
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if NOT (the patient has creatinine concentration < 1.5 milligrams per deciliter)."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_bilirubin_level_finding_value_recorded_now_withunit_milligrams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the measured bilirubin concentration value in milligrams per deciliter if a current measurement is available.","when_to_set_to_null":"Set to null if no current bilirubin concentration measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current bilirubin concentration in milligrams per deciliter."} ;; "bilirubin concentration"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! (not (< patient_bilirubin_level_finding_value_recorded_now_withunit_milligrams_per_deciliter 1.5))
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient does not have bilirubin concentration < 1.5 milligrams per deciliter."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_alanine_aminotransferase_measurement_value_recorded_now_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's alanine aminotransferase concentration is recorded now with a valid unit.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current alanine aminotransferase concentration."} ;; "alanine aminotransferase concentration"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
  (! (not (<= patient_alanine_aminotransferase_measurement_value_recorded_now_withunit_unit 2))
     :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if NOT (the patient has alanine aminotransferase concentration ≤ 2 times normal)."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_sodium_level_finding_value_recorded_now_withunit_milligrams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's sodium concentration in milligrams per deciliter is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value of the patient's current sodium concentration in milligrams per deciliter."} ;; "sodium concentration"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not (> patient_sodium_level_finding_value_recorded_now_withunit_milligrams_per_deciliter 136))
    :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient does not have sodium concentration > 136 milligrams per deciliter."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breastfeeding.","when_to_set_to_false":"Set to false if the patient is currently not breastfeeding.","when_to_set_to_null":"Set to null if the patient's current breastfeeding status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently breastfeeding."} ;; "the patient is nursing"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
  (! (not patient_is_pregnant_now)
     :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

(assert
  (! (not patient_is_breastfeeding_now)
     :named REQ10_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is nursing."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_pregnancy_test_result_negative_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a pregnancy test result that is negative.","when_to_set_to_false":"Set to false if the patient currently has a pregnancy test result that is not negative (i.e., positive, indeterminate, or otherwise not negative).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a negative pregnancy test result.","meaning":"Boolean indicating whether the patient currently has a negative pregnancy test result."} ;; "the patient does NOT have a negative pregnancy test result"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_has_pregnancy_test_result_negative_now)
:named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient does NOT have a negative pregnancy test result."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently considered to have childbearing potential (i.e., is fertile).","when_to_set_to_false":"Set to false if the patient is currently considered to not have childbearing potential (i.e., is infertile, postmenopausal, or otherwise unable to conceive).","when_to_set_to_null":"Set to null if the patient's childbearing potential status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient currently has the potential for childbearing (i.e., is fertile)."} ;; "the patient is fertile"
(declare-const patient_has_finding_of_contraception_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently uses any form of contraception.","when_to_set_to_false":"Set to false if the patient currently does not use any form of contraception.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently uses contraception.","meaning":"Boolean indicating whether the patient currently uses contraception."} ;; "contraception"
(declare-const patient_has_finding_of_contraception_now@@is_effective Bool) ;; {"when_to_set_to_true":"Set to true if the contraception used by the patient is effective.","when_to_set_to_false":"Set to false if the contraception used by the patient is not effective.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the contraception used by the patient is effective.","meaning":"Boolean indicating whether the contraception used by the patient is effective."} ;; "effective contraception"

;; ===================== Auxiliary Assertions (REQ 12) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_contraception_now@@is_effective
      patient_has_finding_of_contraception_now)
:named REQ12_AUXILIARY0)) ;; "contraception" and "effective contraception"

;; ===================== Constraint Assertions (REQ 12) =====================
;; Exclusion: patient is fertile AND does NOT use effective contraception
(assert
(! (not (and patient_has_childbearing_potential_now
             (not patient_has_finding_of_contraception_now@@is_effective)))
:named REQ12_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if (the patient is fertile) AND (the patient does NOT use effective contraception)."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_has_finding_of_neurological_stability_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has neurological stability.","when_to_set_to_false":"Set to false if the patient currently does not have neurological stability.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has neurological stability.","meaning":"Boolean indicating whether the patient currently has neurological stability."} ;; "neurological stability"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not patient_has_finding_of_neurological_stability_now)
:named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient does not have neurological stability."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_has_finding_of_seizure_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding or diagnosis of seizure disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding or diagnosis of seizure disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding or diagnosis of seizure disorder.","meaning":"Boolean indicating whether the patient currently has a clinical finding or diagnosis of seizure disorder."} ;; "seizure disorder"

(declare-const patient_has_finding_of_seizure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding or diagnosis of seizure.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding or diagnosis of seizure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding or diagnosis of seizure.","meaning":"Boolean indicating whether the patient currently has a clinical finding or diagnosis of seizure."} ;; "seizures"

(declare-const patient_has_finding_of_seizure_now@@caused_by_brain_metastases Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current seizures are caused by brain metastases.","when_to_set_to_false":"Set to false if the patient's current seizures are not caused by brain metastases.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current seizures are caused by brain metastases.","meaning":"Boolean indicating whether the patient's current seizures are caused by brain metastases."} ;; "seizures due to brain metastases"

;; ===================== Auxiliary Assertions (REQ 14) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_seizure_now@@caused_by_brain_metastases
      patient_has_finding_of_seizure_now)
   :named REQ14_AUXILIARY0)) ;; "seizures due to brain metastases" implies "seizures"

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
(! (not patient_has_finding_of_seizure_disorder_now)
   :named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has seizure disorder."

(assert
(! (not patient_has_finding_of_seizure_now@@caused_by_brain_metastases)
   :named REQ14_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has seizures due to brain metastases."

;; ===================== Declarations for the exclusion criterion (REQ 15) =====================
(declare-const patient_has_finding_of_illness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any medical illness.","when_to_set_to_false":"Set to false if the patient currently does not have any medical illness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any medical illness.","meaning":"Boolean indicating whether the patient currently has any medical illness."} ;; "medical illness"
(declare-const patient_has_finding_of_illness_now@@would_preclude_completion_of_study_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a medical illness and that illness would preclude completion of study treatment.","when_to_set_to_false":"Set to false if the patient currently has a medical illness but it would not preclude completion of study treatment, or if the patient does not have a medical illness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the medical illness would preclude completion of study treatment.","meaning":"Boolean indicating whether the patient's current medical illness would preclude completion of study treatment."} ;; "medical illness that would preclude completion of study treatment"
(declare-const patient_has_finding_of_mental_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any psychiatric condition.","when_to_set_to_false":"Set to false if the patient currently does not have any psychiatric condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any psychiatric condition.","meaning":"Boolean indicating whether the patient currently has any psychiatric condition."} ;; "psychiatric condition"
(declare-const patient_has_finding_of_mental_disorder_now@@would_preclude_completion_of_study_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a psychiatric condition and that condition would preclude completion of study treatment.","when_to_set_to_false":"Set to false if the patient currently has a psychiatric condition but it would not preclude completion of study treatment, or if the patient does not have a psychiatric condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the psychiatric condition would preclude completion of study treatment.","meaning":"Boolean indicating whether the patient's current psychiatric condition would preclude completion of study treatment."} ;; "psychiatric condition that would preclude completion of study treatment"

;; ===================== Auxiliary Assertions (REQ 15) =====================
;; Qualifier variable implies corresponding stem variable for medical illness
(assert
(! (=> patient_has_finding_of_illness_now@@would_preclude_completion_of_study_treatment
      patient_has_finding_of_illness_now)
:named REQ15_AUXILIARY0)) ;; "medical illness that would preclude completion of study treatment"

;; Qualifier variable implies corresponding stem variable for psychiatric condition
(assert
(! (=> patient_has_finding_of_mental_disorder_now@@would_preclude_completion_of_study_treatment
      patient_has_finding_of_mental_disorder_now)
:named REQ15_AUXILIARY1)) ;; "psychiatric condition that would preclude completion of study treatment"

;; ===================== Constraint Assertions (REQ 15) =====================
(assert
(! (not patient_has_finding_of_illness_now@@would_preclude_completion_of_study_treatment)
   :named REQ15_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has medical illness that would preclude completion of study treatment."

(assert
(! (not patient_has_finding_of_mental_disorder_now@@would_preclude_completion_of_study_treatment)
   :named REQ15_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has psychiatric condition that would preclude completion of study treatment."

;; ===================== Declarations for the exclusion criterion (REQ 16) =====================
(declare-const patient_has_finding_of_sensory_neuropathy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of sensory neuropathy.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of sensory neuropathy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of sensory neuropathy.","meaning":"Boolean indicating whether the patient currently has sensory neuropathy."} ;; "sensory neuropathy"
(declare-const sensory_neuropathy_grade_value_recorded_now_withunit_integer Real) ;; {"when_to_set_to_value":"Set to the integer value representing the grade of sensory neuropathy currently recorded for the patient.","when_to_set_to_null":"Set to null if the grade of sensory neuropathy is unknown, not documented, or cannot be determined for the patient.","meaning":"Numeric value indicating the grade of sensory neuropathy currently recorded for the patient, using integer units."} ;; "grade greater than or equal to 2"

;; ===================== Constraint Assertions (REQ 16) =====================
(assert
(! (not (and patient_has_finding_of_sensory_neuropathy_now
             (>= sensory_neuropathy_grade_value_recorded_now_withunit_integer 2)))
   :named REQ16_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has sensory neuropathy of grade greater than or equal to 2."

;; ===================== Declarations for the exclusion criterion (REQ 17) =====================
(declare-const patient_has_finding_of_bipolar_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of bipolar disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of bipolar disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of bipolar disorder.","meaning":"Boolean indicating whether the patient currently has bipolar disorder."} ;; "bipolar disorder"

;; ===================== Constraint Assertions (REQ 17) =====================
(assert
(! (not patient_has_finding_of_bipolar_disorder_now)
:named REQ17_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has bipolar disorder."

;; ===================== Declarations for the exclusion criterion (REQ 18) =====================
(declare-const patient_has_finding_of_disorder_of_thyroid_gland_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of disorder of the thyroid gland (thyroid disease).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of disorder of the thyroid gland (thyroid disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of disorder of the thyroid gland (thyroid disease).","meaning":"Boolean indicating whether the patient currently has a disorder of the thyroid gland (thyroid disease)."} ;; "thyroid disease"

;; ===================== Constraint Assertions (REQ 18) =====================
(assert
  (! (not patient_has_finding_of_disorder_of_thyroid_gland_now)
     :named REQ18_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has thyroid disease."

;; ===================== Declarations for the exclusion criterion (REQ 19) =====================
(declare-const patient_has_finding_of_prolonged_qt_interval_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of prolonged QT interval.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of prolonged QT interval.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of prolonged QT interval.","meaning":"Boolean indicating whether the patient currently has prolonged QT interval."} ;; "QT interval prolongation"
(declare-const patient_has_finding_of_prolonged_qt_interval_now@@corrected Bool) ;; {"when_to_set_to_true":"Set to true if the patient's prolonged QT interval is in the corrected QT interval (QTc).","when_to_set_to_false":"Set to false if the patient's prolonged QT interval is not in the corrected QT interval (QTc).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the prolonged QT interval is in the corrected QT interval (QTc).","meaning":"Boolean indicating whether the patient's prolonged QT interval is in the corrected QT interval (QTc)."} ;; "corrected QT interval prolongation"

;; ===================== Auxiliary Assertions (REQ 19) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_prolonged_qt_interval_now@@corrected
      patient_has_finding_of_prolonged_qt_interval_now)
:named REQ19_AUXILIARY0)) ;; "corrected QT interval prolongation"

;; ===================== Constraint Assertions (REQ 19) =====================
(assert
(! (not patient_has_finding_of_prolonged_qt_interval_now@@corrected)
:named REQ19_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has corrected QT interval prolongation."

;; ===================== Declarations for the exclusion criterion (REQ 20) =====================
(declare-const patient_has_undergone_chemotherapy_inthepast2weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone chemotherapy within the past 2 weeks.","when_to_set_to_false":"Set to false if the patient has not undergone chemotherapy within the past 2 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone chemotherapy within the past 2 weeks.","meaning":"Boolean indicating whether the patient has undergone chemotherapy within the past 2 weeks."} ;; "the patient has had chemotherapy within the past 2 weeks"
(declare-const patient_is_undergoing_chemotherapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing chemotherapy.","when_to_set_to_false":"Set to false if the patient is not currently undergoing chemotherapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing chemotherapy.","meaning":"Boolean indicating whether the patient is currently undergoing chemotherapy."} ;; "the patient is receiving concurrent chemotherapy"

;; ===================== Constraint Assertions (REQ 20) =====================
(assert
(! (not (or patient_has_undergone_chemotherapy_inthepast2weeks
            patient_is_undergoing_chemotherapy_now))
   :named REQ20_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has had chemotherapy within the past 2 weeks) OR (the patient is receiving concurrent chemotherapy))."

;; ===================== Declarations for the exclusion criterion (REQ 21) =====================
(declare-const patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_inthepast2weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to a nonsteroidal anti-inflammatory agent within the past 2 weeks.","when_to_set_to_false":"Set to false if the patient has not been exposed to a nonsteroidal anti-inflammatory agent within the past 2 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to a nonsteroidal anti-inflammatory agent within the past 2 weeks.","meaning":"Boolean indicating whether the patient has been exposed to a nonsteroidal anti-inflammatory agent within the past 2 weeks."} ;; "nonsteroidal anti-inflammatory drug within the past 2 weeks"
(declare-const patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently being exposed to a nonsteroidal anti-inflammatory agent.","when_to_set_to_false":"Set to false if the patient is not currently being exposed to a nonsteroidal anti-inflammatory agent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being exposed to a nonsteroidal anti-inflammatory agent.","meaning":"Boolean indicating whether the patient is currently being exposed to a nonsteroidal anti-inflammatory agent."} ;; "nonsteroidal anti-inflammatory drug concurrently"
(declare-const patient_is_exposed_to_enalapril_inthepast2weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to enalapril within the past 2 weeks.","when_to_set_to_false":"Set to false if the patient has not been exposed to enalapril within the past 2 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to enalapril within the past 2 weeks.","meaning":"Boolean indicating whether the patient has been exposed to enalapril within the past 2 weeks."} ;; "enalapril within the past 2 weeks"
(declare-const patient_is_exposed_to_enalapril_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently being exposed to enalapril.","when_to_set_to_false":"Set to false if the patient is not currently being exposed to enalapril.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being exposed to enalapril.","meaning":"Boolean indicating whether the patient is currently being exposed to enalapril."} ;; "enalapril concurrently"
(declare-const patient_is_exposed_to_captopril_inthepast2weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to captopril within the past 2 weeks.","when_to_set_to_false":"Set to false if the patient has not been exposed to captopril within the past 2 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to captopril within the past 2 weeks.","meaning":"Boolean indicating whether the patient has been exposed to captopril within the past 2 weeks."} ;; "captopril within the past 2 weeks"
(declare-const patient_is_exposed_to_captopril_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently being exposed to captopril.","when_to_set_to_false":"Set to false if the patient is not currently being exposed to captopril.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being exposed to captopril.","meaning":"Boolean indicating whether the patient is currently being exposed to captopril."} ;; "captopril concurrently"
(declare-const patient_is_exposed_to_calcium_channel_blocker_inthepast2weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to a calcium channel blocker within the past 2 weeks.","when_to_set_to_false":"Set to false if the patient has not been exposed to a calcium channel blocker within the past 2 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to a calcium channel blocker within the past 2 weeks.","meaning":"Boolean indicating whether the patient has been exposed to a calcium channel blocker within the past 2 weeks."} ;; "calcium channel blocker within the past 2 weeks"
(declare-const patient_is_exposed_to_calcium_channel_blocker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently being exposed to a calcium channel blocker.","when_to_set_to_false":"Set to false if the patient is not currently being exposed to a calcium channel blocker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being exposed to a calcium channel blocker.","meaning":"Boolean indicating whether the patient is currently being exposed to a calcium channel blocker."} ;; "calcium channel blocker concurrently"
(declare-const patient_is_exposed_to_diuretic_inthepast2weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to a diuretic within the past 2 weeks.","when_to_set_to_false":"Set to false if the patient has not been exposed to a diuretic within the past 2 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to a diuretic within the past 2 weeks.","meaning":"Boolean indicating whether the patient has been exposed to a diuretic within the past 2 weeks."} ;; "diuretic within the past 2 weeks"
(declare-const patient_is_exposed_to_diuretic_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently being exposed to a diuretic.","when_to_set_to_false":"Set to false if the patient is not currently being exposed to a diuretic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being exposed to a diuretic.","meaning":"Boolean indicating whether the patient is currently being exposed to a diuretic."} ;; "diuretic concurrently"
(declare-const patient_is_exposed_to_cyclooxygenase_2_inhibitor_inthepast2weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to a selective cyclooxygenase-2 inhibitor within the past 2 weeks.","when_to_set_to_false":"Set to false if the patient has not been exposed to a selective cyclooxygenase-2 inhibitor within the past 2 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to a selective cyclooxygenase-2 inhibitor within the past 2 weeks.","meaning":"Boolean indicating whether the patient has been exposed to a selective cyclooxygenase-2 inhibitor within the past 2 weeks."} ;; "selective cyclooxygenase-2 inhibitor within the past 2 weeks"
(declare-const patient_is_exposed_to_cyclooxygenase_2_inhibitor_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently being exposed to a selective cyclooxygenase-2 inhibitor.","when_to_set_to_false":"Set to false if the patient is not currently being exposed to a selective cyclooxygenase-2 inhibitor.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being exposed to a selective cyclooxygenase-2 inhibitor.","meaning":"Boolean indicating whether the patient is currently being exposed to a selective cyclooxygenase-2 inhibitor."} ;; "selective cyclooxygenase-2 inhibitor concurrently"
(declare-const patient_is_exposed_to_acetazolamide_inthepast2weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to acetazolamide within the past 2 weeks.","when_to_set_to_false":"Set to false if the patient has not been exposed to acetazolamide within the past 2 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to acetazolamide within the past 2 weeks.","meaning":"Boolean indicating whether the patient has been exposed to acetazolamide within the past 2 weeks."} ;; "acetazolamide within the past 2 weeks"
(declare-const patient_is_exposed_to_acetazolamide_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently being exposed to acetazolamide.","when_to_set_to_false":"Set to false if the patient is not currently being exposed to acetazolamide.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being exposed to acetazolamide.","meaning":"Boolean indicating whether the patient is currently being exposed to acetazolamide."} ;; "acetazolamide concurrently"
(declare-const patient_is_exposed_to_urea_inthepast2weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to urea within the past 2 weeks.","when_to_set_to_false":"Set to false if the patient has not been exposed to urea within the past 2 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to urea within the past 2 weeks.","meaning":"Boolean indicating whether the patient has been exposed to urea within the past 2 weeks."} ;; "urea within the past 2 weeks"
(declare-const patient_is_exposed_to_urea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently being exposed to urea.","when_to_set_to_false":"Set to false if the patient is not currently being exposed to urea.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being exposed to urea.","meaning":"Boolean indicating whether the patient is currently being exposed to urea."} ;; "urea concurrently"
(declare-const patient_is_exposed_to_xanthine_inthepast2weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to xanthine within the past 2 weeks.","when_to_set_to_false":"Set to false if the patient has not been exposed to xanthine within the past 2 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to xanthine within the past 2 weeks.","meaning":"Boolean indicating whether the patient has been exposed to xanthine within the past 2 weeks."} ;; "xanthine within the past 2 weeks"
(declare-const patient_is_exposed_to_xanthine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently being exposed to xanthine.","when_to_set_to_false":"Set to false if the patient is not currently being exposed to xanthine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being exposed to xanthine.","meaning":"Boolean indicating whether the patient is currently being exposed to xanthine."} ;; "xanthine concurrently"
(declare-const patient_is_exposed_to_sodium_bicarbonate_inthepast2weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to sodium bicarbonate within the past 2 weeks.","when_to_set_to_false":"Set to false if the patient has not been exposed to sodium bicarbonate within the past 2 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to sodium bicarbonate within the past 2 weeks.","meaning":"Boolean indicating whether the patient has been exposed to sodium bicarbonate within the past 2 weeks."} ;; "sodium bicarbonate within the past 2 weeks"
(declare-const patient_is_exposed_to_sodium_bicarbonate_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently being exposed to sodium bicarbonate.","when_to_set_to_false":"Set to false if the patient is not currently being exposed to sodium bicarbonate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being exposed to sodium bicarbonate.","meaning":"Boolean indicating whether the patient is currently being exposed to sodium bicarbonate."} ;; "sodium bicarbonate concurrently"
(declare-const patient_is_exposed_to_angiotensin_converting_enzyme_inhibitor_inthepast2weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to any angiotensin-converting enzyme inhibitor within the past 2 weeks.","when_to_set_to_false":"Set to false if the patient has not been exposed to any angiotensin-converting enzyme inhibitor within the past 2 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to any angiotensin-converting enzyme inhibitor within the past 2 weeks.","meaning":"Boolean indicating whether the patient has been exposed to any angiotensin-converting enzyme inhibitor within the past 2 weeks."} ;; "angiotensin-converting enzyme inhibitor within the past 2 weeks"
(declare-const patient_is_exposed_to_angiotensin_converting_enzyme_inhibitor_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently being exposed to any angiotensin-converting enzyme inhibitor.","when_to_set_to_false":"Set to false if the patient is not currently being exposed to any angiotensin-converting enzyme inhibitor.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being exposed to any angiotensin-converting enzyme inhibitor.","meaning":"Boolean indicating whether the patient is currently being exposed to any angiotensin-converting enzyme inhibitor."} ;; "angiotensin-converting enzyme inhibitor concurrently"
(declare-const patient_is_exposed_to_alkalinizing_agent_inthepast2weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to any alkalinizing agent within the past 2 weeks.","when_to_set_to_false":"Set to false if the patient has not been exposed to any alkalinizing agent within the past 2 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to any alkalinizing agent within the past 2 weeks.","meaning":"Boolean indicating whether the patient has been exposed to any alkalinizing agent within the past 2 weeks."} ;; "alkalinizing agent within the past 2 weeks"
(declare-const patient_is_exposed_to_alkalinizing_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently being exposed to any alkalinizing agent.","when_to_set_to_false":"Set to false if the patient is not currently being exposed to any alkalinizing agent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being exposed to any alkalinizing agent.","meaning":"Boolean indicating whether the patient is currently being exposed to any alkalinizing agent."} ;; "alkalinizing agent concurrently"

;; ===================== Auxiliary Assertions (REQ 21) =====================
;; Non-exhaustive examples for angiotensin-converting enzyme inhibitor
(assert
(! (=> (or patient_is_exposed_to_enalapril_inthepast2weeks
           patient_is_exposed_to_captopril_inthepast2weeks)
       patient_is_exposed_to_angiotensin_converting_enzyme_inhibitor_inthepast2weeks)
   :named REQ21_AUXILIARY0)) ;; "angiotensin-converting enzyme inhibitor with non-exhaustive examples (enalapril, captopril) within the past 2 weeks"

(assert
(! (=> (or patient_is_exposed_to_enalapril_now
           patient_is_exposed_to_captopril_now)
       patient_is_exposed_to_angiotensin_converting_enzyme_inhibitor_now)
   :named REQ21_AUXILIARY1)) ;; "angiotensin-converting enzyme inhibitor with non-exhaustive examples (enalapril, captopril) concurrently"

;; Non-exhaustive examples for alkalinizing agent
(assert
(! (=> patient_is_exposed_to_sodium_bicarbonate_inthepast2weeks
       patient_is_exposed_to_alkalinizing_agent_inthepast2weeks)
   :named REQ21_AUXILIARY2)) ;; "alkalinizing agent with non-exhaustive examples (sodium bicarbonate) within the past 2 weeks"

(assert
(! (=> patient_is_exposed_to_sodium_bicarbonate_now
       patient_is_exposed_to_alkalinizing_agent_now)
   :named REQ21_AUXILIARY3)) ;; "alkalinizing agent with non-exhaustive examples (sodium bicarbonate) concurrently"

;; ===================== Constraint Assertions (REQ 21) =====================
;; Exclusion: patient must NOT have received any of the listed drugs within the past 2 weeks
(assert
(! (not (or patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_inthepast2weeks
            patient_is_exposed_to_angiotensin_converting_enzyme_inhibitor_inthepast2weeks
            patient_is_exposed_to_calcium_channel_blocker_inthepast2weeks
            patient_is_exposed_to_diuretic_inthepast2weeks
            patient_is_exposed_to_cyclooxygenase_2_inhibitor_inthepast2weeks
            patient_is_exposed_to_acetazolamide_inthepast2weeks
            patient_is_exposed_to_urea_inthepast2weeks
            patient_is_exposed_to_xanthine_inthepast2weeks
            patient_is_exposed_to_alkalinizing_agent_inthepast2weeks))
   :named REQ21_COMPONENT0_OTHER_REQUIREMENTS)) ;; "has received at least one of the following drugs within the past 2 weeks: ..."

;; Exclusion: patient must NOT be receiving any of the listed drugs concurrently
(assert
(! (not (or patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_now
            patient_is_exposed_to_angiotensin_converting_enzyme_inhibitor_now
            patient_is_exposed_to_calcium_channel_blocker_now
            patient_is_exposed_to_diuretic_now
            patient_is_exposed_to_cyclooxygenase_2_inhibitor_now
            patient_is_exposed_to_acetazolamide_now
            patient_is_exposed_to_urea_now
            patient_is_exposed_to_xanthine_now
            patient_is_exposed_to_alkalinizing_agent_now))
   :named REQ21_COMPONENT1_OTHER_REQUIREMENTS)) ;; "is receiving at least one of the following drugs concurrently: ..."

;; ===================== Declarations for the exclusion criterion (REQ 22) =====================
(declare-const patient_has_history_of_radiotherapy_to_head_area_prior_to_study_entry Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had radiotherapy administered to the head area prior to study entry.","when_to_set_to_false":"Set to false if the patient has not had radiotherapy administered to the head area prior to study entry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had radiotherapy administered to the head area prior to study entry.","meaning":"Boolean indicating whether the patient has a history of radiotherapy administered to the head area prior to study entry."} ;; "the patient has had prior radiotherapy to the head area"

(declare-const patient_has_history_of_radiotherapy_to_neck_area_prior_to_study_entry Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had radiotherapy administered to the neck area prior to study entry.","when_to_set_to_false":"Set to false if the patient has not had radiotherapy administered to the neck area prior to study entry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had radiotherapy administered to the neck area prior to study entry.","meaning":"Boolean indicating whether the patient has a history of radiotherapy administered to the neck area prior to study entry."} ;; "the patient has had prior radiotherapy to the neck area"

;; ===================== Constraint Assertions (REQ 22) =====================
(assert
(! (not patient_has_history_of_radiotherapy_to_head_area_prior_to_study_entry)
    :named REQ22_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had prior radiotherapy to the head area."

(assert
(! (not patient_has_history_of_radiotherapy_to_neck_area_prior_to_study_entry)
    :named REQ22_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had prior radiotherapy to the neck area."

;; ===================== Declarations for the exclusion criterion (REQ 23) =====================
(declare-const patient_has_undergone_stereotactic_radiosurgery_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone stereotactic radiosurgery at any time in the past (prior to study entry).","when_to_set_to_false":"Set to false if the patient has never undergone stereotactic radiosurgery at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone stereotactic radiosurgery.","meaning":"Boolean indicating whether the patient has ever undergone stereotactic radiosurgery at any time in the past."} ;; "radiosurgery"

;; ===================== Constraint Assertions (REQ 23) =====================
(assert
  (! (not patient_has_undergone_stereotactic_radiosurgery_inthehistory)
     :named REQ23_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had prior radiosurgery."

;; ===================== Declarations for the exclusion criterion (REQ 24) =====================
(declare-const patient_is_receiving_radiotherapy_to_other_sites_concurrently Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving radiotherapy to anatomical sites other than the study target site, and this radiotherapy is being administered concurrently with study participation.","when_to_set_to_false":"Set to false if the patient is not currently receiving radiotherapy to anatomical sites other than the study target site, or if such radiotherapy is not being administered concurrently with study participation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving radiotherapy to other sites concurrently with study participation.","meaning":"Boolean indicating whether the patient is currently receiving radiotherapy to anatomical sites other than the study target site concurrently with study participation."} ;; "The patient is receiving concurrent radiotherapy to other sites."

;; ===================== Constraint Assertions (REQ 24) =====================
(assert
(! (not patient_is_receiving_radiotherapy_to_other_sites_concurrently)
:named REQ24_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is receiving concurrent radiotherapy to other sites."
