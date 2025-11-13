;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_acute_st_segment_elevation_myocardial_infarction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of acute ST-segment elevation myocardial infarction (STEMI).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of acute ST-segment elevation myocardial infarction (STEMI).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of acute ST-segment elevation myocardial infarction (STEMI).","meaning":"Boolean indicating whether the patient currently has acute ST-segment elevation myocardial infarction."} ;; "ST-elevation myocardial infarction"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_has_finding_of_acute_st_segment_elevation_myocardial_infarction_now)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has ST-elevation myocardial infarction."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's systolic blood pressure in millimeters of mercury is recorded now.","when_to_set_to_null":"Set to null if no systolic blood pressure measurement in millimeters of mercury is available for now or the value is indeterminate.","meaning":"Numeric value for the patient's current systolic blood pressure in millimeters of mercury."} ;; "systolic blood pressure less than 100 millimeters of mercury"

(declare-const patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's diastolic blood pressure in millimeters of mercury is recorded now.","when_to_set_to_null":"Set to null if no diastolic blood pressure measurement in millimeters of mercury is available for now or the value is indeterminate.","meaning":"Numeric value for the patient's current diastolic blood pressure in millimeters of mercury."} ;; "diastolic blood pressure less than 70 millimeters of mercury"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (not (< patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 100))
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has systolic blood pressure less than 100 millimeters of mercury."

(assert
  (! (not (< patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 70))
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has diastolic blood pressure less than 70 millimeters of mercury."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_heart_rate_value_recorded_now_withunit_beats_per_minute Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current heart rate in beats per minute is available.","when_to_set_to_null":"Set to null if no current heart rate measurement in beats per minute is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current heart rate in beats per minute."} ;; "heart rate less than 60 beats per minute" / "heart rate greater than 100 beats per minute"
(declare-const patient_has_finding_of_conduction_disorder_of_the_heart_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a conduction disorder of the heart (cardiac arrhythmias).","when_to_set_to_false":"Set to false if the patient currently does not have a conduction disorder of the heart (cardiac arrhythmias).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a conduction disorder of the heart (cardiac arrhythmias).","meaning":"Boolean indicating whether the patient currently has a conduction disorder of the heart (cardiac arrhythmias)."} ;; "cardiac arrhythmias"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Exclusion: patient must NOT have heart rate < 60 bpm
(assert
(! (not (< patient_heart_rate_value_recorded_now_withunit_beats_per_minute 60))
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has heart rate less than 60 beats per minute."

;; Exclusion: patient must NOT have heart rate > 100 bpm
(assert
(! (not (> patient_heart_rate_value_recorded_now_withunit_beats_per_minute 100))
:named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has heart rate greater than 100 beats per minute."

;; Exclusion: patient must NOT have cardiac arrhythmias
(assert
(! (not patient_has_finding_of_conduction_disorder_of_the_heart_now)
:named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has cardiac arrhythmias."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_allergy_to_nicardipine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented allergy to nicardipine.","when_to_set_to_false":"Set to false if the patient currently does not have a documented allergy to nicardipine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an allergy to nicardipine.","meaning":"Boolean indicating whether the patient currently has an allergy to nicardipine."} ;; "allergy to nicardipine"
(declare-const patient_has_finding_of_allergy_to_esmolol_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented allergy to esmolol.","when_to_set_to_false":"Set to false if the patient currently does not have a documented allergy to esmolol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an allergy to esmolol.","meaning":"Boolean indicating whether the patient currently has an allergy to esmolol."} ;; "allergy to esmolol"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (not patient_has_finding_of_allergy_to_nicardipine_now)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has allergy to nicardipine."

(assert
  (! (not patient_has_finding_of_allergy_to_esmolol_now)
     :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has allergy to esmolol."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently documented as pregnant.","when_to_set_to_false":"Set to false if the patient is currently documented as not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female (e.g., male or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is female."} ;; "the patient is a woman"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (not (and patient_sex_is_female_now patient_is_pregnant_now))
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is a woman) AND (the patient is pregnant)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_abnormal_liver_function_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of abnormal liver function (liver dysfunction).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of abnormal liver function (liver dysfunction).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has abnormal liver function.","meaning":"Boolean indicating whether the patient currently has abnormal liver function."} ;; "liver dysfunction"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_abnormal_liver_function_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has liver dysfunction."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_creatinine_level_finding_value_recorded_now_withunit_milligrams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's creatinine concentration in milligrams per deciliter is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current creatinine concentration in milligrams per deciliter."} ;; "creatinine concentration"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! (not (> patient_creatinine_level_finding_value_recorded_now_withunit_milligrams_per_deciliter 2.5))
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has creatinine concentration greater than 2.5 milligrams per deciliter."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_hemorrhagic_cerebral_infarction_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a hemorrhagic cerebral infarction (hemorrhagic stroke) within the past 6 months.","when_to_set_to_false":"Set to false if the patient has not had a hemorrhagic cerebral infarction (hemorrhagic stroke) within the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a hemorrhagic cerebral infarction (hemorrhagic stroke) within the past 6 months.","meaning":"Boolean indicating whether the patient has had a hemorrhagic cerebral infarction (hemorrhagic stroke) within the past 6 months."} ;; "hemorrhagic stroke within 6 months"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! (not patient_has_finding_of_hemorrhagic_cerebral_infarction_inthepast6months)
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had hemorrhagic stroke within 6 months."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_left_ventricular_ejection_fraction_value_recorded_inthehistory_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's left ventricular ejection fraction was recorded at any time in the history, in percent units.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's left ventricular ejection fraction measured in the history, in percent."} ;; "left ventricular ejection fraction"
(declare-const patient_left_ventricular_ejection_fraction_value_recorded_inthehistory_withunit_percent@@measured_before_maximal_medication Bool) ;; {"when_to_set_to_true":"Set to true if the left ventricular ejection fraction measurement was taken before maximal medication was administered.","when_to_set_to_false":"Set to false if the measurement was not taken before maximal medication.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the measurement was taken before maximal medication.","meaning":"Boolean indicating whether the left ventricular ejection fraction measurement was taken before maximal medication."} ;; "before maximal medication"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not (and patient_left_ventricular_ejection_fraction_value_recorded_inthehistory_withunit_percent@@measured_before_maximal_medication
             (< patient_left_ventricular_ejection_fraction_value_recorded_inthehistory_withunit_percent 30)))
    :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has left ventricular ejection fraction less than 30 percent before maximal medication."
