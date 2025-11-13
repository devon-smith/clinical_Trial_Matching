;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_dual_energy_x_ray_photon_absorptiometry_scan_t_score_value_recorded_now_withunit_none Real) ;; {"when_to_set_to_value":"Set to the measured T-score value if a DXA scan T-score at the total hip is recorded now.","when_to_set_to_null":"Set to null if no such T-score measurement at the total hip is available or the value is indeterminate.","meaning":"Numeric value representing the patient's DXA scan T-score at the total hip, recorded now."} ;; "T-score"
(declare-const patient_dual_energy_x_ray_photon_absorptiometry_scan_t_score_value_recorded_now_withunit_none@@measured_at_total_hip Bool) ;; {"when_to_set_to_true":"Set to true if the T-score value is measured at the total hip.","when_to_set_to_false":"Set to false if the T-score value is not measured at the total hip.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the T-score value is measured at the total hip.","meaning":"Boolean indicating whether the T-score value is measured at the total hip."} ;; "measured at the total hip"
(declare-const patient_dual_energy_x_ray_photon_absorptiometry_scan_t_score_value_recorded_now_withunit_none@@measured_at_spine Bool) ;; {"when_to_set_to_true":"Set to true if the T-score value is measured at the spine.","when_to_set_to_false":"Set to false if the T-score value is not measured at the spine.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the T-score value is measured at the spine.","meaning":"Boolean indicating whether the T-score value is measured at the spine."} ;; "measured at the spine"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion: T-score less than -2.5 at the total hip
(assert
(! (not (and patient_dual_energy_x_ray_photon_absorptiometry_scan_t_score_value_recorded_now_withunit_none@@measured_at_total_hip
             (< patient_dual_energy_x_ray_photon_absorptiometry_scan_t_score_value_recorded_now_withunit_none -2.5)))
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a T-score less than -2.5 at the total hip."

;; Exclusion: T-score less than -2.5 at the spine
(assert
(! (not (and patient_dual_energy_x_ray_photon_absorptiometry_scan_t_score_value_recorded_now_withunit_none@@measured_at_spine
             (< patient_dual_energy_x_ray_photon_absorptiometry_scan_t_score_value_recorded_now_withunit_none -2.5)))
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a T-score less than -2.5 at the spine."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patients_compliance_behavior_is_negative_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently not compliant with prescribed or expected behaviors.","when_to_set_to_false":"Set to false if the patient is currently compliant with prescribed or expected behaviors.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently compliant with prescribed or expected behaviors.","meaning":"Boolean indicating whether the patient is currently not compliant with prescribed or expected behaviors."} ;; "compliance"
(declare-const patients_compliance_behavior_is_negative_now@@suspected Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current non-compliance is suspected (not confirmed).","when_to_set_to_false":"Set to false if the patient's current non-compliance is confirmed or if there is no suspicion of non-compliance.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's non-compliance is suspected.","meaning":"Boolean indicating whether the patient's current non-compliance is suspected (not confirmed)."} ;; "suspected to lack compliance"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patients_compliance_behavior_is_negative_now@@suspected
      patients_compliance_behavior_is_negative_now)
:named REQ1_AUXILIARY0)) ;; "suspected to lack compliance"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patients_compliance_behavior_is_negative_now@@suspected)
:named REQ1_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is suspected to lack compliance."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 Real) ;; {"when_to_set_to_value":"Set to the measured BMI value if a numeric measurement of the patient's body mass index (kg/m²) recorded now is available.","when_to_set_to_null":"Set to null if no such BMI measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's body mass index (BMI) measured now in kilograms per square meter."} ;; "body mass index"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (> patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 30))
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a body mass index greater than 30."

(assert
(! (not (< patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 21))
:named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a body mass index less than 21."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_undergone_hormone_replacement_therapy_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone hormone replacement therapy at any time within the past 6 months.","when_to_set_to_false":"Set to false if the patient has not undergone hormone replacement therapy at any time within the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone hormone replacement therapy within the past 6 months.","meaning":"Boolean indicating whether the patient has undergone hormone replacement therapy within the past 6 months."} ;; "hormone replacement therapy within the previous 6 months"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_undergone_hormone_replacement_therapy_inthepast6months)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has used hormone replacement therapy within the previous 6 months."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_used_drug_that_might_interfere_with_bone_metabolism_in_the_past_12_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used any drug that might interfere with bone metabolism within the previous 12 months.","when_to_set_to_false":"Set to false if the patient has not used any drug that might interfere with bone metabolism within the previous 12 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used any drug that might interfere with bone metabolism within the previous 12 months.","meaning":"Boolean indicating whether the patient has used any drug that might interfere with bone metabolism within the previous 12 months."} ;; "has used any drug that might interfere with bone metabolism within the previous 12 months"

(declare-const patient_has_used_drug_that_might_interfere_with_bone_metabolism_in_the_past_12_months@@might_interfere_with_bone_metabolism Bool) ;; {"when_to_set_to_true":"Set to true if the drug used by the patient within the previous 12 months might interfere with bone metabolism.","when_to_set_to_false":"Set to false if the drug used by the patient within the previous 12 months does not interfere with bone metabolism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug used by the patient within the previous 12 months might interfere with bone metabolism.","meaning":"Boolean indicating whether the drug used by the patient within the previous 12 months might interfere with bone metabolism."} ;; "drug might interfere with bone metabolism"

