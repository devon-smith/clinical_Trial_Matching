;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the potential for childbearing (e.g., has not had menopause, has menstrual periods, or is otherwise able to become pregnant).","when_to_set_to_false":"Set to false if the patient currently does not have the potential for childbearing (e.g., has had no menstrual period for greater than 12 months, is postmenopausal, or is otherwise unable to become pregnant).","when_to_set_to_null":"Set to null if the patient's current childbearing potential is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient currently has the potential for childbearing (i.e., is not postmenopausal or otherwise unable to become pregnant)."} ;; "no menstrual period for greater than 12 months"
(declare-const patient_menstruation_value_recorded_now_withunit_months Real) ;; {"when_to_set_to_value":"Set to the number of months since the patient's last menstrual period, as recorded now.","when_to_set_to_null":"Set to null if the duration since last menstrual period is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the number of months since the patient's last menstrual period as of now."} ;; "menstrual period"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Definition: patient has childbearing potential now if and only if the time since last menstrual period is 12 months or less
(assert
(! (= patient_has_childbearing_potential_now
    (<= patient_menstruation_value_recorded_now_withunit_months 12))
:named REQ0_AUXILIARY0)) ;; "no menstrual period for greater than 12 months"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion: patient must NOT have had no menstrual period for greater than 12 months (i.e., must have childbearing potential now)
(assert
(! (not patient_has_childbearing_potential_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had no menstrual period for greater than 12 months."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_undergone_postmenopausal_hormone_replacement_therapy_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone postmenopausal hormone replacement therapy within the past 3 months.","when_to_set_to_false":"Set to false if the patient has not undergone postmenopausal hormone replacement therapy within the past 3 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone postmenopausal hormone replacement therapy within the past 3 months.","meaning":"Boolean indicating whether the patient has undergone postmenopausal hormone replacement therapy within the past 3 months."} ;; "menopausal hormone therapy within the last 3 months"
(declare-const patient_has_finding_of_oral_contraception_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had oral contraception within the past 3 months.","when_to_set_to_false":"Set to false if the patient has not had oral contraception within the past 3 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had oral contraception within the past 3 months.","meaning":"Boolean indicating whether the patient has had oral contraception within the past 3 months."} ;; "oral contraceptives within the last 3 months"
(declare-const patient_has_taken_hormone_containing_product_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken any hormone-containing product within the past 3 months.","when_to_set_to_false":"Set to false if the patient has not taken any hormone-containing product within the past 3 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken any hormone-containing product within the past 3 months.","meaning":"Boolean indicating whether the patient has taken any hormone-containing product within the past 3 months."} ;; "other hormonal medications within the last 3 months"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_undergone_postmenopausal_hormone_replacement_therapy_inthepast3months
           patient_has_finding_of_oral_contraception_inthepast3months
           patient_has_taken_hormone_containing_product_inthepast3months)
    patient_has_taken_hormone_containing_product_inthepast3months)
:named REQ1_AUXILIARY0)) ;; "with non-exhaustive examples (menopausal hormone therapy, oral contraceptives, other hormonal medications) within the last 3 months."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_taken_hormone_containing_product_inthepast3months)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has used hormones with non-exhaustive examples (menopausal hormone therapy, oral contraceptives, other hormonal medications) within the last 3 months."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const months_since_patient_hysterectomy_value_recorded_in_months Real) ;; {"when_to_set_to_value":"Set to the number of months since the patient underwent hysterectomy, if known and documented.","when_to_set_to_null":"Set to null if the number of months since hysterectomy is unknown, not documented, or cannot be determined.","meaning":"Numeric variable representing the number of months since the patient underwent hysterectomy."} ;; "performed greater than 11 months ago"
(declare-const patient_has_undergone_hysterectomy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone hysterectomy at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone hysterectomy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone hysterectomy.","meaning":"Boolean indicating whether the patient has ever undergone hysterectomy at any time in the past."} ;; "history of hysterectomy"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (and patient_has_undergone_hysterectomy_inthehistory
             (> months_since_patient_hysterectomy_value_recorded_in_months 11)))
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of hysterectomy performed greater than 11 months ago."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_abnormal_screening_blood_test_result_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has abnormal screening blood test results.","when_to_set_to_false":"Set to false if the patient currently does not have abnormal screening blood test results.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has abnormal screening blood test results.","meaning":"Boolean indicating whether the patient currently has abnormal screening blood test results."} ;; "abnormal screening blood test results"
(declare-const patient_has_finding_of_serum_creatinine_level_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of abnormal serum creatinine level.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of abnormal serum creatinine level.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of abnormal serum creatinine level.","meaning":"Boolean indicating whether the patient currently has a finding of abnormal serum creatinine level."} ;; "elevated serum creatinine level"
(declare-const patient_has_undergone_serum_calcium_measurement_now_outcome_is_abnormal Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a serum calcium measurement now and the result is abnormal.","when_to_set_to_false":"Set to false if the patient has undergone a serum calcium measurement now and the result is not abnormal.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a serum calcium measurement now with an abnormal result.","meaning":"Boolean indicating whether the patient has undergone a serum calcium measurement now and the outcome is abnormal."} ;; "elevated serum calcium level"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_undergone_serum_calcium_measurement_now_outcome_is_abnormal
          patient_has_finding_of_serum_creatinine_level_finding_now)
    patient_has_abnormal_screening_blood_test_result_now)
