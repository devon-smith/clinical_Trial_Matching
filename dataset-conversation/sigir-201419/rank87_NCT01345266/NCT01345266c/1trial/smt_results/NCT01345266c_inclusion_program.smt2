;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 21 years AND aged ≤ 70 years"
(declare-const patient_is_competent_to_give_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently competent to give informed consent.","when_to_set_to_false":"Set to false if the patient is currently not competent to give informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently competent to give informed consent.","meaning":"Boolean indicating whether the patient is currently competent to give informed consent."} // "competent to give informed consent"
(declare-const patient_is_competent_to_understand_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently competent to understand informed consent.","when_to_set_to_false":"Set to false if the patient is currently not competent to understand informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently competent to understand informed consent.","meaning":"Boolean indicating whether the patient is currently competent to understand informed consent."} // "competent to understand informed consent"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 21)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 21 years."
(assert
  (! (<= patient_age_value_recorded_now_in_years 70)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≤ 70 years."
(assert
  (! patient_is_competent_to_understand_informed_consent_now
     :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be competent to understand informed consent."
(assert
  (! patient_is_competent_to_give_informed_consent_now
     :named REQ0_COMPONENT3_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be competent to give informed consent."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female at the current time.","when_to_set_to_null":"Set to null if the patient's sex at the current time is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's sex is female at the current time."} // "the patient must be female"
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently assessed to have childbearing potential.","when_to_set_to_false":"Set to false if the patient is currently assessed to not have childbearing potential.","when_to_set_to_null":"Set to null if the patient's childbearing potential status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient currently has childbearing potential."} // "of child bearing potential"
(declare-const patient_has_undergone_pregnancy_test_before_inclusion Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a pregnancy test before inclusion.","when_to_set_to_false":"Set to false if the patient has not undergone a pregnancy test before inclusion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a pregnancy test before inclusion.","meaning":"Boolean indicating whether the patient has undergone a pregnancy test before inclusion."} // "have provided a negative pregnancy test before inclusion"
(declare-const patient_has_undergone_pregnancy_test_before_inclusion@@result_negative Bool) ;; {"when_to_set_to_true":"Set to true if the pregnancy test before inclusion was negative.","when_to_set_to_false":"Set to false if the pregnancy test before inclusion was not negative.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the pregnancy test before inclusion was negative.","meaning":"Boolean indicating whether the pregnancy test before inclusion was negative."} // "have provided a negative pregnancy test before inclusion"
(declare-const patient_has_undergone_high_resolution_ct_of_lungs_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a high resolution computed tomography scan of the lungs.","when_to_set_to_false":"Set to false if the patient has never undergone a high resolution computed tomography scan of the lungs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a high resolution computed tomography scan of the lungs.","meaning":"Boolean indicating whether the patient has ever undergone a high resolution computed tomography scan of the lungs."} // "high resolution computed tomography scan"
(declare-const patient_has_undergone_high_resolution_ct_of_lungs_inthehistory@@negative_pregnancy_test_provided_prior_to_scan Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a high resolution computed tomography scan of the lungs and a negative pregnancy test was provided prior to the scan.","when_to_set_to_false":"Set to false if the patient has undergone a high resolution computed tomography scan of the lungs and a negative pregnancy test was not provided prior to the scan.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether a negative pregnancy test was provided prior to the scan.","meaning":"Boolean indicating whether a negative pregnancy test was provided prior to the high resolution computed tomography scan of the lungs."} // "have provided a negative pregnancy test prior to any high resolution computed tomography scan"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_undergone_pregnancy_test_before_inclusion@@result_negative
         patient_has_undergone_pregnancy_test_before_inclusion)
     :named REQ1_AUXILIARY0)) ;; "have provided a negative pregnancy test before inclusion"

;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_undergone_high_resolution_ct_of_lungs_inthehistory@@negative_pregnancy_test_provided_prior_to_scan
         patient_has_undergone_high_resolution_ct_of_lungs_inthehistory)
     :named REQ1_AUXILIARY1)) ;; "have provided a negative pregnancy test prior to any high resolution computed tomography scan"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: "To be included, the patient must be female."
(assert
  (! patient_sex_is_female_now
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE))

;; Component 1: "To be included, the patient must be of child bearing potential."
(assert
  (! patient_has_childbearing_potential_now
     :named REQ1_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE))

;; Component 2: "To be included, the patient must have provided a negative pregnancy test before inclusion."
(assert
  (! patient_has_undergone_pregnancy_test_before_inclusion@@result_negative
     :named REQ1_COMPONENT2_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION))

;; Component 3: "To be included, the patient must have provided a negative pregnancy test prior to any high resolution computed tomography scan."
(assert
  (! patient_has_undergone_high_resolution_ct_of_lungs_inthehistory@@negative_pregnancy_test_provided_prior_to_scan
     :named REQ1_COMPONENT3_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION))

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_body_weight_value_recorded_now_withunit_kilograms Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's body weight in kilograms is recorded now.","when_to_set_to_null":"Set to null if no body weight measurement in kilograms is recorded now or the value is indeterminate.","meaning":"Numeric value representing the patient's body weight measured now, in kilograms."} // "body weight < 120 kilograms"
(declare-const patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's body mass index in kilograms per square meter is recorded now.","when_to_set_to_null":"Set to null if no body mass index measurement in kilograms per square meter is recorded now or the value is indeterminate.","meaning":"Numeric value representing the patient's body mass index measured now, in kilograms per square meter."} // "body mass index ≥ 18 kilograms per square meter AND body mass index ≤ 35 kilograms per square meter"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: "body weight < 120 kilograms"
(assert
  (! (< patient_body_weight_value_recorded_now_withunit_kilograms 120.0)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "body weight < 120 kilograms"

;; Component 1: "body mass index ≥ 18 kilograms per square meter"
(assert
  (! (>= patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter 18.0)
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "body mass index ≥ 18 kilograms per square meter"

;; Component 2: "body mass index ≤ 35 kilograms per square meter"
(assert
  (! (<= patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter 35.0)
     :named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "body mass index ≤ 35 kilograms per square meter"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_is_capable_of_complying_with_requirements_listed_in_consent_form Bool) ;; {"when_to_set_to_true":"Set to true if the patient is capable of complying with all requirements listed in the consent form.","when_to_set_to_false":"Set to false if the patient is not capable of complying with all requirements listed in the consent form.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is capable of complying with all requirements listed in the consent form.","meaning":"Boolean indicating whether the patient is capable of complying with the requirements listed in the consent form."} // "capable of complying with the requirements listed in the consent form"
(declare-const patient_is_capable_of_complying_with_restrictions_listed_in_consent_form Bool) ;; {"when_to_set_to_true":"Set to true if the patient is capable of complying with all restrictions listed in the consent form.","when_to_set_to_false":"Set to false if the patient is not capable of complying with all restrictions listed in the consent form.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is capable of complying with all restrictions listed in the consent form.","meaning":"Boolean indicating whether the patient is capable of complying with the restrictions listed in the consent form."} // "capable of complying with the restrictions listed in the consent form"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_is_competent_to_give_informed_consent_now
     :named REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "capable of giving written informed consent"

(assert
  (! patient_is_capable_of_complying_with_requirements_listed_in_consent_form
     :named REQ3_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "capable of complying with the requirements listed in the consent form"

(assert
  (! patient_is_capable_of_complying_with_restrictions_listed_in_consent_form
     :named REQ3_COMPONENT2_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "capable of complying with the restrictions listed in the consent form"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_is_available_to_complete_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient is available to complete the study.","when_to_set_to_false":"Set to false if the patient is not available to complete the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is available to complete the study.","meaning":"Boolean indicating whether the patient is available to complete the study."} // "the patient must be available to complete the study"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! patient_is_available_to_complete_study
     :named REQ4_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must be available to complete the study"

;; ===================== Declarations for the inclusion criterion (REQ 5) =====================
(declare-const patient_has_diagnosis_of_chronic_obstructive_lung_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been clinically diagnosed with chronic obstructive pulmonary disease (COPD) at any time in their history.","when_to_set_to_false":"Set to false if the patient has never been clinically diagnosed with chronic obstructive pulmonary disease (COPD) at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been clinically diagnosed with COPD.","meaning":"Boolean indicating whether the patient has ever been clinically diagnosed with chronic obstructive pulmonary disease (COPD)."} // "clinically diagnosed with chronic obstructive pulmonary disease"
(declare-const patient_has_diagnosis_of_chronic_obstructive_lung_disease_inthehistory@@temporalcontext_at_least_6_months_prior_to_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of COPD has been present for at least 6 months prior to the screening visit.","when_to_set_to_false":"Set to false if the patient's diagnosis of COPD has not been present for at least 6 months prior to the screening visit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis has been present for at least 6 months prior to screening.","meaning":"Boolean indicating whether the patient's COPD diagnosis has been present for at least 6 months prior to screening."} // "for ≥ 6 months prior to screening"
(declare-const patient_is_classified_as_gold_stage_of_chronic_obstructive_pulmonary_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently classified as having COPD according to GOLD 2008 stages (stage I, II, III, or IV).","when_to_set_to_false":"Set to false if the patient is not currently classified as having COPD according to GOLD 2008 stages (stage I, II, III, or IV).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is classified as having COPD according to GOLD 2008 stages.","meaning":"Boolean indicating whether the patient is currently classified as having COPD according to GOLD 2008 stages (stage I, II, III, or IV)."} // "classified as mild, moderate, severe, or very severe chronic obstructive pulmonary disease (stage I, II, III, or IV) as defined by GOLD 2008"
(declare-const post_bronchodilator_fev1_fvc_ratio_value_recorded_prior_to_screening_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's post-bronchodilator FEV1/FVC ratio, recorded prior to screening, expressed as a percent.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined.","meaning":"Numeric value of post-bronchodilator FEV1/FVC ratio, recorded prior to screening, in percent."} // "post bronchodilator forced expiratory volume in one second (FEV1)/forced vital capacity (FVC) < 70 percent"
(declare-const post_bronchodilator_fev1_value_recorded_prior_to_screening_withunit_percent_predicted Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's post-bronchodilator FEV1, recorded prior to screening, expressed as percent of predicted value.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined.","meaning":"Numeric value of post-bronchodilator FEV1, recorded prior to screening, in percent of predicted value."} // "post bronchodilator FEV1 ≥ 80 percent predicted", etc.
(declare-const patient_has_chronic_cough_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chronic cough.","when_to_set_to_false":"Set to false if the patient does not currently have chronic cough.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chronic cough.","meaning":"Boolean indicating whether the patient currently has chronic cough."} // "chronic symptoms (cough)"
(declare-const patient_has_sputum_production_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has sputum production.","when_to_set_to_false":"Set to false if the patient does not currently have sputum production.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has sputum production.","meaning":"Boolean indicating whether the patient currently has sputum production."} // "chronic symptoms (sputum production)"
(declare-const patient_has_chronic_respiratory_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chronic respiratory failure.","when_to_set_to_false":"Set to false if the patient does not currently have chronic respiratory failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chronic respiratory failure.","meaning":"Boolean indicating whether the patient currently has chronic respiratory failure."} // "chronic respiratory failure"

;; Stage-specific Boolean variables
(declare-const patient_is_gold_stage_I_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently classified as GOLD stage I COPD.","when_to_set_to_false":"Set to false if the patient is not currently classified as GOLD stage I COPD.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is classified as GOLD stage I COPD.","meaning":"Boolean indicating whether the patient is currently classified as GOLD stage I COPD."} // "stage I"
(declare-const patient_is_gold_stage_II_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently classified as GOLD stage II COPD.","when_to_set_to_false":"Set to false if the patient is not currently classified as GOLD stage II COPD.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is classified as GOLD stage II COPD.","meaning":"Boolean indicating whether the patient is currently classified as GOLD stage II COPD."} // "stage II"
(declare-const patient_is_gold_stage_III_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently classified as GOLD stage III COPD.","when_to_set_to_false":"Set to false if the patient is not currently classified as GOLD stage III COPD.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is classified as GOLD stage III COPD.","meaning":"Boolean indicating whether the patient is currently classified as GOLD stage III COPD."} // "stage III"
(declare-const patient_is_gold_stage_IV_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently classified as GOLD stage IV COPD.","when_to_set_to_false":"Set to false if the patient is not currently classified as GOLD stage IV COPD.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is classified as GOLD stage IV COPD.","meaning":"Boolean indicating whether the patient is currently classified as GOLD stage IV COPD."} // "stage IV"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_diagnosis_of_chronic_obstructive_lung_disease_inthehistory@@temporalcontext_at_least_6_months_prior_to_screening
         patient_has_diagnosis_of_chronic_obstructive_lung_disease_inthehistory)
     :named REQ5_AUXILIARY0)) ;; "diagnosed with COPD for ≥ 6 months prior to screening"

;; GOLD stage umbrella: exhaustive subcategories
(assert
  (! (= patient_is_classified_as_gold_stage_of_chronic_obstructive_pulmonary_disease_now
        (or patient_is_gold_stage_I_now
            patient_is_gold_stage_II_now
            patient_is_gold_stage_III_now
            patient_is_gold_stage_IV_now))
     :named REQ5_AUXILIARY1)) ;; "classified as mild, moderate, severe, or very severe COPD (stage I, II, III, or IV)"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Component 0: COPD diagnosis for ≥ 6 months prior to screening
(assert
  (! patient_has_diagnosis_of_chronic_obstructive_lung_disease_inthehistory@@temporalcontext_at_least_6_months_prior_to_screening
     :named REQ5_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "clinically diagnosed with COPD for ≥ 6 months prior to screening"

;; Component 1: GOLD stage classification
(assert
  (! patient_is_classified_as_gold_stage_of_chronic_obstructive_pulmonary_disease_now
     :named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "classified as mild, moderate, severe, or very severe COPD (stage I, II, III, or IV) as defined by GOLD 2008"

;; Component 2: FEV1/FVC ratio < 70%
(assert
  (! (< post_bronchodilator_fev1_fvc_ratio_value_recorded_prior_to_screening_withunit_percent 70.0)
     :named REQ5_COMPONENT2_OTHER_REQUIREMENTS)) ;; "post bronchodilator FEV1/FVC < 70 percent"

;; Component 3: Stage-specific FEV1 criteria
(assert
  (! (or
        ;; Stage I: FEV1 ≥ 80% predicted
        (and patient_is_gold_stage_I_now
             (>= post_bronchodilator_fev1_value_recorded_prior_to_screening_withunit_percent_predicted 80.0))
        ;; Stage II: 50% ≤ FEV1 < 80% predicted
        (and patient_is_gold_stage_II_now
             (>= post_bronchodilator_fev1_value_recorded_prior_to_screening_withunit_percent_predicted 50.0)
             (< post_bronchodilator_fev1_value_recorded_prior_to_screening_withunit_percent_predicted 80.0))
        ;; Stage III: 30% ≤ FEV1 < 50% predicted
        (and patient_is_gold_stage_III_now
             (>= post_bronchodilator_fev1_value_recorded_prior_to_screening_withunit_percent_predicted 30.0)
             (< post_bronchodilator_fev1_value_recorded_prior_to_screening_withunit_percent_predicted 50.0))
        ;; Stage IV: FEV1 < 30% predicted OR (FEV1 < 50% predicted AND chronic respiratory failure)
        (and patient_is_gold_stage_IV_now
             (or
               (< post_bronchodilator_fev1_value_recorded_prior_to_screening_withunit_percent_predicted 30.0)
               (and (< post_bronchodilator_fev1_value_recorded_prior_to_screening_withunit_percent_predicted 50.0)
                    patient_has_chronic_respiratory_failure_now))))
     :named REQ5_COMPONENT3_OTHER_REQUIREMENTS)) ;; "stage-specific FEV1 criteria as defined by GOLD 2008"

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_cigarette_pack_years_value_recorded_inthehistory_withunit_pack_years Real) ;; {"when_to_set_to_value":"Set to the patient's total pack years value if a numeric measurement of smoking history is available from any time in the past.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's total smoking history in pack years, recorded in the past."} // "smoking history of ≥ 10 pack years (pack years = (cigarettes per day smoked / 20) × number of years smoked)"
(declare-const patient_has_finding_of_ex_smoker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently an ex-smoker.","when_to_set_to_false":"Set to false if the patient is currently not an ex-smoker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently an ex-smoker.","meaning":"Boolean indicating whether the patient is currently an ex-smoker."} // "an ex-smoker"
(declare-const patient_has_finding_of_smoker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a smoker.","when_to_set_to_false":"Set to false if the patient is currently not a smoker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a smoker.","meaning":"Boolean indicating whether the patient is currently a smoker."} // "a smoker"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Component 0: To be included, the patient must be (a smoker) OR (an ex-smoker with a smoking history of ≥ 10 pack years)
(assert
  (! (or patient_has_finding_of_smoker_now
         (and patient_has_finding_of_ex_smoker_now
              (>= patient_cigarette_pack_years_value_recorded_inthehistory_withunit_pack_years 10.0)))
     :named REQ6_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be (a smoker) OR (an ex-smoker with a smoking history of ≥ 10 pack years (pack years = (cigarettes per day smoked / 20) × number of years smoked))."

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_has_finding_of_acute_respiratory_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding of acute respiratory disease at any time in the past (history).","when_to_set_to_false":"Set to false if the patient has never had a clinical finding of acute respiratory disease in the past (history).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a clinical finding of acute respiratory disease in the past.","meaning":"Boolean indicating whether the patient has ever had a finding of acute respiratory disease in their history."} // "no history of acute respiratory disease within 4 weeks prior to inclusion"
(declare-const patient_has_finding_of_acute_respiratory_disease_inthehistory@@temporalcontext_within4weeks_prior_to_inclusion Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of acute respiratory disease occurred within the 4 weeks prior to inclusion.","when_to_set_to_false":"Set to false if the patient's history of acute respiratory disease did not occur within the 4 weeks prior to inclusion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of acute respiratory disease occurred within the 4 weeks prior to inclusion.","meaning":"Boolean indicating whether the patient's history of acute respiratory disease occurred within the 4 weeks prior to inclusion."} // "no history of acute respiratory disease within 4 weeks prior to inclusion"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_acute_respiratory_disease_inthehistory@@temporalcontext_within4weeks_prior_to_inclusion
         patient_has_finding_of_acute_respiratory_disease_inthehistory)
     :named REQ7_AUXILIARY0)) ;; "history of acute respiratory disease within 4 weeks prior to inclusion" implies "history of acute respiratory disease"

;; ===================== Constraint Assertions (REQ 7) =====================
;; Component 0: Must have NO history of acute respiratory disease within 4 weeks prior to inclusion
(assert
  (! (not patient_has_finding_of_acute_respiratory_disease_inthehistory@@temporalcontext_within4weeks_prior_to_inclusion)
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "no history of acute respiratory disease within 4 weeks prior to inclusion"

;; ===================== Declarations for the criterion (REQ 8) =====================
(declare-const patient_has_diagnosis_of_inflammatory_lung_condition_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with any inflammatory lung condition at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with any inflammatory lung condition at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with any inflammatory lung condition.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of any inflammatory lung condition in their medical history."} // "no history of any other inflammatory lung condition"
(declare-const patient_has_diagnosis_of_carcinoma_of_lung_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with carcinoma of the lung at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with carcinoma of the lung at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with carcinoma of the lung.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of carcinoma of the lung in their medical history."} // "no history of carcinoma of the lung"

;; ===================== Constraint Assertions (REQ 8) =====================
;; Component 0: To be included, the patient must have no history of any other inflammatory lung condition or must have no history of carcinoma of the lung.
(assert
  (! (or (not patient_has_diagnosis_of_inflammatory_lung_condition_inthehistory)
         (not patient_has_diagnosis_of_carcinoma_of_lung_inthehistory))
     :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have no history of any other inflammatory lung condition or must have no history of carcinoma of the lung."

;; ===================== Declarations for the criterion (REQ 9) =====================
(declare-const patient_has_finding_of_exacerbation_of_disease_inthehistory@@temporalcontext_within4weeks_prior_to_inclusion@@requiring_hospitalisation Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had an exacerbation of disease that required hospitalisation within 4 weeks prior to inclusion.","when_to_set_to_false":"Set to false if the patient has not had any exacerbation of disease requiring hospitalisation within 4 weeks prior to inclusion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had an exacerbation of disease requiring hospitalisation within 4 weeks prior to inclusion.","meaning":"Boolean indicating whether the patient has had an exacerbation of disease requiring hospitalisation within 4 weeks prior to inclusion."} // "no exacerbation of disease requiring hospitalisation within 4 weeks prior to inclusion"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
  (! (not patient_has_finding_of_exacerbation_of_disease_inthehistory@@temporalcontext_within4weeks_prior_to_inclusion@@requiring_hospitalisation)
     :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "no exacerbation of disease requiring hospitalisation within 4 weeks prior to inclusion"

;; ===================== Declarations for the criterion (REQ 10) =====================
(declare-const patient_bronchodilator_value_recorded_inthefuture_withunit_hours Real) ;; {"when_to_set_to_value":"Set to the number of hours the patient is able to withhold from bronchodilator use before study assessments, as planned or instructed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many hours the patient can withhold from bronchodilator use before study assessments.","meaning":"Numeric value representing the number of hours the patient is able to withhold from bronchodilator use before study assessments."} // "withhold from bronchodilator for ≥ 6 or ≥ 12 hours before study assessments"
(declare-const patient_bronchodilator_value_recorded_inthefuture_withunit_hours@@short_acting Real) ;; {"when_to_set_to_value":"Set to the number of hours the patient is able to withhold from short acting bronchodilator use before study assessments, as planned or instructed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many hours the patient can withhold from short acting bronchodilator use before study assessments.","meaning":"Numeric value representing the number of hours the patient is able to withhold from short acting bronchodilator use before study assessments."} // "withhold from short acting bronchodilator for ≥ 6 hours before study assessments"
(declare-const patient_bronchodilator_value_recorded_inthefuture_withunit_hours@@long_acting Real) ;; {"when_to_set_to_value":"Set to the number of hours the patient is able to withhold from long acting bronchodilator use before study assessments, as planned or instructed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many hours the patient can withhold from long acting bronchodilator use before study assessments.","meaning":"Numeric value representing the number of hours the patient is able to withhold from long acting bronchodilator use before study assessments."} // "withhold from long acting bronchodilator for ≥ 12 hours before study assessments"

;; ===================== Constraint Assertions (REQ 10) =====================
;; Component 0: Patient must be able to withhold from short acting bronchodilator for ≥ 6 hours before study assessments
(assert
  (! (>= patient_bronchodilator_value_recorded_inthefuture_withunit_hours@@short_acting 6.0)
     :named REQ10_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "must be able to withhold from short acting bronchodilator for ≥ 6 hours before study assessments"

;; Component 1: Patient must be able to withhold from long acting bronchodilator for ≥ 12 hours before study assessments
(assert
  (! (>= patient_bronchodilator_value_recorded_inthefuture_withunit_hours@@long_acting 12.0)
     :named REQ10_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "must be able to withhold from long acting bronchodilator for ≥ 12 hours before study assessments"
