;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's age in years as recorded now.","when_to_set_to_null":"Set to null if the patient's age in years as recorded now is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's age in years as recorded now."} // "aged 18 years or older"
(declare-const patient_has_finding_of_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently male.","when_to_set_to_false":"Set to false if the patient is currently not male.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently male.","meaning":"Boolean indicating whether the patient is currently male."} // "male"
(declare-const patient_has_finding_of_postmenopausal_state_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently in a postmenopausal state.","when_to_set_to_false":"Set to false if the patient is currently not in a postmenopausal state.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently in a postmenopausal state.","meaning":"Boolean indicating whether the patient is currently in a postmenopausal state."} // "postmenopausal female"
(declare-const patient_has_finding_of_surgically_sterile_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a surgically sterile female.","when_to_set_to_false":"Set to false if the patient is currently not a surgically sterile female.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a surgically sterile female.","meaning":"Boolean indicating whether the patient is currently a surgically sterile female."} // "surgically sterile female"

;; ===================== Constraint Assertions (REQ 0) =====================
;; To be included, the patient must be (a postmenopausal female aged 18 years or older) OR (a surgically sterile female aged 18 years or older) OR (a male aged 18 years or older).
(assert
  (! (or
        (and patient_has_finding_of_postmenopausal_state_now
             (>= patient_age_value_recorded_now_in_years 18.0))
        (and patient_has_finding_of_surgically_sterile_female_now
             (>= patient_age_value_recorded_now_in_years 18.0))
        (and patient_has_finding_of_male_now
             (>= patient_age_value_recorded_now_in_years 18.0)))
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be (a postmenopausal female aged 18 years or older) OR (a surgically sterile female aged 18 years or older) OR (a male aged 18 years or older)."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_acute_coronary_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of acute coronary syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of acute coronary syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has acute coronary syndrome.","meaning":"Boolean indicating whether the patient currently has the clinical finding of acute coronary syndrome."} // "acute coronary syndrome"
(declare-const patient_has_symptoms_of_acute_coronary_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently presenting with symptoms of acute coronary syndrome.","when_to_set_to_false":"Set to false if the patient is currently not presenting with symptoms of acute coronary syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently presenting with symptoms of acute coronary syndrome.","meaning":"Boolean indicating whether the patient is currently presenting with symptoms of acute coronary syndrome."} // "symptoms of acute coronary syndrome"
(declare-const electrocardiogram_has_new_changes_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current electrocardiogram shows new changes.","when_to_set_to_false":"Set to false if the patient's current electrocardiogram does not show new changes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current electrocardiogram shows new changes.","meaning":"Boolean indicating whether the patient's current electrocardiogram shows new changes."} // "new electrocardiogram changes"
(declare-const patient_st_segment_elevation_value_recorded_now_withunit_millimeter Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of ST segment elevation in millimeters recorded now is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current ST segment elevation in millimeters."} // "ST segment elevation ≥ 1 millimeter"
(declare-const patient_st_segment_elevation_value_recorded_now_withunit_millimeter@@occurs_in_greater_than_or_equal_2_contiguous_leads_on_electrocardiogram Bool) ;; {"when_to_set_to_true":"Set to true if the ST segment elevation measurement is from greater than or equal to 2 contiguous leads on electrocardiogram.","when_to_set_to_false":"Set to false if the ST segment elevation measurement is from fewer than 2 contiguous leads or not contiguous.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the measurement is from ≥ 2 contiguous leads.","meaning":"Boolean indicating whether the ST segment elevation measurement is from ≥ 2 contiguous leads on electrocardiogram."} // "in ≥ 2 contiguous leads on electrocardiogram"
(declare-const patient_st_segment_depression_value_recorded_now_withunit_millimeter Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of ST segment depression in millimeters recorded now is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current ST segment depression in millimeters."} // "ST segment depression ≥ 1 millimeter"
(declare-const patient_st_segment_depression_value_recorded_now_withunit_millimeter@@occurs_in_greater_than_or_equal_2_contiguous_leads_on_electrocardiogram Bool) ;; {"when_to_set_to_true":"Set to true if the ST segment depression measurement is from greater than or equal to 2 contiguous leads on electrocardiogram.","when_to_set_to_false":"Set to false if the ST segment depression measurement is from fewer than 2 contiguous leads or not contiguous.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the measurement is from ≥ 2 contiguous leads.","meaning":"Boolean indicating whether the ST segment depression measurement is from ≥ 2 contiguous leads on electrocardiogram."} // "in ≥ 2 contiguous leads on electrocardiogram"
(declare-const patient_creatine_kinase_isoenzyme_mb_fraction_value_recorded_now_withunit_times_upper_limit_of_normal Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of creatine kinase MB isoenzyme in times upper limit of normal recorded now is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current creatine kinase MB isoenzyme measurement in times upper limit of normal."} // "creatine kinase MB isoenzyme ≥ 2 times upper limit of normal"
(declare-const patient_troponin_value_recorded_now_withunit_times_upper_limit_of_normal Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of troponin in times upper limit of normal recorded now is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current troponin measurement in times upper limit of normal."} // "troponin ≥ upper limit of normal"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Definition: New ECG changes are present if either ST elevation or ST depression criteria are met
(assert
  (! (= electrocardiogram_has_new_changes_now
        (or
          (and (>= patient_st_segment_elevation_value_recorded_now_withunit_millimeter 1.0)
               patient_st_segment_elevation_value_recorded_now_withunit_millimeter@@occurs_in_greater_than_or_equal_2_contiguous_leads_on_electrocardiogram)
          (and (>= patient_st_segment_depression_value_recorded_now_withunit_millimeter 1.0)
               patient_st_segment_depression_value_recorded_now_withunit_millimeter@@occurs_in_greater_than_or_equal_2_contiguous_leads_on_electrocardiogram)))
     :named REQ1_AUXILIARY0)) ;; "new electrocardiogram changes (ST segment elevation ≥ 1 millimeter in ≥ 2 contiguous leads on electrocardiogram OR ST segment depression ≥ 1 millimeter in ≥ 2 contiguous leads on electrocardiogram)"

;; Definition: Elevation of biomarkers is present if either CK-MB or troponin criteria are met
(define-fun elevation_of_biomarkers_now () Bool
  (or
    (>= patient_creatine_kinase_isoenzyme_mb_fraction_value_recorded_now_withunit_times_upper_limit_of_normal 2.0)
    (>= patient_troponin_value_recorded_now_withunit_times_upper_limit_of_normal 1.0))) ;; "elevation of biomarkers (creatine kinase MB isoenzyme ≥ 2 times upper limit of normal OR troponin ≥ upper limit of normal)"

;; Definition: The requirement's definition of acute coronary syndrome
(assert
  (! (= patient_has_finding_of_acute_coronary_syndrome_now
        (or
          patient_has_symptoms_of_acute_coronary_syndrome_now
          (and electrocardiogram_has_new_changes_now
               elevation_of_biomarkers_now)))
     :named REQ1_AUXILIARY1)) ;; "acute coronary syndrome (defined as (symptoms of acute coronary syndrome) OR ((new electrocardiogram changes ...) AND (elevation of biomarkers ...)))"

;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_st_segment_elevation_value_recorded_now_withunit_millimeter@@occurs_in_greater_than_or_equal_2_contiguous_leads_on_electrocardiogram
         (>= patient_st_segment_elevation_value_recorded_now_withunit_millimeter 0.0))
     :named REQ1_AUXILIARY2)) ;; "ST segment elevation in ≥ 2 contiguous leads"

(assert
  (! (=> patient_st_segment_depression_value_recorded_now_withunit_millimeter@@occurs_in_greater_than_or_equal_2_contiguous_leads_on_electrocardiogram
         (>= patient_st_segment_depression_value_recorded_now_withunit_millimeter 0.0))
     :named REQ1_AUXILIARY3)) ;; "ST segment depression in ≥ 2 contiguous leads"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_finding_of_acute_coronary_syndrome_now
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be presenting with acute coronary syndrome (defined as ...)"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_self_identifies_as_african_american Bool) ;; {"when_to_set_to_true":"Set to true if the patient self-identifies as African-American.","when_to_set_to_false":"Set to false if the patient does not self-identify as African-American.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient self-identifies as African-American.","meaning":"Boolean indicating whether the patient self-identifies as African-American."} // "the patient must self-identify as African-American"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_self_identifies_as_african_american
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must self-identify as African-American"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const acetylsalicylic_acid_dose_value_recorded_now_withunit_mg Real) ;; {"when_to_set_to_value":"Set to the numeric value of the current daily dose of acetylsalicylic acid (aspirin) the patient is receiving, in milligrams.","when_to_set_to_null":"Set to null if the current daily dose of acetylsalicylic acid (aspirin) is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the current daily dose of acetylsalicylic acid (aspirin) the patient is receiving, measured in milligrams."} // "acetylsalicylic acid 75-100 milligrams daily"
(declare-const acetylsalicylic_acid_dose_value_recorded_now_withunit_mg@@administered_daily Bool) ;; {"when_to_set_to_true":"Set to true if the acetylsalicylic acid (aspirin) dose is administered daily.","when_to_set_to_false":"Set to false if the acetylsalicylic acid (aspirin) dose is not administered daily.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the acetylsalicylic acid (aspirin) dose is administered daily.","meaning":"Boolean indicating whether the acetylsalicylic acid (aspirin) dose is administered daily."} // "acetylsalicylic acid 75-100 milligrams daily"
(declare-const patient_is_exposed_to_aspirin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving or exposed to aspirin (acetylsalicylic acid).","when_to_set_to_false":"Set to false if the patient is currently not receiving or exposed to aspirin (acetylsalicylic acid).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to aspirin (acetylsalicylic acid).","meaning":"Boolean indicating whether the patient is currently exposed to aspirin (acetylsalicylic acid)."} // "receiving treatment with acetylsalicylic acid"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> acetylsalicylic_acid_dose_value_recorded_now_withunit_mg@@administered_daily
         (>= acetylsalicylic_acid_dose_value_recorded_now_withunit_mg 0.0))
     :named REQ3_AUXILIARY0)) ;; "acetylsalicylic acid dose is administered daily"

;; Receiving a dose of acetylsalicylic acid implies exposure to aspirin
(assert
  (! (=> (and acetylsalicylic_acid_dose_value_recorded_now_withunit_mg@@administered_daily
              (>= acetylsalicylic_acid_dose_value_recorded_now_withunit_mg 75.0))
         patient_is_exposed_to_aspirin_now)
     :named REQ3_AUXILIARY1)) ;; "receiving treatment with acetylsalicylic acid"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: patient must be receiving acetylsalicylic acid 75-100 mg daily
(assert
  (! (and acetylsalicylic_acid_dose_value_recorded_now_withunit_mg@@administered_daily
          (>= acetylsalicylic_acid_dose_value_recorded_now_withunit_mg 75.0)
          (<= acetylsalicylic_acid_dose_value_recorded_now_withunit_mg 100.0))
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "acetylsalicylic acid 75-100 milligrams daily"