:named REQ3_AUXILIARY0)) ;; "with non-exhaustive examples (elevated serum calcium level, elevated serum creatinine level)."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_abnormal_screening_blood_test_result_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has abnormal screening blood test results with non-exhaustive examples (elevated serum calcium level, elevated serum creatinine level)."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_diagnosis_of_medical_condition_where_vitamin_d_supplementation_is_not_indicated_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with a medical condition for which Vitamin D supplementation is not indicated, at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with a medical condition for which Vitamin D supplementation is not indicated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with a medical condition for which Vitamin D supplementation is not indicated.","meaning":"Boolean indicating whether the patient has a history of medical condition for which Vitamin D supplementation is not indicated."} ;; "history of medical conditions where Vitamin D supplementation is not indicated"

(declare-const patient_has_diagnosis_of_medical_condition_where_vitamin_d_supplementation_is_not_indicated_inthehistory@@vitamin_d_supplementation_is_not_indicated Bool) ;; {"when_to_set_to_true":"Set to true if the medical condition is one for which Vitamin D supplementation is not indicated.","when_to_set_to_false":"Set to false if the medical condition is not one for which Vitamin D supplementation is not indicated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether Vitamin D supplementation is not indicated for the medical condition.","meaning":"Boolean indicating whether the medical condition is one for which Vitamin D supplementation is not indicated."} ;; "where Vitamin D supplementation is not indicated"

(declare-const patient_has_diagnosis_of_chronic_renal_insufficiency_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with chronic renal insufficiency at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with chronic renal insufficiency.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with chronic renal insufficiency.","meaning":"Boolean indicating whether the patient has a history of chronic renal insufficiency."} ;; "chronic renal insufficiency"

(declare-const patient_has_diagnosis_of_granulomatous_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with a granulomatous disorder at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with a granulomatous disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with a granulomatous disorder.","meaning":"Boolean indicating whether the patient has a history of granulomatous disorder."} ;; "other granulomatous disease"

(declare-const patient_has_diagnosis_of_malignant_lymphoma_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with malignant lymphoma at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with malignant lymphoma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with malignant lymphoma.","meaning":"Boolean indicating whether the patient has a history of malignant lymphoma."} ;; "lymphoma"

(declare-const patient_has_diagnosis_of_sarcoidosis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with sarcoidosis at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with sarcoidosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with sarcoidosis.","meaning":"Boolean indicating whether the patient has a history of sarcoidosis."} ;; "sarcoidosis"

(declare-const patient_has_diagnosis_of_tuberculosis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with tuberculosis at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with tuberculosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with tuberculosis.","meaning":"Boolean indicating whether the patient has a history of tuberculosis."} ;; "tuberculosis"

(declare-const serum_calcium_value_recorded_now_withunit_mmol_per_l Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's serum calcium level measured at the current time, in mmol/L.","when_to_set_to_null":"Set to null if the serum calcium level is not measured, not documented, or cannot be determined at the current time.","meaning":"Numeric value representing the patient's serum calcium level measured at the current time, in mmol/L."} ;; "serum calcium level measured at the current time, in mmol/L"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_diagnosis_of_chronic_renal_insufficiency_inthehistory
           patient_has_diagnosis_of_sarcoidosis_inthehistory
           patient_has_diagnosis_of_granulomatous_disorder_inthehistory
           patient_has_diagnosis_of_malignant_lymphoma_inthehistory
           patient_has_diagnosis_of_tuberculosis_inthehistory)
    patient_has_diagnosis_of_medical_condition_where_vitamin_d_supplementation_is_not_indicated_inthehistory@@vitamin_d_supplementation_is_not_indicated)
:named REQ4_AUXILIARY0)) ;; "with non-exhaustive examples (chronic renal insufficiency, sarcoidosis, other granulomatous disease, lymphoma, tuberculosis)"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_medical_condition_where_vitamin_d_supplementation_is_not_indicated_inthehistory@@vitamin_d_supplementation_is_not_indicated
    patient_has_diagnosis_of_medical_condition_where_vitamin_d_supplementation_is_not_indicated_inthehistory)
:named REQ4_AUXILIARY1)) ;; "where Vitamin D supplementation is not indicated"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_diagnosis_of_medical_condition_where_vitamin_d_supplementation_is_not_indicated_inthehistory@@vitamin_d_supplementation_is_not_indicated)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of medical conditions where Vitamin D supplementation is not indicated with non-exhaustive examples (chronic renal insufficiency, elevated blood calcium level, sarcoidosis, other granulomatous disease, lymphoma, tuberculosis)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_diagnosis_of_osteoporosis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with osteoporosis at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with osteoporosis at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with osteoporosis.","meaning":"Boolean indicating whether the patient has ever been diagnosed with osteoporosis in their history."} ;; "history of osteoporosis"

