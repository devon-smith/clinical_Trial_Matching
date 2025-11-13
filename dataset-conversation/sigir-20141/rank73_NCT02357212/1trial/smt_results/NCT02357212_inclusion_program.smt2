;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female (male or other) at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient's sex is female at the current time."} // "To be included, the patient must be a woman."
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "To be included, the patient must be aged ≥ 18 years."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_sex_is_female_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be a woman."
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be aged ≥ 18 years."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_acute_coronary_syndrome_inthepast48hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient was diagnosed with acute coronary syndrome within the preceding 48 hours.","when_to_set_to_false":"Set to false if the patient was not diagnosed with acute coronary syndrome within the preceding 48 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was diagnosed with acute coronary syndrome within the preceding 48 hours.","meaning":"Boolean indicating whether the patient was diagnosed with acute coronary syndrome within the preceding 48 hours."} // "To be included, the patient must have a non-ST-elevation acute coronary syndrome (defined as (new onset chest discomfort that occurs at rest OR with low levels of activity OR with low levels of emotion) within the preceding 48 hours)."

(declare-const patient_has_symptoms_of_chest_discomfort_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms of chest discomfort.","when_to_set_to_false":"Set to false if the patient currently does not have symptoms of chest discomfort.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptoms of chest discomfort.","meaning":"Boolean indicating whether the patient currently has symptoms of chest discomfort."} // "new onset chest discomfort that occurs at rest OR with low levels of activity OR with low levels of emotion"
(declare-const patient_has_symptoms_of_chest_discomfort_now@@occurs_at_rest_or_with_low_activity_or_emotion Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current chest discomfort occurs at rest, with low levels of activity, or with low levels of emotion.","when_to_set_to_false":"Set to false if the patient's current chest discomfort does not occur in these contexts.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current chest discomfort occurs at rest, with low activity, or low emotion.","meaning":"Boolean indicating whether the patient's current chest discomfort occurs at rest, with low activity, or low emotion."} // "new onset chest discomfort that occurs at rest OR with low levels of activity OR with low levels of emotion"

(declare-const patient_troponin_t_measurement_value_recorded_now_withunit_nanograms_per_milliliter Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of troponin T concentration in nanograms per milliliter is available now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current troponin T concentration in nanograms per milliliter."} // "troponin T concentration ≥ 0.03 nanograms per milliliter"
(declare-const patient_creatine_kinase_mb_measurement_value_recorded_now_withunit_nanograms_per_milliliter Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of creatine kinase MB-isoenzyme concentration in nanograms per milliliter is available now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current creatine kinase MB-isoenzyme concentration in nanograms per milliliter."} // "creatine kinase MB-isoenzyme concentration ≥ 5.0 nanograms per milliliter"
(declare-const patient_n_terminal_pro_brain_natriuretic_peptide_level_value_recorded_now_withunit_picograms_per_milliliter Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of N-terminal pro-B-type natriuretic peptide concentration in picograms per milliliter is available now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current N-terminal pro-B-type natriuretic peptide concentration in picograms per milliliter."} // "N-terminal pro-B-type natriuretic peptide concentration ≥ 450 picograms per milliliter"
(declare-const patient_st_segment_depression_value_recorded_now_withunit_millimeters Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of ST-segment depression in millimeters is available now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current ST-segment depression in millimeters."} // "ST-segment depression ≥ 0.5 millimeters"
(declare-const patient_myocardial_infarction_value_recorded_now_withunit_timi_risk_score Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's TIMI risk score is available now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current Thrombolysis in Myocardial Infarction (TIMI) risk score."} // "Thrombolysis in Myocardial Infarction risk score > 2"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable for chest discomfort implies stem variable
(assert
  (! (=> patient_has_symptoms_of_chest_discomfort_now@@occurs_at_rest_or_with_low_activity_or_emotion
         patient_has_symptoms_of_chest_discomfort_now)
     :named REQ1_AUXILIARY0)) ;; "chest discomfort that occurs at rest OR with low levels of activity OR with low levels of emotion"

;; Definition of non-ST-elevation acute coronary syndrome (NSTE-ACS) as per requirement
(declare-const patient_has_diagnosis_of_non_st_elevation_acute_coronary_syndrome_inthepast48hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a diagnosis of non-ST-elevation acute coronary syndrome within the preceding 48 hours, as defined by new onset chest discomfort at rest or with low activity or emotion within 48 hours.","when_to_set_to_false":"Set to false if the patient does not meet these criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient meets these criteria.","meaning":"Boolean indicating whether the patient has a diagnosis of non-ST-elevation acute coronary syndrome within the preceding 48 hours, as defined by the requirement."} // "non-ST-elevation acute coronary syndrome (defined as (new onset chest discomfort that occurs at rest OR with low levels of activity OR with low levels of emotion) within the preceding 48 hours)"

(assert
  (! (= patient_has_diagnosis_of_non_st_elevation_acute_coronary_syndrome_inthepast48hours
        (and patient_has_diagnosis_of_acute_coronary_syndrome_inthepast48hours
             patient_has_symptoms_of_chest_discomfort_now@@occurs_at_rest_or_with_low_activity_or_emotion))
     :named REQ1_AUXILIARY1)) ;; "non-ST-elevation acute coronary syndrome (defined as (new onset chest discomfort that occurs at rest OR with low levels of activity OR with low levels of emotion) within the preceding 48 hours)"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: Must have non-ST-elevation acute coronary syndrome as defined
(assert
  (! patient_has_diagnosis_of_non_st_elevation_acute_coronary_syndrome_inthepast48hours
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a non-ST-elevation acute coronary syndrome (defined as (new onset chest discomfort that occurs at rest OR with low levels of activity OR with low levels of emotion) within the preceding 48 hours)."

;; Component 1: At least one of the following laboratory or risk score criteria
(assert
  (! (or (>= patient_troponin_t_measurement_value_recorded_now_withunit_nanograms_per_milliliter 0.03)
         (>= patient_creatine_kinase_mb_measurement_value_recorded_now_withunit_nanograms_per_milliliter 5.0)
         (>= patient_n_terminal_pro_brain_natriuretic_peptide_level_value_recorded_now_withunit_picograms_per_milliliter 450.0)
         (>= patient_st_segment_depression_value_recorded_now_withunit_millimeters 0.5)
         (> patient_myocardial_infarction_value_recorded_now_withunit_timi_risk_score 2.0))
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "at least one of the following: (troponin T concentration ≥ 0.03 nanograms per milliliter) OR (creatine kinase MB-isoenzyme concentration ≥ 5.0 nanograms per milliliter) OR (N-terminal pro-B-type natriuretic peptide concentration ≥ 450 picograms per milliliter) OR (ST-segment depression ≥ 0.5 millimeters) OR (Thrombolysis in Myocardial Infarction risk score > 2)"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_elevated_cardiac_enzyme_concentration_after_non_cardiac_surgery_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an elevated cardiac enzyme concentration and this elevation occurred after a non-cardiac surgical procedure.","when_to_set_to_false":"Set to false if the patient currently does not have an elevated cardiac enzyme concentration after non-cardiac surgery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an elevated cardiac enzyme concentration after non-cardiac surgery.","meaning":"Boolean indicating whether the patient currently has an elevated cardiac enzyme concentration after non-cardiac surgery."} // "To be included, the patient must have elevated cardiac enzyme concentration after non-cardiac surgery."
(declare-const patient_has_undergone_surgical_procedure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone any surgical procedure at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone any surgical procedure in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone any surgical procedure in the past.","meaning":"Boolean indicating whether the patient has undergone any surgical procedure in the past."} // "surgery"
(declare-const patient_is_exposed_to_cardiac_enzyme_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to cardiac enzyme.","when_to_set_to_false":"Set to false if the patient is currently not exposed to cardiac enzyme.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to cardiac enzyme.","meaning":"Boolean indicating whether the patient is currently exposed to cardiac enzyme."} // "cardiac enzyme"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; No auxiliary definitions required for this requirement.

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: Patient must be a woman.
(assert
  (! patient_sex_is_female_now
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be a woman."

;; Component 1: Patient must have elevated cardiac enzyme concentration after non-cardiac surgery.
(assert
  (! patient_has_finding_of_elevated_cardiac_enzyme_concentration_after_non_cardiac_surgery_now
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have elevated cardiac enzyme concentration after non-cardiac surgery."