(declare-const patient_is_exposed_to_bisphosphonate_inthepast12months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to bisphosphonate within the previous 12 months.","when_to_set_to_false":"Set to false if the patient has not been exposed to bisphosphonate within the previous 12 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to bisphosphonate within the previous 12 months.","meaning":"Boolean indicating whether the patient has been exposed to bisphosphonate within the previous 12 months."} ;; "bisphosphonate within the previous 12 months"

(declare-const patient_is_exposed_to_selective_estrogen_receptor_modulator_inthepast12months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to a selective estrogen receptor modulator within the previous 12 months.","when_to_set_to_false":"Set to false if the patient has not been exposed to a selective estrogen receptor modulator within the previous 12 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to a selective estrogen receptor modulator within the previous 12 months.","meaning":"Boolean indicating whether the patient has been exposed to a selective estrogen receptor modulator within the previous 12 months."} ;; "estrogen receptor modulator within the previous 12 months"

(declare-const patient_is_exposed_to_calcitonin_inthepast12months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to calcitonin within the previous 12 months.","when_to_set_to_false":"Set to false if the patient has not been exposed to calcitonin within the previous 12 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to calcitonin within the previous 12 months.","meaning":"Boolean indicating whether the patient has been exposed to calcitonin within the previous 12 months."} ;; "calcitonin within the previous 12 months"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_is_exposed_to_bisphosphonate_inthepast12months
           patient_is_exposed_to_selective_estrogen_receptor_modulator_inthepast12months
           patient_is_exposed_to_calcitonin_inthepast12months)
       patient_has_used_drug_that_might_interfere_with_bone_metabolism_in_the_past_12_months)
   :named REQ4_AUXILIARY0)) ;; "with non-exhaustive examples ((bisphosphonate within the previous 12 months) OR (estrogen receptor modulator within the previous 12 months) OR (calcitonin within the previous 12 months))."

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_used_drug_that_might_interfere_with_bone_metabolism_in_the_past_12_months@@might_interfere_with_bone_metabolism
       patient_has_used_drug_that_might_interfere_with_bone_metabolism_in_the_past_12_months)
   :named REQ4_AUXILIARY1)) ;; "drug might interfere with bone metabolism"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_used_drug_that_might_interfere_with_bone_metabolism_in_the_past_12_months)
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has used any drug which might interfere with bone metabolism with non-exhaustive examples ((bisphosphonate within the previous 12 months) OR (estrogen receptor modulator within the previous 12 months) OR (calcitonin within the previous 12 months))."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_systematically_practices_high_intensity_exercise Bool) ;; {"when_to_set_to_true":"Set to true if the patient systematically practices high intensity exercise.","when_to_set_to_false":"Set to false if the patient does not systematically practice high intensity exercise.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient systematically practices high intensity exercise.","meaning":"Boolean indicating whether the patient systematically practices high intensity exercise."} ;; "systematically practices high intensity exercise"
(declare-const patient_systematically_practices_high_intensity_exercise@@systematically_practiced Bool) ;; {"when_to_set_to_true":"Set to true if the patient's practice of high intensity exercise is systematic (regular, planned, and consistent).","when_to_set_to_false":"Set to false if the patient's practice of high intensity exercise is not systematic (irregular, unplanned, or inconsistent).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's practice of high intensity exercise is systematic.","meaning":"Boolean indicating whether the patient's practice of high intensity exercise is systematic."} ;; "systematically practices high intensity exercise"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_systematically_practices_high_intensity_exercise@@systematically_practiced
      patient_systematically_practices_high_intensity_exercise)
:named REQ5_AUXILIARY0)) ;; "systematically practices high intensity exercise"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_systematically_practices_high_intensity_exercise)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient systematically practices high intensity exercise."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_follows_vegetarian_nutrition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently follows vegetarian nutrition.","when_to_set_to_false":"Set to false if the patient currently does not follow vegetarian nutrition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently follows vegetarian nutrition.","meaning":"Boolean indicating whether the patient currently follows vegetarian nutrition."} ;; "the patient follows vegetarian nutrition"
(declare-const patient_has_finding_of_dietary_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently follows any dietary habits.","when_to_set_to_false":"Set to false if the patient currently does not follow any dietary habits.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently follows any dietary habits.","meaning":"Boolean indicating whether the patient currently follows any dietary habits."} ;; "dietary habits"
(declare-const patient_has_finding_of_dietary_finding_now@@extreme Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently follows dietary habits and those habits are extreme.","when_to_set_to_false":"Set to false if the patient currently follows dietary habits but those habits are not extreme.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's dietary habits are extreme.","meaning":"Boolean indicating whether the patient's current dietary habits are extreme."} ;; "any other extreme dietary habits"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_dietary_finding_now@@extreme
      patient_has_finding_of_dietary_finding_now)
:named REQ6_AUXILIARY0)) ;; "any other extreme dietary habits""

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_follows_vegetarian_nutrition_now)
:named REQ6_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient follows vegetarian nutrition."

