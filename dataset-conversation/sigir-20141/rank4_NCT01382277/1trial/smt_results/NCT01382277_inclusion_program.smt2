;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_provided_written_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided written informed consent.","when_to_set_to_false":"Set to false if the patient has not provided written informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided written informed consent.","meaning":"Boolean indicating whether the patient has provided written informed consent."} // "To be included, the patient must have provided written informed consent."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_provided_written_informed_consent
     :named REQ0_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have provided written informed consent."

;; ===================== Declarations for the inclusion criteria (REQ 1) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female (e.g., male or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is female."} // "To be included, the patient must be male or female."
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as male.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not male (e.g., female or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is male."} // "To be included, the patient must be male or female."
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 18 years AND aged ≤ 75 years"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: The patient must be male or female.
(assert
  (! (or patient_sex_is_male_now patient_sex_is_female_now)
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be male or female."

;; Component 1: The patient must be aged ≥ 18 years.
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ1_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be aged ≥ 18 years."

;; Component 2: The patient must be aged ≤ 75 years.
(assert
  (! (<= patient_age_value_recorded_now_in_years 75)
     :named REQ1_COMPONENT2_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be aged ≤ 75 years."

;; ===================== Declarations for the inclusion criteria (REQ 2) =====================
(declare-const patient_has_diagnosis_of_stable_angina_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of stable angina.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of stable angina.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of stable angina.","meaning":"Boolean indicating whether the patient currently has a diagnosis of stable angina."} // "To be included, the patient must have been diagnosed with coronary heart disease stable angina for > 1 month."
(declare-const patient_has_diagnosis_of_stable_angina_now@@duration_greater_than_1_month Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of stable angina and the duration of stable angina has been greater than 1 month.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of stable angina but the duration has not been greater than 1 month.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the duration of stable angina has been greater than 1 month.","meaning":"Boolean indicating whether the patient currently has a diagnosis of stable angina and the duration has been greater than 1 month."} // "To be included, the patient must have been diagnosed with coronary heart disease stable angina for > 1 month."
(declare-const patient_has_finding_of_myocardial_infarction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a finding of myocardial infarction in their history.","when_to_set_to_false":"Set to false if the patient has never had a finding of myocardial infarction in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a finding of myocardial infarction in their history.","meaning":"Boolean indicating whether the patient has ever had a finding of myocardial infarction in their history."} // "history of myocardial infarction"
(declare-const patient_has_undergone_coronary_angiography_inthehistory_outcome_is_positive Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone coronary angiography in their history and the outcome was positive (confirmation of coronary heart disease).","when_to_set_to_false":"Set to false if the patient has undergone coronary angiography in their history and the outcome was not positive (no confirmation of coronary heart disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone coronary angiography in their history with a positive outcome.","meaning":"Boolean indicating whether the patient has ever undergone coronary angiography in their history with a positive outcome (confirmation of coronary heart disease)."} // "coronary heart disease confirmed by coronary angiography"
(declare-const patient_has_undergone_electrocardiogram_with_exercise_test_inthehistory_outcome_is_positive Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone an exercise electrocardiogram in their history and the outcome was positive (for coronary heart disease).","when_to_set_to_false":"Set to false if the patient has undergone an exercise electrocardiogram in their history and the outcome was not positive (no evidence of coronary heart disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone an exercise electrocardiogram in their history with a positive outcome.","meaning":"Boolean indicating whether the patient has ever undergone an exercise electrocardiogram in their history with a positive outcome (for coronary heart disease)."} // "exercise electrocardiogram positive for coronary heart disease"
(declare-const patient_has_undergone_electrocardiogram_with_exercise_test_inthehistory_outcome_is_abnormal Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone an exercise electrocardiogram in their history and the outcome was abnormal (showing perfusion defect).","when_to_set_to_false":"Set to false if the patient has undergone an exercise electrocardiogram in their history and the outcome was not abnormal (no perfusion defect).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone an exercise electrocardiogram in their history with an abnormal outcome.","meaning":"Boolean indicating whether the patient has ever undergone an exercise electrocardiogram in their history with an abnormal outcome (showing perfusion defect)."} // "exercise electrocardiogram showing perfusion defect"
(declare-const patient_coronary_artery_stenosis_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured percentage value if a numeric measurement of coronary artery stenosis severity is currently recorded for the patient.","when_to_set_to_null":"Set to null if no such percentage measurement is currently available or the value is indeterminate.","meaning":"Numeric percentage representing the patient's current severity of coronary artery stenosis."} // "one or more main branch of coronary artery stenosis ≥ 50% confirmed by computed tomography scanning"
(declare-const patient_coronary_artery_stenosis_value_recorded_now_withunit_percent@@confirmed_by_computed_tomography_scanning Bool) ;; {"when_to_set_to_true":"Set to true if the percentage severity of coronary artery stenosis is confirmed by computed tomography scanning.","when_to_set_to_false":"Set to false if the percentage severity of coronary artery stenosis is not confirmed by computed tomography scanning.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the percentage severity of coronary artery stenosis is confirmed by computed tomography scanning.","meaning":"Boolean indicating whether the percentage severity of coronary artery stenosis is confirmed by computed tomography scanning."} // "confirmed by computed tomography scanning"
(declare-const patient_coronary_artery_stenosis_value_recorded_now_withunit_percent@@present_in_one_or_more_main_branches Bool) ;; {"when_to_set_to_true":"Set to true if the percentage severity of coronary artery stenosis is present in one or more main branches of the coronary artery.","when_to_set_to_false":"Set to false if the percentage severity of coronary artery stenosis is not present in one or more main branches of the coronary artery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the percentage severity of coronary artery stenosis is present in one or more main branches of the coronary artery.","meaning":"Boolean indicating whether the percentage severity of coronary artery stenosis is present in one or more main branches of the coronary artery."} // "one or more main branch of coronary artery stenosis"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable for stable angina duration implies stem variable
(assert
  (! (=> patient_has_diagnosis_of_stable_angina_now@@duration_greater_than_1_month
         patient_has_diagnosis_of_stable_angina_now)
     :named REQ2_AUXILIARY0)) ;; "duration_greater_than_1_month" implies diagnosis of stable angina

;; Qualifier variable for CT confirmation implies stenosis value is present
(assert
  (! (=> patient_coronary_artery_stenosis_value_recorded_now_withunit_percent@@confirmed_by_computed_tomography_scanning
         (exists ((x Real)) (= x patient_coronary_artery_stenosis_value_recorded_now_withunit_percent)))
     :named REQ2_AUXILIARY1)) ;; "confirmed_by_computed_tomography_scanning" implies stenosis value is present

;; Qualifier variable for main branch presence implies stenosis value is present
(assert
  (! (=> patient_coronary_artery_stenosis_value_recorded_now_withunit_percent@@present_in_one_or_more_main_branches
         (exists ((x Real)) (= x patient_coronary_artery_stenosis_value_recorded_now_withunit_percent)))
     :named REQ2_AUXILIARY2)) ;; "present_in_one_or_more_main_branches" implies stenosis value is present

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: Must have diagnosis of stable angina for > 1 month
(assert
  (! patient_has_diagnosis_of_stable_angina_now@@duration_greater_than_1_month
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "diagnosed with coronary heart disease stable angina for > 1 month"

;; Component 1: At least one of the following must be true:
;; (history of myocardial infarction) OR (coronary heart disease confirmed by coronary angiography) OR (exercise ECG positive for CHD) OR (exercise ECG showing perfusion defect) OR (one or more main branch of coronary artery stenosis ≥ 50% confirmed by CT)
(assert
  (! (or
        patient_has_finding_of_myocardial_infarction_inthehistory
        patient_has_undergone_coronary_angiography_inthehistory_outcome_is_positive
        patient_has_undergone_electrocardiogram_with_exercise_test_inthehistory_outcome_is_positive
        patient_has_undergone_electrocardiogram_with_exercise_test_inthehistory_outcome_is_abnormal
        (and
          patient_coronary_artery_stenosis_value_recorded_now_withunit_percent@@confirmed_by_computed_tomography_scanning
          patient_coronary_artery_stenosis_value_recorded_now_withunit_percent@@present_in_one_or_more_main_branches
          (>= patient_coronary_artery_stenosis_value_recorded_now_withunit_percent 50.0)
        )
     )
     :named REQ2_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "meet at least one of the following: ..."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_hyperlipidemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of hyperlipidemia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of hyperlipidemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of hyperlipidemia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of hyperlipidemia."} // "To be included, the patient must have hyperlipidemia, defined as ((lipid-lowering treatment naïve AND low-density lipoprotein cholesterol ≥ 130 mg/dl) OR (having received lipid-lowering treatment AND low-density lipoprotein cholesterol ≥ 100 mg/dl))."
(declare-const patient_has_undergone_lipid_lowering_therapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone lipid-lowering therapy in the past.","when_to_set_to_false":"Set to false if the patient has never undergone lipid-lowering therapy in the past (i.e., is naïve).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone lipid-lowering therapy.","meaning":"Boolean indicating whether the patient has ever undergone lipid-lowering therapy in the past."} // "lipid-lowering treatment naïve" / "having received lipid-lowering treatment"
(declare-const patient_ldl_cholesterol_value_recorded_now_withunit_mg_per_dl Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current LDL cholesterol in mg/dl is available.","when_to_set_to_null":"Set to null if no current LDL cholesterol measurement in mg/dl is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current low-density lipoprotein cholesterol in mg/dl."} // "low-density lipoprotein cholesterol ≥ 130 mg/dl" / "low-density lipoprotein cholesterol ≥ 100 mg/dl"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Definition of hyperlipidemia per requirement
(assert
  (! (= patient_has_diagnosis_of_hyperlipidemia_now
        (or (and (not patient_has_undergone_lipid_lowering_therapy_inthehistory)
                 (>= patient_ldl_cholesterol_value_recorded_now_withunit_mg_per_dl 130.0))
            (and patient_has_undergone_lipid_lowering_therapy_inthehistory
                 (>= patient_ldl_cholesterol_value_recorded_now_withunit_mg_per_dl 100.0))))
     :named REQ3_AUXILIARY0)) ;; "hyperlipidemia, defined as ((lipid-lowering treatment naïve AND LDL ≥ 130 mg/dl) OR (having received lipid-lowering treatment AND LDL ≥ 100 mg/dl))"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_has_diagnosis_of_hyperlipidemia_now
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have hyperlipidemia, defined as ((lipid-lowering treatment naïve AND LDL ≥ 130 mg/dl) OR (having received lipid-lowering treatment AND LDL ≥ 100 mg/dl))"

;; ===================== Declarations for the inclusion criterion (REQ 4) =====================
(declare-const patient_coronary_artery_stenosis_value_recorded_now_withunit_percent@@narrowest_stenosis Real) ;; {"when_to_set_to_value":"Set to the measured percent stenosis of the narrowest coronary artery segment if a numeric measurement is available now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the percent stenosis of the patient's narrowest coronary artery segment measured now."} // "the narrowest stenosis ≤ 60%"
(declare-const patient_finding_of_lesion_value_recorded_now_withunit_mm Real) ;; {"when_to_set_to_value":"Set to the measured diameter in millimeters if a numeric measurement of the coronary artery lesion diameter is available now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the diameter of the patient's coronary artery lesion measured now, in millimeters."} // "diameter of coronary artery lesion ≥ 2 mm"
(declare-const patient_coronary_artery_lesion_length_value_recorded_now_withunit_mm Real) ;; {"when_to_set_to_value":"Set to the measured length in millimeters if a numeric measurement of the coronary artery lesion length is available now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the length of the patient's coronary artery lesion measured now, in millimeters."} // "length of coronary artery lesion ≥ 5 mm"
(declare-const patient_distance_between_multiple_coronary_artery_lesions_value_recorded_now_withunit_cm Real) ;; {"when_to_set_to_value":"Set to the measured distance in centimeters if a numeric measurement of the distance between multiple coronary artery lesions is available now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the distance between multiple coronary artery lesions measured now, in centimeters."} // "distance between multiple lesions > 1 cm"
(declare-const patient_plaque_density_value_recorded_now_withunit_hounsfield_units Real) ;; {"when_to_set_to_value":"Set to the measured plaque density in Hounsfield units if a numeric measurement is available now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the density of the patient's coronary artery plaque measured now, in Hounsfield units."} // "plaque density < 100 Hounsfield units"
(declare-const patient_has_finding_of_coronary_artery_plaque_calcification_now Bool) ;; {"when_to_set_to_true":"Set to true if calcification in coronary artery plaque is present now.","when_to_set_to_false":"Set to false if calcification in coronary artery plaque is absent now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether calcification in coronary artery plaque is present now.","meaning":"Boolean indicating whether the patient currently has calcification in coronary artery plaque."} // "no calcification"
(declare-const patient_coronary_artery_stenosis_value_recorded_now_withunit_percent@@caused_by_plaques Real) ;; {"when_to_set_to_value":"Set to the measured percent stenosis caused by plaques if a numeric measurement is available now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the percent stenosis of the patient's coronary artery measured now, specifically caused by plaques."} // "vascular stenosis (caused by plaques) ≥ 20% AND ≤ 60%"
(declare-const patient_plaque_thickness_value_recorded_now_withunit_mm Real) ;; {"when_to_set_to_value":"Set to the measured plaque thickness in millimeters if a numeric measurement is available now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the thickness of the patient's coronary artery plaque measured now, in millimeters."} // "plaque thickness > 1 mm"
(declare-const patient_plaque_location_in_coronary_artery_with_previous_percutaneous_coronary_intervention_treatment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's coronary artery plaque is located in a coronary artery with previous percutaneous coronary intervention treatment now.","when_to_set_to_false":"Set to false if the patient's coronary artery plaque is not located in a coronary artery with previous percutaneous coronary intervention treatment now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the plaque is located in a coronary artery with previous percutaneous coronary intervention treatment now.","meaning":"Boolean indicating whether the patient's coronary artery plaque is located in a coronary artery with previous percutaneous coronary intervention treatment now."} // "plaque not in the coronary artery with previous percutaneous coronary intervention treatment"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: at least one significant coronary artery stenosis ≥ 20% AND the narrowest stenosis ≤ 60% as shown by 64 slice computed tomography
(assert
  (! (and (>= patient_coronary_artery_stenosis_value_recorded_now_withunit_percent 20.0)
          (<= patient_coronary_artery_stenosis_value_recorded_now_withunit_percent@@narrowest_stenosis 60.0)
          patient_coronary_artery_stenosis_value_recorded_now_withunit_percent@@confirmed_by_computed_tomography_scanning)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have at least one significant coronary artery stenosis ≥ 20% AND the narrowest stenosis ≤ 60% as shown by 64 slice computed tomography."

;; Component 1: diameter of coronary artery lesion ≥ 2 mm
(assert
  (! (>= patient_finding_of_lesion_value_recorded_now_withunit_mm 2.0)
     :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have diameter of coronary artery lesion ≥ 2 mm."

;; Component 2: length of coronary artery lesion ≥ 5 mm
(assert
  (! (>= patient_coronary_artery_lesion_length_value_recorded_now_withunit_mm 5.0)
     :named REQ4_COMPONENT2_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have length of coronary artery lesion ≥ 5 mm."

;; Component 3: distance between multiple lesions > 1 cm
(assert
  (! (> patient_distance_between_multiple_coronary_artery_lesions_value_recorded_now_withunit_cm 1.0)
     :named REQ4_COMPONENT3_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have distance between multiple lesions > 1 cm."

;; Component 4: plaque density < 100 Hounsfield units
(assert
  (! (< patient_plaque_density_value_recorded_now_withunit_hounsfield_units 100.0)
     :named REQ4_COMPONENT4_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have plaque density < 100 Hounsfield units."

;; Component 5: no calcification
(assert
  (! (not patient_has_finding_of_coronary_artery_plaque_calcification_now)
     :named REQ4_COMPONENT5_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have no calcification."

;; Component 6: vascular stenosis (caused by plaques) ≥ 20% AND ≤ 60%
(assert
  (! (and (>= patient_coronary_artery_stenosis_value_recorded_now_withunit_percent@@caused_by_plaques 20.0)
          (<= patient_coronary_artery_stenosis_value_recorded_now_withunit_percent@@caused_by_plaques 60.0))
     :named REQ4_COMPONENT6_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have vascular stenosis (caused by plaques) ≥ 20% AND ≤ 60%."

;; Component 7: plaque thickness > 1 mm
(assert
  (! (> patient_plaque_thickness_value_recorded_now_withunit_mm 1.0)
     :named REQ4_COMPONENT7_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have plaque thickness > 1 mm."

;; Component 8: plaque not in the coronary artery with previous percutaneous coronary intervention treatment
(assert
  (! (not patient_plaque_location_in_coronary_artery_with_previous_percutaneous_coronary_intervention_treatment_now)
     :named REQ4_COMPONENT8_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have plaque not in the coronary artery with previous percutaneous coronary intervention treatment."
