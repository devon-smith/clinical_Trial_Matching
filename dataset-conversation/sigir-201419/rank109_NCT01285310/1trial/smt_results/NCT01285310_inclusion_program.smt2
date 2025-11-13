;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_rheumatoid_arthritis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented diagnosis of rheumatoid arthritis.","when_to_set_to_false":"Set to false if the patient currently does not have a documented diagnosis of rheumatoid arthritis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of rheumatoid arthritis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of rheumatoid arthritis."} // "a documented diagnosis of rheumatoid arthritis"
(declare-const patient_has_diagnosis_of_rheumatoid_arthritis_now@@diagnosed_according_to_1987_american_college_of_rheumatology_criteria Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of rheumatoid arthritis is made according to the 1987 American College of Rheumatology Criteria.","when_to_set_to_false":"Set to false if the patient's diagnosis of rheumatoid arthritis is not made according to the 1987 American College of Rheumatology Criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis was made according to the 1987 American College of Rheumatology Criteria.","meaning":"Boolean indicating whether the patient's diagnosis of rheumatoid arthritis is made according to the 1987 American College of Rheumatology Criteria."} // "according to the 1987 American College of Rheumatology Criteria"
(declare-const duration_of_onset_of_signs_of_rheumatoid_arthritis_from_randomization_in_months Real) ;; {"when_to_set_to_value":"Set to the number of months between randomization and the onset of signs of rheumatoid arthritis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined when the onset of signs of rheumatoid arthritis occurred relative to randomization.","meaning":"Numeric variable indicating the duration in months from randomization to the onset of signs of rheumatoid arthritis."} // "onset of signs of rheumatoid arthritis of duration ≥ 4 months from randomization"
(declare-const duration_of_onset_of_symptoms_of_rheumatoid_arthritis_from_randomization_in_months Real) ;; {"when_to_set_to_value":"Set to the number of months between randomization and the onset of symptoms of rheumatoid arthritis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined when the onset of symptoms of rheumatoid arthritis occurred relative to randomization.","meaning":"Numeric variable indicating the duration in months from randomization to the onset of symptoms of rheumatoid arthritis."} // "onset of symptoms of rheumatoid arthritis of duration ≥ 4 months from randomization"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_diagnosis_of_rheumatoid_arthritis_now@@diagnosed_according_to_1987_american_college_of_rheumatology_criteria
         patient_has_diagnosis_of_rheumatoid_arthritis_now)
     :named REQ0_AUXILIARY0)) ;; "diagnosed according to the 1987 American College of Rheumatology Criteria"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: Documented diagnosis according to 1987 ACR criteria