(declare-const patient_has_diagnosis_of_osteoporosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of osteoporosis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of osteoporosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of osteoporosis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of osteoporosis."} ;; "osteoporosis on baseline dual-energy x-ray absorptiometry scan"

(declare-const patient_has_diagnosis_of_osteoporosis_now@@detected_on_baseline_dual_energy_x_ray_absorptiometry_scan Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of osteoporosis is specifically detected on the baseline dual-energy x-ray absorptiometry (DXA) scan.","when_to_set_to_false":"Set to false if the patient's current diagnosis of osteoporosis is not detected on the baseline dual-energy x-ray absorptiometry (DXA) scan.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the osteoporosis diagnosis is detected on the baseline dual-energy x-ray absorptiometry scan.","meaning":"Boolean indicating whether the patient's current osteoporosis diagnosis is detected on the baseline dual-energy x-ray absorptiometry scan."} ;; "osteoporosis on baseline dual-energy x-ray absorptiometry scan"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_osteoporosis_now@@detected_on_baseline_dual_energy_x_ray_absorptiometry_scan
       patient_has_diagnosis_of_osteoporosis_now)
   :named REQ5_AUXILIARY0)) ;; "osteoporosis on baseline dual-energy x-ray absorptiometry scan"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not (or patient_has_diagnosis_of_osteoporosis_inthehistory
            patient_has_diagnosis_of_osteoporosis_now@@detected_on_baseline_dual_energy_x_ray_absorptiometry_scan))
   :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of osteoporosis OR osteoporosis on baseline dual-energy x-ray absorptiometry scan."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_vitamin_d_deficiency_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of vitamin D deficiency.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of vitamin D deficiency.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has vitamin D deficiency.","meaning":"Boolean indicating whether the patient currently has vitamin D deficiency."} ;; "Vitamin D deficiency"
(declare-const patient_serum_vitamin_d_measurement_value_recorded_now_withunit_nanograms_per_milliliter Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's current serum vitamin D level in nanograms per milliliter is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current serum vitamin D level in nanograms per milliliter."} ;; "serum Vitamin D level less than 10 nanograms per milliliter"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Definition: Vitamin D deficiency is defined as serum Vitamin D level < 10 ng/mL
(assert
(! (= patient_has_finding_of_vitamin_d_deficiency_now
     (< patient_serum_vitamin_d_measurement_value_recorded_now_withunit_nanograms_per_milliliter 10))
:named REQ6_AUXILIARY0)) ;; "Vitamin D deficiency defined as serum Vitamin D level less than 10 nanograms per milliliter."

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_vitamin_d_deficiency_now)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has Vitamin D deficiency defined as serum Vitamin D level less than 10 nanograms per milliliter."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_vitamin_d_value_recorded_now_withunit_international_units Real) ;; {"when_to_set_to_value":"Set to the measured or reported daily amount of Vitamin D supplementation in international units if available for the patient now.","when_to_set_to_null":"Set to null if the daily amount of Vitamin D supplementation in international units is unknown, not documented, or cannot be determined for the patient now.","meaning":"Numeric value representing the patient's current daily Vitamin D supplementation in international units."} ;; "Vitamin D supplementation daily"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not (> patient_vitamin_d_value_recorded_now_withunit_international_units 400))
:named REQ7_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is consuming greater than 400 international units of Vitamin D supplementation daily."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_smoker_inthepast1years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been a smoker at any time within the past 1 year.","when_to_set_to_false":"Set to false if the patient has not been a smoker at any time within the past 1 year.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been a smoker within the past 1 year.","meaning":"Boolean indicating whether the patient has been a smoker at any time within the past 1 year."} ;; "current tobacco smoker within the last 1 year"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
  (! (not patient_has_finding_of_smoker_inthepast1years)
     :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a current tobacco smoker within the last 1 year."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_is_taking_drug_or_medicament_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any drug or medicament.","when_to_set_to_false":"Set to false if the patient is not currently taking any drug or medicament.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any drug or medicament.","meaning":"Boolean indicating whether the patient is currently taking any drug or medicament."} ;; "medications"
