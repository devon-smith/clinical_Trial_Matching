;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_normal_glucose_tolerance_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has normal glucose tolerance.","when_to_set_to_false":"Set to false if the patient currently does not have normal glucose tolerance.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has normal glucose tolerance.","meaning":"Boolean indicating whether the patient currently has normal glucose tolerance."} // "To be included, the patient must have normal glucose tolerance."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_finding_of_normal_glucose_tolerance_now
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have normal glucose tolerance."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_coronary_arteriosclerosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of coronary artery disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of coronary artery disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of coronary artery disease.","meaning":"Boolean indicating whether the patient currently has coronary artery disease."} // "coronary artery disease"
(declare-const patient_has_finding_of_coronary_arteriosclerosis_now@@angiographically_documented Bool) ;; {"when_to_set_to_true":"Set to true if the patient's coronary artery disease is documented by angiography.","when_to_set_to_false":"Set to false if the patient's coronary artery disease is not documented by angiography.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's coronary artery disease is angiographically documented.","meaning":"Boolean indicating whether the patient's coronary artery disease is angiographically documented."} // "angiographically documented coronary artery disease"
(declare-const patient_has_finding_of_myocardial_infarction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a previous history of myocardial infarction.","when_to_set_to_false":"Set to false if the patient does not have a previous history of myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a previous history of myocardial infarction.","meaning":"Boolean indicating whether the patient has a previous history of myocardial infarction."} // "previous history of myocardial infarction"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies the stem variable
(assert
  (! (=> patient_has_finding_of_coronary_arteriosclerosis_now@@angiographically_documented
         patient_has_finding_of_coronary_arteriosclerosis_now)
     :named REQ1_AUXILIARY0)) ;; "angiographically documented coronary artery disease" implies "coronary artery disease"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must have (angiographically documented coronary artery disease OR a previous history of myocardial infarction).
(assert
  (! (or patient_has_finding_of_coronary_arteriosclerosis_now@@angiographically_documented
         patient_has_finding_of_myocardial_infarction_inthehistory)
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "angiographically documented coronary artery disease OR a previous history of myocardial infarction"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_blood_pressure_value_recorded_now_withunit_mm_hg Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's blood pressure is recorded now in mm Hg.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's blood pressure measurement recorded now in mm Hg."} // "blood pressure"
(declare-const patient_blood_pressure_value_recorded_now_withunit_mm_hg@@measured_in_office Bool) ;; {"when_to_set_to_true":"Set to true if the blood pressure measurement was taken in the office setting.","when_to_set_to_false":"Set to false if the blood pressure measurement was not taken in the office setting.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the measurement was taken in the office setting.","meaning":"Indicates whether the blood pressure measurement was taken in the office setting."} // "office"
(declare-const patient_blood_pressure_value_recorded_now_withunit_mm_hg@@is_systolic Bool) ;; {"when_to_set_to_true":"Set to true if the blood pressure measurement is systolic.","when_to_set_to_false":"Set to false if the blood pressure measurement is not systolic.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the measurement is systolic.","meaning":"Indicates whether the blood pressure measurement is systolic."} // "systolic"
(declare-const patient_blood_pressure_value_recorded_now_withunit_mm_hg@@is_diastolic Bool) ;; {"when_to_set_to_true":"Set to true if the blood pressure measurement is diastolic.","when_to_set_to_false":"Set to false if the blood pressure measurement is not diastolic.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the measurement is diastolic.","meaning":"Indicates whether the blood pressure measurement is diastolic."} // "diastolic"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: To be included, the patient must have office systolic blood pressure < 130 mm Hg.
(assert
  (! (and patient_blood_pressure_value_recorded_now_withunit_mm_hg@@measured_in_office
          patient_blood_pressure_value_recorded_now_withunit_mm_hg@@is_systolic
          (< patient_blood_pressure_value_recorded_now_withunit_mm_hg 130.0))
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have office systolic blood pressure < 130 mm Hg."

;; Component 1: To be included, the patient must have office diastolic blood pressure < 80 mm Hg.
(assert
  (! (and patient_blood_pressure_value_recorded_now_withunit_mm_hg@@measured_in_office
          patient_blood_pressure_value_recorded_now_withunit_mm_hg@@is_diastolic
          (< patient_blood_pressure_value_recorded_now_withunit_mm_hg 80.0))
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have office diastolic blood pressure < 80 mm Hg."

;; ===================== Declarations for the inclusion criterion (REQ 3) =====================
(declare-const left_ventricular_mass_index_value_recorded_now_withunit_g_per_m2 Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's left ventricular mass index as recorded now, in grams per square meter (g/m²).","when_to_set_to_null":"Set to null if the patient's left ventricular mass index value is unknown, not documented, or cannot be determined as recorded now.","meaning":"Numeric value representing the patient's left ventricular mass index as recorded now, in grams per square meter (g/m²)."} // "left ventricular mass index > 115 g/m² for men OR left ventricular mass index > 95 g/m² for women"
(declare-const patient_has_finding_of_left_ventricular_hypertrophy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of left ventricular hypertrophy.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of left ventricular hypertrophy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of left ventricular hypertrophy.","meaning":"Boolean indicating whether the patient currently has left ventricular hypertrophy."} // "left ventricular hypertrophy"
(declare-const patient_has_finding_of_left_ventricular_hypertrophy_now@@detected_on_echocardiography Bool) ;; {"when_to_set_to_true":"Set to true if the patient's left ventricular hypertrophy is detected on echocardiography.","when_to_set_to_false":"Set to false if the patient's left ventricular hypertrophy is not detected on echocardiography.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's left ventricular hypertrophy is detected on echocardiography.","meaning":"Boolean indicating whether the patient's left ventricular hypertrophy is detected on echocardiography."} // "on echocardiography"
(declare-const patient_has_finding_of_left_ventricular_hypertrophy_now@@defined_by_american_society_of_echocardiography_criteria Bool) ;; {"when_to_set_to_true":"Set to true if the patient's left ventricular hypertrophy is defined according to American Society of Echocardiography criteria.","when_to_set_to_false":"Set to false if the patient's left ventricular hypertrophy is not defined according to American Society of Echocardiography criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's left ventricular hypertrophy is defined according to American Society of Echocardiography criteria.","meaning":"Boolean indicating whether the patient's left ventricular hypertrophy is defined according to American Society of Echocardiography criteria."} // "according to American Society of Echocardiography criteria"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex matches the specified value (male, female, or other) and is documented.","when_to_set_to_false":"Set to false if the patient's current sex does not match the specified value and is documented.","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Indicates the patient's current sex classification (male, female, or other) as documented."} // "for men OR ... for women"
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex matches the specified value (male, female, or other) and is documented.","when_to_set_to_false":"Set to false if the patient's current sex does not match the specified value and is documented.","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Indicates the patient's current sex classification (male, female, or other) as documented."} // "for men OR ... for women"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_finding_of_left_ventricular_hypertrophy_now@@detected_on_echocardiography
         patient_has_finding_of_left_ventricular_hypertrophy_now)
     :named REQ3_AUXILIARY0)) ;; "detected on echocardiography" implies left ventricular hypertrophy

(assert
  (! (=> patient_has_finding_of_left_ventricular_hypertrophy_now@@defined_by_american_society_of_echocardiography_criteria
         patient_has_finding_of_left_ventricular_hypertrophy_now)
     :named REQ3_AUXILIARY1)) ;; "defined by American Society of Echocardiography criteria" implies left ventricular hypertrophy

;; Definition: American Society of Echocardiography criteria for LVH
(assert
  (! (= patient_has_finding_of_left_ventricular_hypertrophy_now@@defined_by_american_society_of_echocardiography_criteria
        (or (and patient_sex_is_male_now
                 (> left_ventricular_mass_index_value_recorded_now_withunit_g_per_m2 115.0))
            (and patient_sex_is_female_now
                 (> left_ventricular_mass_index_value_recorded_now_withunit_g_per_m2 95.0))))
     :named REQ3_AUXILIARY2)) ;; "left ventricular mass index > 115 g/m² for men OR left ventricular mass index > 95 g/m² for women"

;; "detected on echocardiography" is required for this criterion
(assert
  (! (=> patient_has_finding_of_left_ventricular_hypertrophy_now@@defined_by_american_society_of_echocardiography_criteria
         patient_has_finding_of_left_ventricular_hypertrophy_now@@detected_on_echocardiography)
     :named REQ3_AUXILIARY3)) ;; "on echocardiography" is required for this criterion

;; ===================== Constraint Assertions (REQ 3) =====================
;; Inclusion: must have LVH on echo, defined by ASE criteria
(assert
  (! (and patient_has_finding_of_left_ventricular_hypertrophy_now@@detected_on_echocardiography
          patient_has_finding_of_left_ventricular_hypertrophy_now@@defined_by_american_society_of_echocardiography_criteria)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "presence of left ventricular hypertrophy on echocardiography (according to American Society of Echocardiography criteria: ...)"