(assert
  (! patient_has_diagnosis_of_rheumatoid_arthritis_now@@diagnosed_according_to_1987_american_college_of_rheumatology_criteria
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "a documented diagnosis of rheumatoid arthritis (according to the 1987 American College of Rheumatology Criteria)"

;; Component 1: Onset of signs OR symptoms of RA ≥ 4 months from randomization
(assert
  (! (or (>= duration_of_onset_of_signs_of_rheumatoid_arthritis_from_randomization_in_months 4.0)
         (>= duration_of_onset_of_symptoms_of_rheumatoid_arthritis_from_randomization_in_months 4.0))
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "onset of signs of rheumatoid arthritis of duration ≥ 4 months from randomization OR onset of symptoms of rheumatoid arthritis of duration ≥ 4 months from randomization"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_is_receiving_treatment_on_outpatient_basis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving treatment on an outpatient basis.","when_to_set_to_false":"Set to false if the patient is currently not receiving treatment on an outpatient basis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving treatment on an outpatient basis.","meaning":"Boolean indicating whether the patient is currently receiving treatment on an outpatient basis."} // "the patient must be receiving treatment on an outpatient basis"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_is_receiving_treatment_on_outpatient_basis_now
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must be receiving treatment on an outpatient basis"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_rheumatoid_arthritis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of rheumatoid arthritis.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of rheumatoid arthritis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of rheumatoid arthritis.","meaning":"Boolean indicating whether the patient currently has rheumatoid arthritis."} // "rheumatoid arthritis"
(declare-const patient_is_receiving_methotrexate_treatment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving methotrexate treatment.","when_to_set_to_false":"Set to false if the patient is not currently receiving methotrexate treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving methotrexate treatment.","meaning":"Boolean indicating whether the patient is currently receiving methotrexate treatment."} // "current methotrexate treatment"
(declare-const patient_joint_swelling_value_recorded_now_withunit_count Real) ;; {"when_to_set_to_value":"Set to the measured count if the number of swollen joints by 66 swollen joint count is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric count representing the patient's current number of swollen joints by 66 swollen joint count."} // "number of swollen joints (by 66 swollen joint count)"
(declare-const patient_tenderness_of_joint_value_recorded_now_withunit_count Real) ;; {"when_to_set_to_value":"Set to the measured count if the number of tender joints by 68 tender joint count is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric count representing the patient's current number of tender joints by 68 tender joint count."} // "number of tender joints (by 68 tender joint count)"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: Patient must have active rheumatoid arthritis disease despite current methotrexate treatment, defined as (number of swollen joints (by 66 swollen joint count) ≥ 6) AND (number of tender joints (by 68 tender joint count) ≥ 6)
(assert
  (! (and patient_has_finding_of_rheumatoid_arthritis_now
          patient_is_receiving_methotrexate_treatment_now
          (>= patient_joint_swelling_value_recorded_now_withunit_count 6)
          (>= patient_tenderness_of_joint_value_recorded_now_withunit_count 6))
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "active rheumatoid arthritis disease despite current methotrexate treatment, defined as (number of swollen joints (by 66 swollen joint count) ≥ 6) AND (number of tender joints (by 68 tender joint count) ≥ 6)"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_measurement_of_c_reactive_protein_using_high_sensitivity_technique_value_recorded_now_withunit_mg_per_l Real) ;; {"when_to_set_to_value":"Set to the measured value (in mg/L) if a high sensitivity C-reactive protein concentration is recorded for the patient now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value of the patient's high sensitivity C-reactive protein concentration (mg/L) measured now."} // "high sensitivity C-reactive protein concentration"
(declare-const patient_erythrocyte_sedimentation_rate_measurement_value_recorded_now_withunit_mm Real) ;; {"when_to_set_to_value":"Set to the measured value (in mm) if an erythrocyte sedimentation rate is recorded for the patient now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value of the patient's erythrocyte sedimentation rate (mm) measured now."} // "erythrocyte sedimentation rate"
(declare-const patient_erythrocyte_sedimentation_rate_measurement_value_recorded_now_withunit_mm@@measured_after_first_1_hour Bool) ;; {"when_to_set_to_true":"Set to true if the erythrocyte sedimentation rate measurement was taken after the first 1 hour.","when_to_set_to_false":"Set to false if the measurement was not taken after the first 1 hour.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the measurement was taken after the first 1 hour.","meaning":"Indicates whether the erythrocyte sedimentation rate measurement was taken after the first 1 hour."} // "erythrocyte sedimentation rate > 28 mm after the first 1 hour"
(declare-const patient_has_undergone_rheumatoid_factor_measurement_now_outcome_is_positive Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a positive rheumatoid factor test result now.","when_to_set_to_false":"Set to false if the patient has a negative or non-positive rheumatoid factor test result now.","when_to_set_to_null":"Set to null if the result is unknown, not documented, or indeterminate.","meaning":"Boolean indicating whether the patient has a positive rheumatoid factor test result now."} // "positive rheumatoid factor test result"
(declare-const patient_has_undergone_anti_cyclic_citrullinated_peptide_antibody_level_now_outcome_is_positive Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a positive anti-cyclic citrullinated peptide antibody test result now.","when_to_set_to_false":"Set to false if the patient has a negative or non-positive anti-cyclic citrullinated peptide antibody test result now.","when_to_set_to_null":"Set to null if the result is unknown, not documented, or indeterminate.","meaning":"Boolean indicating whether the patient has a positive anti-cyclic citrullinated peptide antibody test result now."} // "positive anti-cyclic citrullinated peptide antibody test result"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; None needed for this requirement (all facts are atomic or directly numeric/boolean).

;; ===================== Constraint Assertions (REQ 3) =====================
;; At least one of the four laboratory requirements must be satisfied:
(assert
  (! (or (>= patient_measurement_of_c_reactive_protein_using_high_sensitivity_technique_value_recorded_now_withunit_mg_per_l 10.0) ;; "high sensitivity C-reactive protein concentration ≥ 10 mg/L"
         (and (> patient_erythrocyte_sedimentation_rate_measurement_value_recorded_now_withunit_mm 28.0)
              patient_erythrocyte_sedimentation_rate_measurement_value_recorded_now_withunit_mm@@measured_after_first_1_hour) ;; "erythrocyte sedimentation rate > 28 mm after the first 1 hour"
         patient_has_undergone_rheumatoid_factor_measurement_now_outcome_is_positive ;; "positive rheumatoid factor test result"
         patient_has_undergone_anti_cyclic_citrullinated_peptide_antibody_level_now_outcome_is_positive) ;; "positive anti-cyclic citrullinated peptide antibody test result"
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS))

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_is_undergoing_magnetic_resonance_imaging_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing a magnetic resonance imaging procedure.","when_to_set_to_false":"Set to false if the patient is currently not undergoing a magnetic resonance imaging procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing a magnetic resonance imaging procedure.","meaning":"Boolean indicating whether the patient is currently undergoing a magnetic resonance imaging procedure."} // "if the patient is participating in the magnetic resonance imaging assessment"
(declare-const patient_swelling_of_metacarpophalangeal_joint_value_recorded_now_withunit_count Real) ;; {"when_to_set_to_value":"Set to the measured count if the number of swollen metacarpophalangeal joints on the same hand is recorded now.","when_to_set_to_null":"Set to null if no such count is recorded now or the value is indeterminate.","meaning":"Numeric value representing the number of swollen metacarpophalangeal joints recorded now."} // "number of swollen metacarpophalangeal joints on the same hand"
(declare-const patient_swelling_of_metacarpophalangeal_joint_value_recorded_now_withunit_count@@on_the_same_hand Bool) ;; {"when_to_set_to_true":"Set to true if the count of swollen metacarpophalangeal joints recorded now is restricted to those on the same hand.","when_to_set_to_false":"Set to false if the count is not restricted to the same hand.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the count is restricted to the same hand.","meaning":"Boolean indicating whether the count of swollen metacarpophalangeal joints recorded now is restricted to those on the same hand."} // "on the same hand"
(declare-const patient_swelling_of_wrist_joint_value_recorded_now_withunit_count Real) ;; {"when_to_set_to_value":"Set to the measured count if the number of swollen wrist joints on the same hand is recorded now.","when_to_set_to_null":"Set to null if no such count is recorded now or the value is indeterminate.","meaning":"Numeric value representing the number of swollen wrist joints recorded now."} // "number of swollen wrists on the same hand"
(declare-const patient_swelling_of_wrist_joint_value_recorded_now_withunit_count@@on_the_same_hand Bool) ;; {"when_to_set_to_true":"Set to true if the count of swollen wrist joints recorded now is restricted to those on the same hand.","when_to_set_to_false":"Set to false if the count is not restricted to the same hand.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the count is restricted to the same hand.","meaning":"Boolean indicating whether the count of swollen wrist joints recorded now is restricted to those on the same hand."} // "on the same hand"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_swelling_of_metacarpophalangeal_joint_value_recorded_now_withunit_count@@on_the_same_hand
         true)
     :named REQ4_AUXILIARY0)) ;; "number of swollen metacarpophalangeal joints on the same hand"

(assert
  (! (=> patient_swelling_of_wrist_joint_value_recorded_now_withunit_count@@on_the_same_hand
         true)
     :named REQ4_AUXILIARY1)) ;; "number of swollen wrists on the same hand"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: If the patient is undergoing MRI, must meet joint involvement criteria
(assert
  (! (or (not patient_is_undergoing_magnetic_resonance_imaging_now)
         (and patient_swelling_of_metacarpophalangeal_joint_value_recorded_now_withunit_count@@on_the_same_hand
              (or (>= patient_swelling_of_metacarpophalangeal_joint_value_recorded_now_withunit_count 2)
                  (and (>= patient_swelling_of_metacarpophalangeal_joint_value_recorded_now_withunit_count 1)
                       patient_swelling_of_wrist_joint_value_recorded_now_withunit_count@@on_the_same_hand
                       (>= patient_swelling_of_wrist_joint_value_recorded_now_withunit_count 1)))))
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "swollen joint counts in (number of swollen metacarpophalangeal joints on the same hand ≥ 2) OR ((number of swollen metacarpophalangeal joints on the same hand ≥ 1) AND (number of swollen wrists on the same hand ≥ 1))"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_methotrexate_containing_product_value_recorded_inthehistory_withunit_months Real) ;; {"when_to_set_to_value":"Set to the number of months the patient has been treated with methotrexate-containing product prior to randomization, if known.","when_to_set_to_null":"Set to null if the duration of methotrexate-containing product treatment prior to randomization is unknown or cannot be determined.","meaning":"Numeric value representing the duration in months of methotrexate-containing product treatment prior to randomization."} // "been treated with methotrexate for duration ≥ 4 months prior to randomization"
(declare-const patient_methotrexate_containing_product_value_recorded_inthehistory_withunit_months@@temporalcontext_prior_to_randomization Bool) ;; {"when_to_set_to_true":"Set to true if the duration of methotrexate-containing product treatment is specifically prior to randomization.","when_to_set_to_false":"Set to false if the duration is not prior to randomization.","when_to_set_to_null":"Set to null if it is unknown whether the duration is prior to randomization.","meaning":"Boolean indicating whether the duration of methotrexate-containing product treatment is anchored to the period prior to randomization."} // "prior to randomization"
(declare-const patient_is_taking_methotrexate_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking methotrexate-containing product.","when_to_set_to_false":"Set to false if the patient is not currently taking methotrexate-containing product.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the patient is currently taking methotrexate-containing product.","meaning":"Boolean indicating whether the patient is currently taking methotrexate-containing product."} // "be on a stable methotrexate dose"
(declare-const patient_is_taking_methotrexate_containing_product_now@@dose_is_stable Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking methotrexate-containing product and the dose is stable.","when_to_set_to_false":"Set to false if the patient is currently taking methotrexate-containing product and the dose is not stable.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the dose is stable.","meaning":"Boolean indicating whether the dose of methotrexate-containing product is stable while the patient is currently taking it."} // "be on a stable methotrexate dose"
(declare-const patient_is_taking_methotrexate_containing_product_inthefuture52weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient is taking methotrexate-containing product throughout the 52 weeks following randomization.","when_to_set_to_false":"Set to false if the patient is not taking methotrexate-containing product throughout the 52 weeks following randomization.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the patient is taking methotrexate-containing product throughout the 52 weeks following randomization.","meaning":"Boolean indicating whether the patient is taking methotrexate-containing product during the 52 weeks following randomization."} // "maintain the stable methotrexate dose through Week 52 of the study"
(declare-const patient_is_taking_methotrexate_containing_product_inthefuture52weeks@@dose_is_stable_throughout_period Bool) ;; {"when_to_set_to_true":"Set to true if the patient is taking methotrexate-containing product during the 52 weeks following randomization and the dose remains stable throughout this period.","when_to_set_to_false":"Set to false if the dose does not remain stable throughout the 52 weeks.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the dose remains stable throughout the 52 weeks.","meaning":"Boolean indicating whether the dose of methotrexate-containing product remains stable throughout the 52 weeks following randomization."} // "maintain the stable methotrexate dose through Week 52 of the study"
(declare-const patient_folic_acid_value_recorded_now_withunit_mg_per_week Real) ;; {"when_to_set_to_value":"Set to the current weekly dose in mg of oral folic acid supplementation administered to the patient, if known.","when_to_set_to_null":"Set to null if the current weekly dose of oral folic acid supplementation is unknown or cannot be determined.","meaning":"Numeric value representing the current weekly dose in mg of oral folic acid supplementation administered to the patient."} // "oral folate supplementation (folic acid) with minimum dose ≥ 5 mg/week"
(declare-const patient_folic_acid_value_recorded_now_withunit_mg_per_week@@administered_orally Bool) ;; {"when_to_set_to_true":"Set to true if the folic acid supplementation is administered orally.","when_to_set_to_false":"Set to false if the folic acid supplementation is not administered orally.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the folic acid supplementation is administered orally.","meaning":"Boolean indicating whether the folic acid supplementation is administered orally."} // "oral folate supplementation (folic acid)"
(declare-const patient_folinic_acid_value_recorded_now_withunit_mg_per_week Real) ;; {"when_to_set_to_value":"Set to the current weekly dose in mg of oral folinic acid (leucovorin) administered to the patient, if known.","when_to_set_to_null":"Set to null if the current weekly dose of oral folinic acid (leucovorin) is unknown or cannot be determined.","meaning":"Numeric value representing the current weekly dose in mg of oral folinic acid (leucovorin) administered to the patient."} // "oral leucovorin with dose ≤ 10 mg/week"
(declare-const patient_folinic_acid_value_recorded_now_withunit_mg_per_week@@administered_orally Bool) ;; {"when_to_set_to_true":"Set to true if the folinic acid (leucovorin) is administered orally.","when_to_set_to_false":"Set to false if the folinic acid (leucovorin) is not administered orally.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the folinic acid (leucovorin) is administered orally.","meaning":"Boolean indicating whether the folinic acid (leucovorin) is administered orally."} // "oral leucovorin"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable for methotrexate duration prior to randomization implies the context
(assert
  (! (=> patient_methotrexate_containing_product_value_recorded_inthehistory_withunit_months@@temporalcontext_prior_to_randomization
         (>= patient_methotrexate_containing_product_value_recorded_inthehistory_withunit_months 0))
     :named REQ5_AUXILIARY0)) ;; "duration is specifically prior to randomization"

;; Qualifier variable for stable dose now implies currently taking methotrexate
(assert
  (! (=> patient_is_taking_methotrexate_containing_product_now@@dose_is_stable
         patient_is_taking_methotrexate_containing_product_now)
     :named REQ5_AUXILIARY1)) ;; "dose is stable while currently taking methotrexate"

;; Qualifier variable for stable dose in future 52 weeks implies taking methotrexate in future 52 weeks
(assert
  (! (=> patient_is_taking_methotrexate_containing_product_inthefuture52weeks@@dose_is_stable_throughout_period
         patient_is_taking_methotrexate_containing_product_inthefuture52weeks)
     :named REQ5_AUXILIARY2)) ;; "dose is stable throughout 52 weeks"

;; Qualifier variable for oral folic acid implies folic acid supplementation
(assert
  (! (=> patient_folic_acid_value_recorded_now_withunit_mg_per_week@@administered_orally
         (>= patient_folic_acid_value_recorded_now_withunit_mg_per_week 0))
     :named REQ5_AUXILIARY3)) ;; "folic acid is administered orally"

;; Qualifier variable for oral folinic acid implies folinic acid supplementation
(assert
  (! (=> patient_folinic_acid_value_recorded_now_withunit_mg_per_week@@administered_orally
         (>= patient_folinic_acid_value_recorded_now_withunit_mg_per_week 0))
     :named REQ5_AUXILIARY4)) ;; "folinic acid (leucovorin) is administered orally"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Component 0: Treated with methotrexate for duration ≥ 4 months prior to randomization
(assert
  (! (and (>= patient_methotrexate_containing_product_value_recorded_inthehistory_withunit_months 4)
          patient_methotrexate_containing_product_value_recorded_inthehistory_withunit_months@@temporalcontext_prior_to_randomization)
     :named REQ5_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "been treated with methotrexate for duration ≥ 4 months prior to randomization"

;; Component 1: Be on a stable methotrexate dose
(assert
  (! patient_is_taking_methotrexate_containing_product_now@@dose_is_stable
     :named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "be on a stable methotrexate dose"

;; Component 2: Maintain the stable methotrexate dose through Week 52 of the study
(assert
  (! patient_is_taking_methotrexate_containing_product_inthefuture52weeks@@dose_is_stable_throughout_period
     :named REQ5_COMPONENT2_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "maintain the stable methotrexate dose through Week 52 of the study"

;; Component 3: Oral folate supplementation (folic acid) with minimum dose ≥ 5 mg/week OR oral leucovorin with dose ≤ 10 mg/week
(assert
  (! (or (and patient_folic_acid_value_recorded_now_withunit_mg_per_week@@administered_orally
              (>= patient_folic_acid_value_recorded_now_withunit_mg_per_week 5))
         (and patient_folinic_acid_value_recorded_now_withunit_mg_per_week@@administered_orally
              (<= patient_folinic_acid_value_recorded_now_withunit_mg_per_week 10)))
     :named REQ5_COMPONENT3_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "oral folate supplementation (folic acid) with minimum dose ≥ 5 mg/week OR oral leucovorin with dose ≤ 10 mg/week"

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a non-steroidal anti-inflammatory agent.","when_to_set_to_false":"Set to false if the patient is currently not taking a non-steroidal anti-inflammatory agent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a non-steroidal anti-inflammatory agent.","meaning":"Boolean indicating whether the patient is currently exposed to (taking) a non-steroidal anti-inflammatory agent."} // "non-steroidal anti-inflammatory drugs"
(declare-const patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_now@@regimen_stable_for_at_least_7_days_prior_to_randomization_and_through_week_52 Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a non-steroidal anti-inflammatory agent and the regimen has been stable for at least 7 days prior to randomization and continues through Week 52 of the study.","when_to_set_to_false":"Set to false if the patient is currently taking a non-steroidal anti-inflammatory agent but the regimen has not been stable for at least 7 days prior to randomization and/or does not continue through Week 52.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the regimen has been stable for at least 7 days prior to randomization and through Week 52.","meaning":"Boolean indicating that the patient's non-steroidal anti-inflammatory agent regimen is stable for at least 7 days prior to randomization and through Week 52."} // "stable non-steroidal anti-inflammatory drug regimen for duration ≥ 7 days prior to randomization and through Week 52"
(declare-const patient_is_exposed_to_pain_medication_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking pain medications.","when_to_set_to_false":"Set to false if the patient is currently not taking pain medications.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking pain medications.","meaning":"Boolean indicating whether the patient is currently exposed to (taking) pain medications."} // "pain medications"
(declare-const patient_is_exposed_to_pain_medication_now@@regimen_stable_for_at_least_7_days_prior_to_randomization_and_through_week_52 Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking pain medications and the regimen has been stable for at least 7 days prior to randomization and continues through Week 52 of the study.","when_to_set_to_false":"Set to false if the patient is currently taking pain medications but the regimen has not been stable for at least 7 days prior to randomization and/or does not continue through Week 52.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the regimen has been stable for at least 7 days prior to randomization and through Week 52.","meaning":"Boolean indicating that the patient's pain medication regimen is stable for at least 7 days prior to randomization and through Week 52."} // "stable pain medication regimen for duration ≥ 7 days prior to randomization and through Week 52"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable implies corresponding stem variable for NSAIDs
(assert
  (! (=> patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_now@@regimen_stable_for_at_least_7_days_prior_to_randomization_and_through_week_52
         patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_now)
     :named REQ6_AUXILIARY0)) ;; "if the patient is taking non-steroidal anti-inflammatory drugs, the patient must be on a stable non-steroidal anti-inflammatory drug regimen..."

;; Qualifier variable implies corresponding stem variable for pain medications
(assert
  (! (=> patient_is_exposed_to_pain_medication_now@@regimen_stable_for_at_least_7_days_prior_to_randomization_and_through_week_52
         patient_is_exposed_to_pain_medication_now)
     :named REQ6_AUXILIARY1)) ;; "if the patient is taking pain medications, the patient must be on a stable pain medication regimen..."

;; ===================== Constraint Assertions (REQ 6) =====================
;; Component 0: If patient is taking NSAIDs, regimen must be stable for ≥7 days prior to randomization and through Week 52
(assert
  (! (or (not patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_now)
         patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_now@@regimen_stable_for_at_least_7_days_prior_to_randomization_and_through_week_52)
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "if the patient is taking non-steroidal anti-inflammatory drugs, the patient must be on a stable non-steroidal anti-inflammatory drug regimen for duration ≥ 7 days prior to randomization and through Week 52 of the study"

;; Component 1: If patient is taking pain medications, regimen must be stable for ≥7 days prior to randomization and through Week 52
(assert
  (! (or (not patient_is_exposed_to_pain_medication_now)
         patient_is_exposed_to_pain_medication_now@@regimen_stable_for_at_least_7_days_prior_to_randomization_and_through_week_52)
     :named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "if the patient is taking pain medications, the patient must be on a stable pain medication regimen for duration ≥ 7 days prior to randomization and through Week 52 of the study"

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking an oral corticosteroid or corticosteroid derivative-containing product.","when_to_set_to_false":"Set to false if the patient is currently not taking any oral corticosteroid or corticosteroid derivative-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking an oral corticosteroid or corticosteroid derivative-containing product.","meaning":"Boolean indicating whether the patient is currently taking an oral corticosteroid or corticosteroid derivative-containing product."} // "oral corticosteroids"
(declare-const patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now@@stable_dose_for_at_least_28_days_prior_to_randomization_and_through_week_52 Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking an oral corticosteroid or corticosteroid derivative-containing product and the dose has been stable for at least 28 days prior to randomization and maintained through Week 52 of the study.","when_to_set_to_false":"Set to false if the patient is currently taking an oral corticosteroid or corticosteroid derivative-containing product but the dose has not been stable for at least 28 days prior to randomization and/or not maintained through Week 52.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the dose has been stable for at least 28 days prior to randomization and maintained through Week 52.","meaning":"Boolean indicating whether the patient is currently taking an oral corticosteroid or corticosteroid derivative-containing product and the dose has been stable for at least 28 days prior to randomization and maintained through Week 52 of the study."} // "stable oral corticosteroid dose ... for duration ≥ 28 days prior to randomization AND through Week 52"
(declare-const oral_prednisone_equivalent_dose_value_recorded_prior_to_randomization_and_through_week_52_in_mg_per_day Real) ;; {"when_to_set_to_value":"Set to the value of the patient's daily oral prednisone or equivalent corticosteroid dose (in mg/day) if recorded for at least 28 days prior to randomization and maintained through Week 52.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined for the specified duration.","meaning":"Numeric value representing the patient's daily oral prednisone or equivalent corticosteroid dose (in mg/day) for at least 28 days prior to randomization and maintained through Week 52 of the study."} // "dose of prednisone ≤ 10 mg/day OR equivalent for duration ≥ 28 days prior to randomization AND through Week 52"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variable implies stem variable
(assert
  (! (=> patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now@@stable_dose_for_at_least_28_days_prior_to_randomization_and_through_week_52
         patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now)
     :named REQ7_AUXILIARY0)) ;; "stable oral corticosteroid dose ... for duration ≥ 28 days prior to randomization AND through Week 52"

;; Stable dose definition: dose must be ≤ 10 mg/day (prednisone or equivalent)
(assert
  (! (= patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now@@stable_dose_for_at_least_28_days_prior_to_randomization_and_through_week_52
        (and patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now
             (<= oral_prednisone_equivalent_dose_value_recorded_prior_to_randomization_and_through_week_52_in_mg_per_day 10.0)))
     :named REQ7_AUXILIARY1)) ;; "dose of prednisone ≤ 10 mg/day OR equivalent for duration ≥ 28 days prior to randomization AND through Week 52"

;; ===================== Constraint Assertions (REQ 7) =====================
;; If patient is taking oral corticosteroids, must meet stable dose requirement
(assert
  (! (or (not patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now)
         patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now@@stable_dose_for_at_least_28_days_prior_to_randomization_and_through_week_52)
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "if the patient is taking oral corticosteroids, the patient must be on a stable oral corticosteroid dose of prednisone ≤ 10 mg/day OR equivalent for duration ≥ 28 days prior to randomization AND through Week 52"

;; ===================== Declarations for the criterion (REQ 8) =====================
(declare-const patient_white_blood_cell_count_value_recorded_now_withunit_per_mm3 Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's white blood cell count is recorded at screening in units of per mm^3.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's white blood cell count at screening, in per mm^3."} // "white blood cell count ≥ 3000/mm^3 AND white blood cell count < 14,000/mm^3"
(declare-const patient_platelet_count_value_recorded_now_withunit_per_ul Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's platelet count is recorded at screening in units of per μL.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's platelet count at screening, in per μL."} // "platelet count ≥ 100,000/μL"
(declare-const patient_serum_creatinine_level_finding_value_recorded_now_withunit_mg_per_dl Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's serum creatinine concentration is recorded at screening in units of mg/dL.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's serum creatinine concentration at screening, in mg/dL."} // "serum creatinine concentration ≤ 1.5 mg/dL"
(declare-const patient_aspartate_aminotransferase_concentration_value_recorded_now_withunit_times_upper_limit_of_normal Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's aspartate aminotransferase concentration is recorded at screening and expressed as a multiple of the upper limit of normal.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's aspartate aminotransferase concentration at screening, in multiples of the upper limit of normal."} // "aspartate aminotransferase (AST/SGOT) concentration ≤ 2 times the upper limit of normal"
(declare-const patient_alanine_aminotransferase_concentration_value_recorded_now_withunit_times_upper_limit_of_normal Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's alanine aminotransferase concentration is recorded at screening and expressed as a multiple of the upper limit of normal.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's alanine aminotransferase concentration at screening, in multiples of the upper limit of normal."} // "alanine aminotransferase (ALT/SGPT) concentration ≤ 2 times the upper limit of normal"
(declare-const patient_bilirubin_total_measurement_value_recorded_now_withunit_mg_per_dl Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's total bilirubin concentration is recorded at screening in units of mg/dL.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's total bilirubin concentration at screening, in mg/dL."} // "total bilirubin concentration ≤ 2 mg/dL"
(declare-const patient_hemoglobin_concentration_dipstick_finding_value_recorded_now_withunit_g_per_dl Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's hemoglobin concentration is recorded at screening in units of g/dL.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's hemoglobin concentration at screening, in g/dL."} // "hemoglobin concentration ≥ 9 g/dL"
(declare-const patient_hemoglobin_a1c_measurement_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's hemoglobin A1c concentration is recorded at screening in units of percent.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's hemoglobin A1c concentration at screening, in percent."} // "hemoglobin A1c concentration ≤ 9.0%"
(declare-const patients_type_b_viral_hepatitis_is_negative_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hepatitis B surface antigen test result is negative at screening.","when_to_set_to_false":"Set to false if the patient's hepatitis B surface antigen test result is not negative at screening.","when_to_set_to_null":"Set to null if the test result is unavailable or indeterminate at screening.","meaning":"Boolean indicating hepatitis B surface antigen negativity at screening."} // "negative hepatitis B surface antigen test result"
(declare-const patients_antibody_to_hepatitis_c_virus_is_negative_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hepatitis C antibody test result is negative at screening.","when_to_set_to_false":"Set to false if the patient's hepatitis C antibody test result is not negative at screening.","when_to_set_to_null":"Set to null if the test result is unavailable or indeterminate at screening.","meaning":"Boolean indicating hepatitis C antibody negativity at screening."} // "negative hepatitis C antibody test result"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
  (! (and
        (>= patient_white_blood_cell_count_value_recorded_now_withunit_per_mm3 3000.0) ;; "white blood cell count ≥ 3000/mm^3"
        (<  patient_white_blood_cell_count_value_recorded_now_withunit_per_mm3 14000.0) ;; "white blood cell count < 14,000/mm^3"
        (>= patient_platelet_count_value_recorded_now_withunit_per_ul 100000.0) ;; "platelet count ≥ 100,000/μL"
        (<= patient_serum_creatinine_level_finding_value_recorded_now_withunit_mg_per_dl 1.5) ;; "serum creatinine concentration ≤ 1.5 mg/dL"
        (<= patient_aspartate_aminotransferase_concentration_value_recorded_now_withunit_times_upper_limit_of_normal 2.0) ;; "aspartate aminotransferase (AST/SGOT) concentration ≤ 2 times the upper limit of normal"
        (<= patient_alanine_aminotransferase_concentration_value_recorded_now_withunit_times_upper_limit_of_normal 2.0) ;; "alanine aminotransferase (ALT/SGPT) concentration ≤ 2 times the upper limit of normal"
        (<= patient_bilirubin_total_measurement_value_recorded_now_withunit_mg_per_dl 2.0) ;; "total bilirubin concentration ≤ 2 mg/dL"
        (>= patient_hemoglobin_concentration_dipstick_finding_value_recorded_now_withunit_g_per_dl 9.0) ;; "hemoglobin concentration ≥ 9 g/dL"
        (<= patient_hemoglobin_a1c_measurement_value_recorded_now_withunit_percent 9.0) ;; "hemoglobin A1c concentration ≤ 9.0%"
        patients_type_b_viral_hepatitis_is_negative_now ;; "negative hepatitis B surface antigen test result"
        patients_antibody_to_hepatitis_c_virus_is_negative_now ;; "negative hepatitis C antibody test result"
     )
     :named REQ8_COMPONENT0_OTHER_REQUIREMENTS))

;; ===================== Declarations for the criterion (REQ 9) =====================
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as male.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not male (e.g., female or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is male."} // "if the patient is male"
(declare-const patient_engages_in_activity_in_which_conception_is_possible_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently engaging in activity in which conception is possible.","when_to_set_to_false":"Set to false if the patient is currently not engaging in activity in which conception is possible.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently engaging in activity in which conception is possible.","meaning":"Boolean indicating whether the patient is currently engaging in activity in which conception is possible."} // "engages in activity in which conception is possible"
(declare-const patient_has_finding_of_barrier_contraception_method_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using a barrier contraception method.","when_to_set_to_false":"Set to false if the patient is currently not using a barrier contraception method.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using a barrier contraception method.","meaning":"Boolean indicating whether the patient is currently using a barrier contraception method."} // "barrier contraception"
(declare-const patient_has_finding_of_barrier_contraception_method_now@@protocol_described_method Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using a barrier contraception method and the method is protocol-described.","when_to_set_to_false":"Set to false if the patient is currently using a barrier contraception method but the method is not protocol-described.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the barrier contraception method is protocol-described.","meaning":"Boolean indicating whether the patient's current barrier contraception method is protocol-described."} // "protocol described barrier contraception"
(declare-const patient_has_finding_of_barrier_contraception_method_now@@used_while_on_investigational_product_and_for_at_least_28_days_after_last_dose Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using a barrier contraception method and the method is used both while on investigational product and for at least 28 days after the last dose of investigational product.","when_to_set_to_false":"Set to false if the patient is currently using a barrier contraception method but the method is not used both while on investigational product and for at least 28 days after the last dose.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the barrier contraception method is used both while on investigational product and for at least 28 days after the last dose.","meaning":"Boolean indicating whether the patient's current barrier contraception method is used both while on investigational product and for at least 28 days after the last dose of investigational product."} // "used while on investigational product AND for duration ≥ 28 days after the last dose of investigational product"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_finding_of_barrier_contraception_method_now@@protocol_described_method
         patient_has_finding_of_barrier_contraception_method_now)
     :named REQ9_AUXILIARY0)) ;; "protocol described barrier contraception"

;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_finding_of_barrier_contraception_method_now@@used_while_on_investigational_product_and_for_at_least_28_days_after_last_dose
         patient_has_finding_of_barrier_contraception_method_now)
     :named REQ9_AUXILIARY1)) ;; "used while on investigational product AND for duration ≥ 28 days after the last dose of investigational product"

;; ===================== Constraint Assertions (REQ 9) =====================
;; If the patient is male AND engages in activity in which conception is possible,
;; then the patient must use protocol described barrier contraception while on investigational product AND for duration ≥ 28 days after the last dose of investigational product.
(assert
  (! (or (not (and patient_sex_is_male_now patient_engages_in_activity_in_which_conception_is_possible_now))
         (and patient_has_finding_of_barrier_contraception_method_now@@protocol_described_method
              patient_has_finding_of_barrier_contraception_method_now@@used_while_on_investigational_product_and_for_at_least_28_days_after_last_dose))
     :named REQ9_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "if the patient is male AND engages in activity in which conception is possible, the patient must use protocol described barrier contraception while on investigational product AND for duration ≥ 28 days after the last dose of investigational product."

;; ===================== Declarations for the criterion (REQ 10) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is not female at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's sex is female at the current time.","meaning":"Indicates whether the patient's sex is female at the current time."} // "female of childbearing potential"
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has childbearing potential.","when_to_set_to_false":"Set to false if the patient currently does not have childbearing potential.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has childbearing potential.","meaning":"Indicates whether the patient currently has childbearing potential."} // "female of childbearing potential"
(declare-const patient_has_pregnancy_test_result_value_recorded_at_screening_withunit_ng_per_ml Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's pregnancy test result at screening, measured in ng/mL.","when_to_set_to_null":"Set to null if the pregnancy test result at screening is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's pregnancy test result at screening in ng/mL."} // "pregnancy test result at screening"
(declare-const patient_has_pregnancy_test_result_value_recorded_at_screening_withunit_ng_per_ml@@is_negative Bool) ;; {"when_to_set_to_true":"Set to true if the pregnancy test result at screening is negative.","when_to_set_to_false":"Set to false if the pregnancy test result at screening is not negative.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the pregnancy test result at screening is negative.","meaning":"Boolean indicating whether the pregnancy test result at screening is negative."} // "negative pregnancy test at screening"
(declare-const patient_has_pregnancy_test_result_value_recorded_at_baseline_withunit_ng_per_ml Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's pregnancy test result at baseline, measured in ng/mL.","when_to_set_to_null":"Set to null if the pregnancy test result at baseline is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's pregnancy test result at baseline in ng/mL."} // "pregnancy test result at baseline"
(declare-const patient_has_pregnancy_test_result_value_recorded_at_baseline_withunit_ng_per_ml@@is_negative Bool) ;; {"when_to_set_to_true":"Set to true if the pregnancy test result at baseline is negative.","when_to_set_to_false":"Set to false if the pregnancy test result at baseline is not negative.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the pregnancy test result at baseline is negative.","meaning":"Boolean indicating whether the pregnancy test result at baseline is negative."} // "negative pregnancy test at baseline"
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently pregnant.","meaning":"Indicates whether the patient is currently pregnant."} // "must have a negative pregnancy test at screening and baseline"
(declare-const patient_engages_in_activity_in_which_conception_is_possible_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently engaging in activity in which conception is possible.","when_to_set_to_false":"Set to false if the patient is currently not engaging in activity in which conception is possible.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently engaging in activity in which conception is possible.","meaning":"Boolean indicating whether the patient is currently engaging in activity in which conception is possible."} // "engages in activity in which conception is possible"
(declare-const patient_has_finding_of_contraception_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using any form of contraception.","when_to_set_to_false":"Set to false if the patient is currently not using any form of contraception.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using contraception.","meaning":"Boolean indicating whether the patient is currently using contraception."} // "contraception"
(declare-const patient_has_finding_of_contraception_now@@protocol_described_method Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using a contraception method that is described in the study protocol.","when_to_set_to_false":"Set to false if the patient is currently using a contraception method that is not described in the study protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the contraception method is protocol described.","meaning":"Boolean indicating whether the patient is currently using a protocol-described contraception method."} // "protocol described contraception"
(declare-const patient_has_finding_of_contraception_now@@used_if_patient_engages_in_activity_in_which_conception_is_possible Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using contraception when engaging in activity in which conception is possible.","when_to_set_to_false":"Set to false if the patient is not using contraception when engaging in activity in which conception is possible.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether contraception is used in this context.","meaning":"Boolean indicating whether the patient is currently using contraception if engaging in activity in which conception is possible."} // "contraception if engaging in activity in which conception is possible"
(declare-const patient_has_finding_of_contraception_now@@used_while_on_investigational_product_and_for_at_least_28_days_after_last_dose Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using contraception while on investigational product and for at least 28 days after the last dose.","when_to_set_to_false":"Set to false if the patient is not using contraception during this period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether contraception is used during this period.","meaning":"Boolean indicating whether the patient is currently using contraception while on investigational product and for at least 28 days after the last dose."} // "contraception while on investigational product and for at least 28 days after last dose"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_finding_of_contraception_now@@protocol_described_method
         patient_has_finding_of_contraception_now)
     :named REQ10_AUXILIARY0)) ;; "protocol described contraception"

(assert
  (! (=> patient_has_finding_of_contraception_now@@used_if_patient_engages_in_activity_in_which_conception_is_possible
         patient_has_finding_of_contraception_now)
     :named REQ10_AUXILIARY1)) ;; "contraception if engaging in activity in which conception is possible"

(assert
  (! (=> patient_has_finding_of_contraception_now@@used_while_on_investigational_product_and_for_at_least_28_days_after_last_dose
         patient_has_finding_of_contraception_now)
     :named REQ10_AUXILIARY2)) ;; "contraception while on investigational product and for at least 28 days after last dose"

;; Pregnancy test result qualifiers imply the test was performed
(assert
  (! (=> patient_has_pregnancy_test_result_value_recorded_at_screening_withunit_ng_per_ml@@is_negative
         true)
     :named REQ10_AUXILIARY3)) ;; "negative pregnancy test at screening"

(assert
  (! (=> patient_has_pregnancy_test_result_value_recorded_at_baseline_withunit_ng_per_ml@@is_negative
         true)
     :named REQ10_AUXILIARY4)) ;; "negative pregnancy test at baseline"

;; ===================== Constraint Assertions (REQ 10) =====================
;; Component 0: If the patient is a female of childbearing potential, must have negative pregnancy test at screening and baseline
(assert
  (! (or (not (and patient_sex_is_female_now patient_has_childbearing_potential_now))
         (and patient_has_pregnancy_test_result_value_recorded_at_screening_withunit_ng_per_ml@@is_negative
              patient_has_pregnancy_test_result_value_recorded_at_baseline_withunit_ng_per_ml@@is_negative))
     :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "if the patient is a female of childbearing potential, the patient must have a negative pregnancy test at screening and baseline"

;; Component 1: If the patient is a female of childbearing potential AND engages in activity in which conception is possible, must use protocol described contraception while on investigational product and for at least 28 days after last dose
(assert
  (! (or (not (and patient_sex_is_female_now patient_has_childbearing_potential_now patient_engages_in_activity_in_which_conception_is_possible_now))
         (and patient_has_finding_of_contraception_now@@protocol_described_method
              patient_has_finding_of_contraception_now@@used_while_on_investigational_product_and_for_at_least_28_days_after_last_dose))
     :named REQ10_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "if the patient is a female of childbearing potential AND engages in activity in which conception is possible, the patient must use protocol described contraception while on investigational product and for at least 28 days after taking the last dose of investigational product"