(declare-const patient_is_taking_drug_or_medicament_now@@affects_body_weight Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament being taken by the patient is known to affect body weight.","when_to_set_to_false":"Set to false if the drug or medicament being taken by the patient is known not to affect body weight.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament being taken by the patient affects body weight.","meaning":"Boolean indicating whether the drug or medicament being taken by the patient affects body weight."} ;; "medications that affect body weight"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_taking_drug_or_medicament_now@@affects_body_weight
      patient_is_taking_drug_or_medicament_now)
:named REQ9_AUXILIARY0)) ;; "medications that affect body weight" implies "medications"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_is_taking_drug_or_medicament_now@@affects_body_weight)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is taking medications that affect body weight."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_undergone_bariatric_operative_procedure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a bariatric operative procedure at any time in the past, regardless of outcome or timing relative to study enrollment.","when_to_set_to_false":"Set to false if the patient has never undergone a bariatric operative procedure at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a bariatric operative procedure.","meaning":"Boolean indicating whether the patient has ever undergone a bariatric operative procedure at any time in the past."} ;; "bariatric surgery"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_has_undergone_bariatric_operative_procedure_inthehistory)
    :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had prior bariatric surgery."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_is_taking_medication_that_affects_mood_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a medication that affects mood.","when_to_set_to_false":"Set to false if the patient is currently not taking any medication that affects mood.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a medication that affects mood.","meaning":"Boolean indicating whether the patient is currently taking a medication that affects mood."} ;; "medications that affect mood"