(assert
(! (not patient_has_finding_of_dietary_finding_now@@extreme)
:named REQ6_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient follows any other extreme dietary habits."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_is_using_dietary_supplements_while_on_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient is using dietary supplements at any time during the study period.","when_to_set_to_false":"Set to false if the patient is not using dietary supplements at any time during the study period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is using dietary supplements during the study period.","meaning":"Boolean indicating whether the patient is using dietary supplements during the study period."} ;; "uses dietary supplements while on study"
(declare-const patient_is_exposed_to_multivitamin_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to a multivitamin agent.","when_to_set_to_false":"Set to false if the patient is not currently exposed to a multivitamin agent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to a multivitamin agent.","meaning":"Boolean indicating whether the patient is currently exposed to a multivitamin agent."} ;; "multivitamins"
(declare-const patient_has_stopped_using_dietary_supplements_before_run_in_period Bool) ;; {"when_to_set_to_true":"Set to true if the patient has stopped using dietary supplements before the run-in period.","when_to_set_to_false":"Set to false if the patient has not stopped using dietary supplements before the run-in period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has stopped using dietary supplements before the run-in period.","meaning":"Boolean indicating whether the patient has stopped using dietary supplements before the run-in period."} ;; "stop using dietary supplements before the run-in period"
(declare-const patient_has_refrained_from_using_dietary_supplements_until_end_of_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient has refrained from using dietary supplements until the end of the study.","when_to_set_to_false":"Set to false if the patient has not refrained from using dietary supplements until the end of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has refrained from using dietary supplements until the end of the study.","meaning":"Boolean indicating whether the patient has refrained from using dietary supplements until the end of the study."} ;; "refrain from using dietary supplements until the end of the study"

;; ===================== Constraint Assertions (REQ 7) =====================
;; Exclusion: (the patient uses dietary supplements while on study AND the patient does NOT use multivitamins)
(assert
(! (not (and patient_is_using_dietary_supplements_while_on_study
             (not patient_is_exposed_to_multivitamin_agent_now)))
    :named REQ7_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient uses dietary supplements while on study AND the patient does NOT use multivitamins"

;; Exclusion: the patient does NOT stop using dietary supplements before the run-in period
(assert
(! (not (not patient_has_stopped_using_dietary_supplements_before_run_in_period))
    :named REQ7_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient does NOT stop using dietary supplements before the run-in period"

;; Exclusion: the patient does NOT refrain from using dietary supplements until the end of the study
(assert
(! (not (not patient_has_refrained_from_using_dietary_supplements_until_end_of_study))
    :named REQ7_COMPONENT2_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient does NOT refrain from using dietary supplements until the end of the study"

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_participated_in_other_study_in_the_past_30_days_before_start_of_each_dosing_phase_t0 Bool) ;; {"when_to_set_to_true":"Set to true if the patient has participated in any other study during the last 30 days before the start of each dosing phase (T0).","when_to_set_to_false":"Set to false if the patient has not participated in any other study during the last 30 days before the start of each dosing phase (T0).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has participated in any other study during the last 30 days before the start of each dosing phase (T0).","meaning":"Boolean indicating whether the patient has participated in any other study during the last 30 days before the start of each dosing phase (T0)."}

(declare-const patient_is_exposed_to_blood_inthepast30days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to blood as a substance in the past 30 days.","when_to_set_to_false":"Set to false if the patient has not been exposed to blood as a substance in the past 30 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to blood as a substance in the past 30 days.","meaning":"Boolean indicating whether the patient has been exposed to blood as a substance in the past 30 days."}

(declare-const patient_is_exposed_to_blood_inthepast30days@@exposure_is_due_to_donation_before_start_of_each_dosing_phase_t0 Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to blood in the past 30 days is specifically due to blood donation before the start of each dosing phase (T0).","when_to_set_to_false":"Set to false if the patient's exposure to blood in the past 30 days is not due to blood donation before the start of each dosing phase (T0).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure to blood in the past 30 days is due to blood donation before the start of each dosing phase (T0).","meaning":"Boolean indicating whether the patient's exposure to blood in the past 30 days is specifically due to blood donation before the start of each dosing phase (T0)."}

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_exposed_to_blood_inthepast30days@@exposure_is_due_to_donation_before_start_of_each_dosing_phase_t0
      patient_is_exposed_to_blood_inthepast30days)
:named REQ8_AUXILIARY0)) ;; "blood donation during the last 30 days before the start of each dosing phase (T0)""

;; ===================== Constraint Assertions (REQ 8) =====================
;; Exclusion: patient must NOT have participated in any other study during the last 30 days before the start of each dosing phase (T0)
(assert
(! (not patient_has_participated_in_other_study_in_the_past_30_days_before_start_of_each_dosing_phase_t0)
:named REQ8_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has participated in any other study during the last 30 days before the start of each dosing phase (T0)."

;; Exclusion: patient must NOT have donated blood during the last 30 days before the start of each dosing phase (T0)
(assert
(! (not patient_is_exposed_to_blood_inthepast30days@@exposure_is_due_to_donation_before_start_of_each_dosing_phase_t0)
:named REQ8_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has donated blood during the last 30 days before the start of each dosing phase (T0)."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_blood_value_recorded_now_withunit_nanograms_per_milliliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's total genistein concentration in blood (in ng/mL) is recorded at the pre-study examination.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's total genistein concentration in blood (ng/mL) measured now."} ;; "blood concentration greater than 100 nanograms per milliliter measured at pre-study examination"
(declare-const patient_blood_value_recorded_now_withunit_nanograms_per_milliliter@@measured_at_pre_study_examination Bool) ;; {"when_to_set_to_true":"Set to true if the measurement of total genistein blood concentration was taken at the pre-study examination.","when_to_set_to_false":"Set to false if the measurement was not taken at the pre-study examination.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the measurement was taken at the pre-study examination.","meaning":"Boolean indicating whether the measurement of total genistein blood concentration was taken at the pre-study examination."} ;; "measured at pre-study examination"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not (and patient_blood_value_recorded_now_withunit_nanograms_per_milliliter@@measured_at_pre_study_examination
             (> patient_blood_value_recorded_now_withunit_nanograms_per_milliliter 100)))
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has total genistein blood concentration greater than 100 nanograms per milliliter measured at pre-study examination."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_finding_of_allergy_to_soy_protein_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has allergy or hypersensitivity to soy protein.","when_to_set_to_false":"Set to false if the patient currently does not have allergy or hypersensitivity to soy protein.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has allergy or hypersensitivity to soy protein.","meaning":"Boolean indicating whether the patient currently has allergy to soy protein."} ;; "known hypersensitivity to soy" OR "allergy to soy"
(declare-const patient_has_allergy_to_soy_isoflavone_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has allergy or hypersensitivity to soy isoflavone.","when_to_set_to_false":"Set to false if the patient currently does not have allergy or hypersensitivity to soy isoflavone.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has allergy or hypersensitivity to soy isoflavone.","meaning":"Boolean indicating whether the patient currently has allergy to soy isoflavone."} ;; "known hypersensitivity to purified isoflavones" OR "allergy to purified isoflavones"
(declare-const patient_has_finding_of_allergy_to_peanut_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has allergy or hypersensitivity to peanut.","when_to_set_to_false":"Set to false if the patient currently does not have allergy or hypersensitivity to peanut.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has allergy or hypersensitivity to peanut.","meaning":"Boolean indicating whether the patient currently has allergy to peanut."} ;; "known hypersensitivity to peanuts" OR "allergy to peanuts"
(declare-const patient_has_finding_of_allergy_to_fish_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a known allergy or hypersensitivity to fish.","when_to_set_to_false":"Set to false if the patient currently does not have a known allergy or hypersensitivity to fish.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a known allergy or hypersensitivity to fish.","meaning":"Boolean indicating whether the patient currently has allergy to fish."} ;; "known hypersensitivity to fish" OR "allergy to fish"
(declare-const patient_has_finding_of_allergy_to_fish_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the patient's allergy to fish is known (documented or confirmed).","when_to_set_to_false":"Set to false if the patient's allergy to fish is not known (not documented or not confirmed).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's allergy to fish is known.","meaning":"Boolean indicating whether the patient's allergy to fish is known."} ;; "known hypersensitivity to fish"
(declare-const patient_has_finding_of_hypersensitivity_to_genistein_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hypersensitivity to genistein.","when_to_set_to_false":"Set to false if the patient currently does not have hypersensitivity to genistein.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypersensitivity to genistein.","meaning":"Boolean indicating whether the patient currently has hypersensitivity to genistein."} ;; "known hypersensitivity to genistein"
(declare-const patient_has_finding_of_hypersensitivity_to_genistein_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hypersensitivity to genistein is known (documented or confirmed).","when_to_set_to_false":"Set to false if the patient's hypersensitivity to genistein is not known (not documented or not confirmed).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's hypersensitivity to genistein is known.","meaning":"Boolean indicating whether the patient's hypersensitivity to genistein is known."} ;; "known hypersensitivity to genistein"
(declare-const patient_has_finding_of_allergy_to_genistein_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has allergy to genistein.","when_to_set_to_false":"Set to false if the patient currently does not have allergy to genistein.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has allergy to genistein.","meaning":"Boolean indicating whether the patient currently has allergy to genistein."} ;; "allergy to genistein"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Qualifier variable implies corresponding stem variable for fish allergy
(assert
(! (=> patient_has_finding_of_allergy_to_fish_now@@known
      patient_has_finding_of_allergy_to_fish_now)
    :named REQ10_AUXILIARY0)) ;; "known hypersensitivity to fish" implies "allergy to fish"

;; Qualifier variable implies corresponding stem variable for genistein hypersensitivity
(assert
(! (=> patient_has_finding_of_hypersensitivity_to_genistein_now@@known
      patient_has_finding_of_hypersensitivity_to_genistein_now)
    :named REQ10_AUXILIARY1)) ;; "known hypersensitivity to genistein" implies "hypersensitivity to genistein"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_has_finding_of_allergy_to_soy_protein_now)
    :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known hypersensitivity to soy OR allergy to soy."

(assert
(! (not patient_has_allergy_to_soy_isoflavone_now)
    :named REQ10_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known hypersensitivity to purified isoflavones OR allergy to purified isoflavones."

(assert
(! (not patient_has_finding_of_allergy_to_peanut_now)
    :named REQ10_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known hypersensitivity to peanuts OR allergy to peanuts."

(assert
(! (not patient_has_finding_of_allergy_to_fish_now)
    :named REQ10_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known hypersensitivity to fish OR allergy to fish."

(assert
(! (not patient_has_finding_of_hypersensitivity_to_genistein_now)
    :named REQ10_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known hypersensitivity to genistein."

(assert
(! (not patient_has_finding_of_allergy_to_genistein_now)
    :named REQ10_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has allergy to genistein."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_undergone_viral_hepatitis_screening_test_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a viral hepatitis screening test by serology at any time in the history.","when_to_set_to_false":"Set to false if the patient has not undergone a viral hepatitis screening test by serology at any time in the history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a viral hepatitis screening test by serology in the history.","meaning":"Boolean indicating whether the patient has undergone a viral hepatitis screening test by serology in the history."} ;; "hepatitis screen"
(declare-const patient_has_undergone_viral_hepatitis_screening_test_inthehistory@@performed_by_serology Bool) ;; {"when_to_set_to_true":"Set to true if the viral hepatitis screening test was performed by serology.","when_to_set_to_false":"Set to false if the viral hepatitis screening test was not performed by serology.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the viral hepatitis screening test was performed by serology.","meaning":"Boolean indicating whether the viral hepatitis screening test was performed by serology."} ;; "performed by serology"
(declare-const patient_has_undergone_viral_hepatitis_screening_test_inthehistory@@was_not_performed Bool) ;; {"when_to_set_to_true":"Set to true if the viral hepatitis screening test was not performed.","when_to_set_to_false":"Set to false if the viral hepatitis screening test was performed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the viral hepatitis screening test was performed or not.","meaning":"Boolean indicating whether the viral hepatitis screening test was not performed."} ;; "was not performed"
(declare-const patient_has_undergone_viral_hepatitis_screening_test_inthehistory_outcome_is_positive Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a viral hepatitis screening test by serology at any time in the history and the outcome was positive.","when_to_set_to_false":"Set to false if the patient has undergone a viral hepatitis screening test by serology at any time in the history and the outcome was not positive.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a viral hepatitis screening test by serology with a positive outcome in the history.","meaning":"Boolean indicating whether the patient has undergone a viral hepatitis screening test by serology in the history and the outcome was positive."} ;; "positive hepatitis screen by serology"
(declare-const patient_has_undergone_viral_hepatitis_screening_test_inthehistory_outcome_is_positive@@performed_by_serology Bool) ;; {"when_to_set_to_true":"Set to true if the viral hepatitis screening test was performed by serology.","when_to_set_to_false":"Set to false if the viral hepatitis screening test was not performed by serology.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the viral hepatitis screening test was performed by serology.","meaning":"Boolean indicating whether the viral hepatitis screening test was performed by serology."} ;; "performed by serology (for positive outcome)"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Qualifier variable implies corresponding stem variable (performed by serology)
(assert
(! (=> patient_has_undergone_viral_hepatitis_screening_test_inthehistory@@performed_by_serology
      patient_has_undergone_viral_hepatitis_screening_test_inthehistory)
    :named REQ11_AUXILIARY0)) ;; "performed by serology"

;; Qualifier variable implies corresponding stem variable (was not performed)
(assert
(! (=> patient_has_undergone_viral_hepatitis_screening_test_inthehistory@@was_not_performed
      (not patient_has_undergone_viral_hepatitis_screening_test_inthehistory))
    :named REQ11_AUXILIARY1)) ;; "was not performed"

;; Qualifier variable for positive outcome implies corresponding stem variable
(assert
(! (=> patient_has_undergone_viral_hepatitis_screening_test_inthehistory_outcome_is_positive@@performed_by_serology
      patient_has_undergone_viral_hepatitis_screening_test_inthehistory_outcome_is_positive)
    :named REQ11_AUXILIARY2)) ;; "performed by serology (for positive outcome)"

;; Positive outcome implies test was performed
(assert
(! (=> patient_has_undergone_viral_hepatitis_screening_test_inthehistory_outcome_is_positive
      patient_has_undergone_viral_hepatitis_screening_test_inthehistory)
    :named REQ11_AUXILIARY3)) ;; "positive hepatitis screen by serology implies test was performed"

;; ===================== Constraint Assertions (REQ 11) =====================
;; Exclusion: patient has a positive hepatitis screen by serology OR hepatitis screen by serology was not performed
(assert
(! (not (or patient_has_undergone_viral_hepatitis_screening_test_inthehistory_outcome_is_positive
            patient_has_undergone_viral_hepatitis_screening_test_inthehistory@@was_not_performed))
    :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has a positive hepatitis screen by serology) OR (the hepatitis screen by serology was not performed))."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_undergone_drug_of_abuse_screen_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a drug of abuse screen now.","when_to_set_to_false":"Set to false if the patient has not undergone a drug of abuse screen now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a drug of abuse screen now.","meaning":"Boolean indicating whether the patient has undergone a drug of abuse screen now."} ;; "drug screen"
(declare-const patient_has_undergone_drug_of_abuse_screen_now@@for_at_least_one_of_amphetamines_benzodiazepines_cannabinoids_opiates Bool) ;; {"when_to_set_to_true":"Set to true if the drug of abuse screen was performed for at least one of amphetamines, benzodiazepines, cannabinoids, or opiates.","when_to_set_to_false":"Set to false if the drug of abuse screen was not performed for any of amphetamines, benzodiazepines, cannabinoids, or opiates.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug of abuse screen was performed for at least one of amphetamines, benzodiazepines, cannabinoids, or opiates.","meaning":"Boolean indicating whether the drug of abuse screen was performed for at least one of amphetamines, benzodiazepines, cannabinoids, or opiates."} ;; "drug screen for at least one of amphetamines, benzodiazepines, cannabinoids, or opiates"
(declare-const patient_has_undergone_drug_of_abuse_screen_now@@was_not_performed Bool) ;; {"when_to_set_to_true":"Set to true if the drug of abuse screen for at least one of amphetamines, benzodiazepines, cannabinoids, or opiates was not performed now.","when_to_set_to_false":"Set to false if the drug of abuse screen for at least one of amphetamines, benzodiazepines, cannabinoids, or opiates was performed now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug of abuse screen for at least one of amphetamines, benzodiazepines, cannabinoids, or opiates was performed now.","meaning":"Boolean indicating whether the drug of abuse screen for at least one of amphetamines, benzodiazepines, cannabinoids, or opiates was not performed now."} ;; "drug screen for at least one of amphetamines, benzodiazepines, cannabinoids, or opiates was not performed"
(declare-const patient_has_undergone_drug_of_abuse_screen_now_outcome_is_positive Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a drug of abuse screen now and the outcome is positive.","when_to_set_to_false":"Set to false if the patient has undergone a drug of abuse screen now and the outcome is not positive.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a drug of abuse screen now and the outcome is positive.","meaning":"Boolean indicating whether the patient has undergone a drug of abuse screen now and the outcome is positive."} ;; "positive drug screen"
(declare-const patient_has_undergone_drug_of_abuse_screen_now_outcome_is_positive@@for_at_least_one_of_amphetamines_benzodiazepines_cannabinoids_opiates Bool) ;; {"when_to_set_to_true":"Set to true if the drug of abuse screen was performed for at least one of amphetamines, benzodiazepines, cannabinoids, or opiates.","when_to_set_to_false":"Set to false if the drug of abuse screen was not performed for any of amphetamines, benzodiazepines, cannabinoids, or opiates.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug of abuse screen was performed for at least one of amphetamines, benzodiazepines, cannabinoids, or opiates.","meaning":"Boolean indicating whether the drug of abuse screen was performed for at least one of amphetamines, benzodiazepines, cannabinoids, or opiates."} ;; "positive drug screen for at least one of amphetamines, benzodiazepines, cannabinoids, or opiates"

;; ===================== Auxiliary Assertions (REQ 12) =====================
;; Qualifier variable implies corresponding stem variable (performed for at least one substance)
(assert
(! (=> patient_has_undergone_drug_of_abuse_screen_now@@for_at_least_one_of_amphetamines_benzodiazepines_cannabinoids_opiates
      patient_has_undergone_drug_of_abuse_screen_now)
:named REQ12_AUXILIARY0)) ;; "drug screen for at least one of amphetamines, benzodiazepines, cannabinoids, or opiates"

;; Qualifier variable implies corresponding stem variable (positive outcome for at least one substance)
(assert
(! (=> patient_has_undergone_drug_of_abuse_screen_now_outcome_is_positive@@for_at_least_one_of_amphetamines_benzodiazepines_cannabinoids_opiates
      patient_has_undergone_drug_of_abuse_screen_now_outcome_is_positive)
:named REQ12_AUXILIARY1)) ;; "positive drug screen for at least one of amphetamines, benzodiazepines, cannabinoids, or opiates"

;; ===================== Constraint Assertions (REQ 12) =====================
;; Exclusion if (positive drug screen for at least one substance) OR (drug screen for at least one substance was not performed)
(assert
(! (not (or patient_has_undergone_drug_of_abuse_screen_now_outcome_is_positive@@for_at_least_one_of_amphetamines_benzodiazepines_cannabinoids_opiates
            patient_has_undergone_drug_of_abuse_screen_now@@was_not_performed))
:named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has a positive drug screen for at least one of the following (amphetamines OR benzodiazepines OR cannabinoids OR opiates)) OR (the drug screen for at least one of the following (amphetamines OR benzodiazepines OR cannabinoids OR opiates) was not performed))."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_is_on_weight_reduction_program_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently participating in a weight reduction program.","when_to_set_to_false":"Set to false if the patient is currently not participating in a weight reduction program.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently participating in a weight reduction program.","meaning":"Boolean indicating whether the patient is currently participating in a weight reduction program."} ;; "the patient is on a weight reduction program"
(declare-const patient_is_on_medically_supervised_diet_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently on a medically supervised diet.","when_to_set_to_false":"Set to false if the patient is currently not on a medically supervised diet.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently on a medically supervised diet.","meaning":"Boolean indicating whether the patient is currently on a medically supervised diet."} ;; "the patient is on a medically supervised diet"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not (or patient_is_on_weight_reduction_program_now
            patient_is_on_medically_supervised_diet_now))
   :named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient is on a weight reduction program) OR (the patient is on a medically supervised diet))."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_unexplained_weight_loss_value_recorded_inthepast3months_withunit_kilograms Real) ;; {"when_to_set_to_value":"Set to the measured or reported amount (in kilograms) of unexplained weight loss the patient has experienced in the three months prior to the study.","when_to_set_to_null":"Set to null if no such measurement or report is available or if it cannot be determined for the three months prior to the study.","meaning":"Numeric value (kilograms) of unexplained weight loss in the three months prior to the study."} ;; "unexplained weight loss of more than 5 kilograms in the three months prior to the study"
(declare-const patient_unintentional_weight_gain_value_recorded_inthepast3months_withunit_kilograms Real) ;; {"when_to_set_to_value":"Set to the measured or reported amount (in kilograms) of unexplained weight gain the patient has experienced in the three months prior to the study.","when_to_set_to_null":"Set to null if no such measurement or report is available or if it cannot be determined for the three months prior to the study.","meaning":"Numeric value (kilograms) of unexplained weight gain in the three months prior to the study."} ;; "unexplained weight gain of more than 5 kilograms in the three months prior to the study"

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
(! (not (> patient_unexplained_weight_loss_value_recorded_inthepast3months_withunit_kilograms 5))
:named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had unexplained weight loss of more than 5 kilograms in the three months prior to the study."

(assert
(! (not (> patient_unintentional_weight_gain_value_recorded_inthepast3months_withunit_kilograms 5))
:named REQ14_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had unexplained weight gain of more than 5 kilograms in the three months prior to the study."

;; ===================== Declarations for the exclusion criterion (REQ 15) =====================
(declare-const patient_has_diagnosis_of_disease_of_liver_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with liver disease at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with liver disease at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with liver disease.","meaning":"Boolean indicating whether the patient has ever been diagnosed with liver disease in their history."} ;; "the patient has a history of liver disease"
(declare-const patient_has_diagnosis_of_disorder_of_pancreas_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with pancreas disease at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with pancreas disease at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with pancreas disease.","meaning":"Boolean indicating whether the patient has ever been diagnosed with pancreas disease in their history."} ;; "the patient has a history of pancreas disease"

;; ===================== Constraint Assertions (REQ 15) =====================
(assert
(! (not patient_has_diagnosis_of_disease_of_liver_inthehistory)
:named REQ15_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of liver disease."

(assert
(! (not patient_has_diagnosis_of_disorder_of_pancreas_inthehistory)
:named REQ15_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of pancreas disease."

;; ===================== Declarations for the exclusion criterion (REQ 16) =====================
(declare-const patient_has_diagnosis_of_disorder_of_cardiovascular_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of disorder of cardiovascular system (cardiovascular disease).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of disorder of cardiovascular system (cardiovascular disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of disorder of cardiovascular system (cardiovascular disease).","meaning":"Boolean indicating whether the patient currently has a diagnosis of disorder of cardiovascular system (cardiovascular disease)."} ;; "cardiovascular disease"
(declare-const patient_has_diagnosis_of_first_degree_atrioventricular_block_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of first degree atrioventricular block.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of first degree atrioventricular block.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of first degree atrioventricular block.","meaning":"Boolean indicating whether the patient currently has a diagnosis of first degree atrioventricular block."} ;; "atrioventricular block first degree"
(declare-const patient_pq_interval_feature_value_recorded_now_withunit_milliseconds Real) ;; {"when_to_set_to_value":"Set to the measured PQ interval value in milliseconds if a measurement recorded now is available.","when_to_set_to_null":"Set to null if no PQ interval measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's PQ interval (atrioventricular conduction time) recorded now in milliseconds."} ;; "PQ time greater than 220 milliseconds"
(declare-const patient_qt_interval_feature_value_recorded_now_withunit_milliseconds Real) ;; {"when_to_set_to_value":"Set to the measured QTc interval value in milliseconds if a measurement recorded now is available.","when_to_set_to_null":"Set to null if no QTc interval measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's QTc interval (QT interval feature) recorded now in milliseconds."} ;; "QTc time greater than 450 milliseconds"

;; ===================== Auxiliary Assertions (REQ 16) =====================
;; Definition: first degree atrioventricular block = PQ interval > 220 ms
(assert
(! (= patient_has_diagnosis_of_first_degree_atrioventricular_block_now
     (> patient_pq_interval_feature_value_recorded_now_withunit_milliseconds 220))
:named REQ16_AUXILIARY0)) ;; "first degree atrioventricular block (defined as PQ time greater than 220 milliseconds)"

;; ===================== Constraint Assertions (REQ 16) =====================
(assert
(! (not patient_has_diagnosis_of_disorder_of_cardiovascular_system_now)
:named REQ16_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has cardiovascular disease."

(assert
(! (not patient_has_diagnosis_of_first_degree_atrioventricular_block_now)
:named REQ16_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has atrioventricular block first degree (defined as PQ time greater than 220 milliseconds)."

(assert
(! (not (> patient_qt_interval_feature_value_recorded_now_withunit_milliseconds 450))
:named REQ16_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has QTc time greater than 450 milliseconds."

;; ===================== Declarations for the exclusion criterion (REQ 17) =====================
(declare-const patient_has_diagnosis_of_malignant_tumor_of_breast_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with malignant tumor of breast (breast cancer) at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with malignant tumor of breast (breast cancer) at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with malignant tumor of breast (breast cancer).","meaning":"Boolean indicating whether the patient has ever had a diagnosis of malignant tumor of breast (breast cancer) in their history."} ;; "history of breast cancer"
(declare-const patient_has_diagnosis_of_endometrial_carcinoma_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with endometrial carcinoma (endometrial cancer) at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with endometrial carcinoma (endometrial cancer) at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with endometrial carcinoma (endometrial cancer).","meaning":"Boolean indicating whether the patient has ever had a diagnosis of endometrial carcinoma (endometrial cancer) in their history."} ;; "history of endometrial cancer"
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with malignant neoplastic disease (malignancy) at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with malignant neoplastic disease (malignancy) at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with malignant neoplastic disease (malignancy).","meaning":"Boolean indicating whether the patient has ever had a diagnosis of malignant neoplastic disease (malignancy) in their history."} ;; "history of other malignancy"
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory@@excludes_basal_cell_skin_cancer_and_squamous_cell_skin_cancer Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of malignant neoplastic disease (malignancy) excludes basal cell skin cancer and squamous cell skin cancer.","when_to_set_to_false":"Set to false if the diagnosis of malignant neoplastic disease (malignancy) includes basal cell skin cancer or squamous cell skin cancer.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether basal cell skin cancer and squamous cell skin cancer are excluded from the diagnosis of malignant neoplastic disease (malignancy).","meaning":"Boolean indicating whether the diagnosis of malignant neoplastic disease (malignancy) excludes basal cell skin cancer and squamous cell skin cancer."} ;; "other malignancy except basal cell skin cancer and squamous cell skin cancer"
(declare-const patient_has_diagnosis_of_basal_cell_skin_cancer_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with basal cell skin cancer at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with basal cell skin cancer at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with basal cell skin cancer.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of basal cell skin cancer in their history."} ;; "history of basal cell skin cancer"
(declare-const patient_has_diagnosis_of_squamous_cell_skin_cancer_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with squamous cell skin cancer at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with squamous cell skin cancer at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with squamous cell skin cancer.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of squamous cell skin cancer in their history."} ;; "history of squamous cell skin cancer"

;; ===================== Auxiliary Assertions (REQ 17) =====================
;; The qualifier variable 'excludes_basal_cell_skin_cancer_and_squamous_cell_skin_cancer' is true if the patient has a history of malignancy AND does NOT have a history of basal cell skin cancer AND does NOT have a history of squamous cell skin cancer.
(assert
(! (= patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory@@excludes_basal_cell_skin_cancer_and_squamous_cell_skin_cancer
     (and patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory
          (not patient_has_diagnosis_of_basal_cell_skin_cancer_inthehistory)
          (not patient_has_diagnosis_of_squamous_cell_skin_cancer_inthehistory)))
:named REQ17_AUXILIARY0)) ;; "other malignancy except basal cell skin cancer and squamous cell skin cancer"

;; ===================== Constraint Assertions (REQ 17) =====================
(assert
(! (not patient_has_diagnosis_of_malignant_tumor_of_breast_inthehistory)
   :named REQ17_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of breast cancer."

(assert
(! (not patient_has_diagnosis_of_endometrial_carcinoma_inthehistory)
   :named REQ17_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of endometrial cancer."

(assert
(! (not patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory@@excludes_basal_cell_skin_cancer_and_squamous_cell_skin_cancer)
   :named REQ17_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a history of other malignancy AND the patient does NOT have a history of basal cell skin cancer AND the patient does NOT have a history of squamous cell skin cancer)."

;; ===================== Declarations for the exclusion criterion (REQ 18) =====================
(declare-const patient_has_finding_of_thromboembolic_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding of thromboembolic disorder (thromboembolism) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a clinical finding of thromboembolic disorder (thromboembolism) in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a thromboembolic disorder.","meaning":"Boolean indicating whether the patient has a history of thromboembolic disorder (thromboembolism)."} ;; "the patient has a history of thromboembolism"
(declare-const patient_has_finding_of_deep_venous_thrombosis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding of deep venous thrombosis at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a clinical finding of deep venous thrombosis in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had deep venous thrombosis.","meaning":"Boolean indicating whether the patient has a history of deep venous thrombosis."} ;; "the patient has a history of deep venous thrombosis"

;; ===================== Constraint Assertions (REQ 18) =====================
(assert
(! (not (or patient_has_finding_of_thromboembolic_disorder_inthehistory
            patient_has_finding_of_deep_venous_thrombosis_inthehistory))
   :named REQ18_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has a history of thromboembolism) OR (the patient has a history of deep venous thrombosis))."

;; ===================== Declarations for the exclusion criterion (REQ 19) =====================
(declare-const patient_has_finding_of_fracture_of_bone_inthepast1years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had any fracture of bone within the past 1 year.","when_to_set_to_false":"Set to false if the patient has not had any fracture of bone within the past 1 year.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had any fracture of bone within the past 1 year.","meaning":"Boolean indicating whether the patient has had any fracture of bone within the past 1 year."} ;; "the patient has had any fracture within one year"
(declare-const patient_has_finding_of_fracture_of_bone_inthepast1years@@limited_only_to_fingers_toes_or_facial_bones Bool) ;; {"when_to_set_to_true":"Set to true if all fractures of bone within the past 1 year are limited ONLY to fingers, toes, or facial bones.","when_to_set_to_false":"Set to false if any fracture of bone within the past 1 year is not limited to fingers, toes, or facial bones.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether all fractures of bone within the past 1 year are limited ONLY to fingers, toes, or facial bones.","meaning":"Boolean indicating whether all fractures of bone within the past 1 year are limited ONLY to fingers, toes, or facial bones."} ;; "fracture(s) within one year limited ONLY to fingers, toes, or facial bones"

;; ===================== Auxiliary Assertions (REQ 19) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_fracture_of_bone_inthepast1years@@limited_only_to_fingers_toes_or_facial_bones
      patient_has_finding_of_fracture_of_bone_inthepast1years)
:named REQ19_AUXILIARY0)) ;; "fracture(s) within one year limited ONLY to fingers, toes, or facial bones" implies "fracture within one year"

;; ===================== Constraint Assertions (REQ 19) =====================
;; Exclusion: patient must NOT have had any fracture within one year unless ALL such fractures are limited ONLY to fingers, toes, or facial bones
(assert
(! (not (and patient_has_finding_of_fracture_of_bone_inthepast1years
             (not patient_has_finding_of_fracture_of_bone_inthepast1years@@limited_only_to_fingers_toes_or_facial_bones)))
:named REQ19_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has had any fracture within one year AND NOT (the patient has had fracture(s) within one year limited ONLY to fingers, toes, or facial bones)"

;; ===================== Declarations for the exclusion criterion (REQ 20) =====================
(declare-const patient_has_finding_of_fracture_of_bone_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a finding or diagnosis of fracture of bone at any point in their history.","when_to_set_to_false":"Set to false if the patient has never had a finding or diagnosis of fracture of bone at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a finding or diagnosis of fracture of bone in their history.","meaning":"Boolean indicating whether the patient has ever had a finding or diagnosis of fracture of bone in their history."} ;; "fracture"

(declare-const patient_has_history_of_being_a_faller Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of being a faller.","when_to_set_to_false":"Set to false if the patient does not have a documented history of being a faller.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a documented history of being a faller.","meaning":"Boolean indicating whether the patient has a documented history of being a faller."} ;; "history of being a faller"

(declare-const patient_has_susceptibility_for_fracture_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented susceptibility for fracture at any point in their history.","when_to_set_to_false":"Set to false if the patient does not have a documented susceptibility for fracture at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a documented susceptibility for fracture in their history.","meaning":"Boolean indicating whether the patient has a documented susceptibility for fracture in their history."} ;; "susceptibility for fracture"

(declare-const patient_has_susceptibility_for_fracture_inthehistory@@as_indicated_by_history_of_being_a_faller Bool) ;; {"when_to_set_to_true":"Set to true if the patient's susceptibility for fracture in their history is indicated by a history of being a faller.","when_to_set_to_false":"Set to false if the patient's susceptibility for fracture in their history is not indicated by a history of being a faller.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's susceptibility for fracture in their history is indicated by a history of being a faller.","meaning":"Boolean indicating whether the patient's susceptibility for fracture in their history is indicated by a history of being a faller."} ;; "susceptibility for fracture as indicated by a history of being a faller"

;; ===================== Auxiliary Assertions (REQ 20) =====================
;; Definition: susceptibility for fracture as indicated by a history of being a faller
(assert
(! (= patient_has_susceptibility_for_fracture_inthehistory@@as_indicated_by_history_of_being_a_faller
(and patient_has_susceptibility_for_fracture_inthehistory
     patient_has_history_of_being_a_faller))
:named REQ20_AUXILIARY0)) ;; "susceptibility for fracture as indicated by a history of being a faller"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_susceptibility_for_fracture_inthehistory@@as_indicated_by_history_of_being_a_faller
       patient_has_susceptibility_for_fracture_inthehistory)
:named REQ20_AUXILIARY1)) ;; "susceptibility for fracture as indicated by a history of being a faller" implies "susceptibility for fracture"

;; ===================== Constraint Assertions (REQ 20) =====================
(assert
(! (not patient_has_susceptibility_for_fracture_inthehistory@@as_indicated_by_history_of_being_a_faller)
:named REQ20_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has susceptibility for fracture as indicated by a history of being a faller."

;; ===================== Declarations for the exclusion criterion (REQ 21) =====================
(declare-const endometrial_thickness_value_recorded_now_withunit_millimeters Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's endometrial thickness in millimeters as measured at the current time.","when_to_set_to_null":"Set to null if the patient's endometrial thickness in millimeters at the current time is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's endometrial thickness in millimeters at the current time."} ;; "endometrial thickness > 6 millimeters"

;; ===================== Constraint Assertions (REQ 21) =====================
(assert
  (! (not (> endometrial_thickness_value_recorded_now_withunit_millimeters 6))
     :named REQ21_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has endometrial thickness > 6 millimeters."

;; ===================== Declarations for the exclusion criterion (REQ 22) =====================
(declare-const patient_has_finding_of_polyp_of_corpus_uteri_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of endometrial polyp (polyp of corpus uteri).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of endometrial polyp (polyp of corpus uteri).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of endometrial polyp (polyp of corpus uteri).","meaning":"Boolean indicating whether the patient currently has an endometrial polyp (polyp of corpus uteri)."} ;; "endometrial polyp"

;; ===================== Constraint Assertions (REQ 22) =====================
(assert
  (! (not patient_has_finding_of_polyp_of_corpus_uteri_now)
     :named REQ22_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has endometrial polyp."

;; ===================== Declarations for the exclusion criterion (REQ 23) =====================
(declare-const patient_has_diagnosis_of_hypothyroidism_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of hypothyroidism.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of hypothyroidism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of hypothyroidism.","meaning":"Boolean indicating whether the patient currently has a diagnosis of hypothyroidism."} ;; "hypothyroidism"
(declare-const patient_has_diagnosis_of_hypothyroidism_now@@untreated Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of hypothyroidism and it is untreated.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of hypothyroidism and it is treated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the hypothyroidism is untreated.","meaning":"Boolean indicating whether the patient's current hypothyroidism is untreated."} ;; "untreated hypothyroidism"
(declare-const patient_has_diagnosis_of_hyperthyroidism_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of hyperthyroidism.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of hyperthyroidism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of hyperthyroidism.","meaning":"Boolean indicating whether the patient currently has a diagnosis of hyperthyroidism."} ;; "hyperthyroidism"
(declare-const patient_has_diagnosis_of_hyperthyroidism_now@@untreated Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of hyperthyroidism and it is untreated.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of hyperthyroidism and it is treated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the hyperthyroidism is untreated.","meaning":"Boolean indicating whether the patient's current hyperthyroidism is untreated."} ;; "untreated hyperthyroidism"

;; ===================== Auxiliary Assertions (REQ 23) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_diagnosis_of_hypothyroidism_now@@untreated
       patient_has_diagnosis_of_hypothyroidism_now)
   :named REQ23_AUXILIARY0)) ;; "untreated hypothyroidism" implies "hypothyroidism"

(assert
(! (=> patient_has_diagnosis_of_hyperthyroidism_now@@untreated
       patient_has_diagnosis_of_hyperthyroidism_now)
   :named REQ23_AUXILIARY1)) ;; "untreated hyperthyroidism" implies "hyperthyroidism"

;; ===================== Constraint Assertions (REQ 23) =====================
(assert
(! (not (or patient_has_diagnosis_of_hypothyroidism_now@@untreated
            patient_has_diagnosis_of_hyperthyroidism_now@@untreated))
   :named REQ23_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if (the patient has untreated hypothyroidism) OR (the patient has untreated hyperthyroidism)."

;; ===================== Declarations for the exclusion criterion (REQ 24) =====================
(declare-const patient_has_diagnosis_of_type_1_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of type 1 diabetes mellitus (insulin-dependent diabetes mellitus).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of type 1 diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of type 1 diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has a diagnosis of type 1 diabetes mellitus."} ;; "insulin-dependent diabetes mellitus"
(declare-const patient_has_diagnosis_of_crohn_s_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of Crohn's disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of Crohn's disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of Crohn's disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of Crohn's disease."} ;; "Crohn's disease"
(declare-const patient_has_diagnosis_of_pituitary_dependent_hypercortisolism_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of pituitary-dependent hypercortisolism (Cushing disease).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of pituitary-dependent hypercortisolism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of pituitary-dependent hypercortisolism.","meaning":"Boolean indicating whether the patient currently has a diagnosis of pituitary-dependent hypercortisolism (Cushing disease)."} ;; "Cushing disease"
(declare-const patient_has_similar_conditions_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a condition similar to insulin-dependent diabetes mellitus, Crohn's disease, or Cushing disease, including but not limited to these non-exhaustive examples.","when_to_set_to_false":"Set to false if the patient currently does not have any condition similar to insulin-dependent diabetes mellitus, Crohn's disease, or Cushing disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a condition similar to insulin-dependent diabetes mellitus, Crohn's disease, or Cushing disease.","meaning":"Boolean indicating whether the patient currently has a condition similar to insulin-dependent diabetes mellitus, Crohn's disease, or Cushing disease, including but not limited to these non-exhaustive examples."} ;; "similar conditions with non-exhaustive examples (insulin-dependent diabetes mellitus, Crohn's disease, Cushing disease)"

;; ===================== Auxiliary Assertions (REQ 24) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_diagnosis_of_type_1_diabetes_mellitus_now
          patient_has_diagnosis_of_crohn_s_disease_now
          patient_has_diagnosis_of_pituitary_dependent_hypercortisolism_now)
    patient_has_similar_conditions_now)
:named REQ24_AUXILIARY0)) ;; "similar conditions with non-exhaustive examples (insulin-dependent diabetes mellitus, Crohn's disease, Cushing disease)"

;; ===================== Constraint Assertions (REQ 24) =====================
(assert
(! (not patient_has_diagnosis_of_type_1_diabetes_mellitus_now)
:named REQ24_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has insulin-dependent diabetes mellitus."

(assert
(! (not patient_has_diagnosis_of_crohn_s_disease_now)
:named REQ24_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has Crohn's disease."

(assert
(! (not patient_has_diagnosis_of_pituitary_dependent_hypercortisolism_now)
:named REQ24_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has Cushing disease."

(assert
(! (not patient_has_similar_conditions_now)
:named REQ24_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has similar conditions with non-exhaustive examples (insulin-dependent diabetes mellitus, Crohn's disease, Cushing disease)."