(declare-const patient_is_exposed_to_antidepressant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking or exposed to an antidepressant medication.","when_to_set_to_false":"Set to false if the patient is currently not taking or exposed to any antidepressant medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking or exposed to an antidepressant medication.","meaning":"Boolean indicating whether the patient is currently exposed to (taking) an antidepressant."} ;; "antidepressant medications"
(declare-const patient_is_taking_medication_that_affects_menopausal_symptoms_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a medication that affects menopausal symptoms.","when_to_set_to_false":"Set to false if the patient is currently not taking any medication that affects menopausal symptoms.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a medication that affects menopausal symptoms.","meaning":"Boolean indicating whether the patient is currently taking a medication that affects menopausal symptoms."} ;; "medications that affect menopausal symptoms"
(declare-const patient_is_taking_herbal_medicine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a herbal medication.","when_to_set_to_false":"Set to false if the patient is currently not taking any herbal medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a herbal medication.","meaning":"Boolean indicating whether the patient is currently taking a herbal medication."} ;; "herbal medications"
(declare-const patient_is_taking_medication_that_affects_sleep_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a medication that affects sleep.","when_to_set_to_false":"Set to false if the patient is currently not taking any medication that affects sleep.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a medication that affects sleep.","meaning":"Boolean indicating whether the patient is currently taking a medication that affects sleep."} ;; "medications that affect sleep"
(declare-const patient_is_exposed_to_herbal_medicine_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking or exposed to a herbal supplement.","when_to_set_to_false":"Set to false if the patient is currently not taking or exposed to any herbal supplement.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking or exposed to a herbal supplement.","meaning":"Boolean indicating whether the patient is currently exposed to (taking) a herbal supplement."} ;; "herbal supplements"
(declare-const patient_is_exposed_to_herbal_medicine_agent_now@@affects_mood Bool) ;; {"when_to_set_to_true":"Set to true if the herbal supplement the patient is exposed to affects mood.","when_to_set_to_false":"Set to false if the herbal supplement the patient is exposed to does not affect mood.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the herbal supplement affects mood.","meaning":"Boolean indicating whether the herbal supplement the patient is exposed to affects mood."} ;; "herbal supplements that affect mood"
(declare-const patient_is_exposed_to_herbal_medicine_agent_now@@affects_menopausal_symptoms Bool) ;; {"when_to_set_to_true":"Set to true if the herbal supplement the patient is exposed to affects menopausal symptoms.","when_to_set_to_false":"Set to false if the herbal supplement the patient is exposed to does not affect menopausal symptoms.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the herbal supplement affects menopausal symptoms.","meaning":"Boolean indicating whether the herbal supplement the patient is exposed to affects menopausal symptoms."} ;; "herbal supplements that affect menopausal symptoms"
(declare-const patient_is_exposed_to_herbal_medicine_agent_now@@affects_sleep Bool) ;; {"when_to_set_to_true":"Set to true if the herbal supplement the patient is exposed to affects sleep.","when_to_set_to_false":"Set to false if the herbal supplement the patient is exposed to does not affect sleep.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the herbal supplement affects sleep.","meaning":"Boolean indicating whether the herbal supplement the patient is exposed to affects sleep."} ;; "herbal supplements that affect sleep"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Non-exhaustive example: antidepressant medications imply medication that affects mood
(assert
(! (=> patient_is_exposed_to_antidepressant_now
      patient_is_taking_medication_that_affects_mood_now)
:named REQ11_AUXILIARY0)) ;; "medications that affect mood with non-exhaustive examples (antidepressant medications)"

;; Non-exhaustive example: herbal medications imply medication that affects menopausal symptoms
(assert
(! (=> patient_is_taking_herbal_medicine_now
      patient_is_taking_medication_that_affects_menopausal_symptoms_now)
:named REQ11_AUXILIARY1)) ;; "medications that affect menopausal symptoms with non-exhaustive examples (herbal medications)"

;; Qualifier variables imply corresponding stem variable for herbal supplements
(assert
(! (=> patient_is_exposed_to_herbal_medicine_agent_now@@affects_mood
      patient_is_exposed_to_herbal_medicine_agent_now)
:named REQ11_AUXILIARY2)) ;; "herbal supplements that affect mood"

(assert
(! (=> patient_is_exposed_to_herbal_medicine_agent_now@@affects_menopausal_symptoms
      patient_is_exposed_to_herbal_medicine_agent_now)
:named REQ11_AUXILIARY3)) ;; "herbal supplements that affect menopausal symptoms"

(assert
(! (=> patient_is_exposed_to_herbal_medicine_agent_now@@affects_sleep
      patient_is_exposed_to_herbal_medicine_agent_now)
:named REQ11_AUXILIARY4)) ;; "herbal supplements that affect sleep"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not (or patient_is_taking_medication_that_affects_mood_now
            patient_is_taking_medication_that_affects_menopausal_symptoms_now
            patient_is_taking_medication_that_affects_sleep_now
            patient_is_exposed_to_herbal_medicine_agent_now@@affects_mood
            patient_is_exposed_to_herbal_medicine_agent_now@@affects_menopausal_symptoms
            patient_is_exposed_to_herbal_medicine_agent_now@@affects_sleep))
:named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is taking (medications that affect mood with non-exhaustive examples (antidepressant medications)) OR (medications that affect menopausal symptoms with non-exhaustive examples (herbal medications)) OR (medications that affect sleep) OR (herbal supplements that affect mood) OR (herbal supplements that affect menopausal symptoms) OR (herbal supplements that affect sleep)."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_body_weight_value_recorded_now_withunit_pounds Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current body weight in pounds is available.","when_to_set_to_null":"Set to null if no current measurement of body weight in pounds is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current body weight in pounds."} ;; "weighs more than four hundred pounds"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
  (! (not (> patient_body_weight_value_recorded_now_withunit_pounds 400))
     :named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient weighs more than four hundred pounds."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_is_fluent_in_english_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently fluent in English.","when_to_set_to_false":"Set to false if the patient is currently not fluent in English.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently fluent in English.","meaning":"Boolean indicating whether the patient is currently fluent in English."} ;; "the patient is not fluent in English"
(declare-const patient_has_finding_of_impaired_cognition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of impaired cognition.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of impaired cognition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of impaired cognition.","meaning":"Boolean indicating whether the patient currently has impaired cognition."} ;; "the patient is cognitively impaired"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not (or (not patient_is_fluent_in_english_now)
            patient_has_finding_of_impaired_cognition_now))
:named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is not fluent in English) OR (the patient is cognitively impaired)."
