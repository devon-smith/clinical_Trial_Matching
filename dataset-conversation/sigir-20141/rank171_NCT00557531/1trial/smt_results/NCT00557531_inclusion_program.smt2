;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_signed_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has signed an informed consent document.","when_to_set_to_false":"Set to false if the patient has not signed an informed consent document.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has signed an informed consent document.","meaning":"Boolean indicating whether the patient has signed an informed consent document."} // "To be included, the patient must have signed informed consent."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_signed_informed_consent
     :named REQ0_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have signed informed consent."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "age ≥ 18 years AND age ≤ 75 years"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be age ≥ 18 years."

(assert
  (! (<= patient_age_value_recorded_now_in_years 75)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be age ≤ 75 years."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female (e.g., male, other) at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient's sex is female as currently recorded."} // "To be included, the patient must be male or female."
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as male at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not male (e.g., female, other) at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient's sex is male as currently recorded."} // "To be included, the patient must be male or female."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (or patient_sex_is_female_now
         patient_sex_is_male_now)
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be male or female."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has childbearing potential.","when_to_set_to_false":"Set to false if the patient currently does not have childbearing potential.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has childbearing potential.","meaning":"Boolean value indicating whether the patient currently has childbearing potential."} // "woman of child-bearing potential"
(declare-const patient_has_negative_pregnancy_test_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a negative pregnancy test result.","when_to_set_to_false":"Set to false if the patient currently does not have a negative pregnancy test result (i.e., the test is positive or not performed).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a negative pregnancy test result.","meaning":"Boolean indicating whether the patient currently has a negative pregnancy test result."} // "negative pregnancy test"
(declare-const patient_is_postmenopausal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently postmenopausal.","when_to_set_to_false":"Set to false if the patient is currently not postmenopausal.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently postmenopausal.","meaning":"Boolean indicating whether the patient is currently postmenopausal."} // "be postmenopausal"
(declare-const patient_is_surgically_sterile_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently surgically sterile.","when_to_set_to_false":"Set to false if the patient is currently not surgically sterile.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently surgically sterile.","meaning":"Boolean indicating whether the patient is currently surgically sterile."} // "be surgically sterile"

;; ===================== Constraint Assertions (REQ 3) =====================
;; To be included, the patient must ((be a woman of child-bearing potential AND have a negative pregnancy test) OR (be surgically sterile) OR (be postmenopausal)).
(assert
  (! (or
        (and patient_has_childbearing_potential_now
             patient_has_negative_pregnancy_test_now)
        patient_is_surgically_sterile_now
        patient_is_postmenopausal_now)
     :named REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must ((be a woman of child-bearing potential AND have a negative pregnancy test) OR (be surgically sterile) OR (be postmenopausal))."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_troponin_value_recorded_now_withunit_nanogram_per_milliliter Real) ;; {"when_to_set_to_value":"Set to the measured troponin value in nanogram per milliliter if available for the patient now.","when_to_set_to_null":"Set to null if no current troponin measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current troponin concentration in nanogram per milliliter."} // "troponin"
(declare-const patient_troponin_value_recorded_now_withunit_nanogram_per_milliliter@@shows_typical_rise_and_gradual_fall Bool) ;; {"when_to_set_to_true":"Set to true if the patient's troponin measurements demonstrate a typical rise and gradual fall pattern consistent with acute myocardial infarction.","when_to_set_to_false":"Set to false if the patient's troponin measurements do not demonstrate a typical rise and gradual fall pattern.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's troponin measurements show a typical rise and gradual fall.","meaning":"Boolean indicating whether the patient's troponin measurements show a typical rise and gradual fall pattern."} // "a typical rise AND gradual fall of troponin"
(declare-const patient_biochemical_marker_of_myocardial_necrosis_value_recorded_now_withunit_nanogram_per_milliliter Real) ;; {"when_to_set_to_value":"Set to the measured biochemical marker of myocardial necrosis value in nanogram per milliliter if available for the patient now.","when_to_set_to_null":"Set to null if no current biochemical marker of myocardial necrosis measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current biochemical marker of myocardial necrosis concentration in nanogram per milliliter."} // "biochemical markers of myocardial necrosis"
(declare-const patient_biochemical_marker_of_myocardial_necrosis_value_recorded_now_withunit_nanogram_per_milliliter@@shows_typical_rise_and_gradual_fall Bool) ;; {"when_to_set_to_true":"Set to true if the patient's biochemical marker of myocardial necrosis measurements demonstrate a typical rise and gradual fall pattern consistent with acute myocardial infarction.","when_to_set_to_false":"Set to false if the patient's biochemical marker of myocardial necrosis measurements do not demonstrate a typical rise and gradual fall pattern.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's biochemical marker of myocardial necrosis measurements show a typical rise and gradual fall.","meaning":"Boolean indicating whether the patient's biochemical marker of myocardial necrosis measurements show a typical rise and gradual fall pattern."} // "a typical rise AND gradual fall of biochemical markers of myocardial necrosis"
(declare-const patient_creatine_kinase_isoenzyme_mb_fraction_value_recorded_now_withunit_nanogram_per_milliliter Real) ;; {"when_to_set_to_value":"Set to the measured creatine kinase MB isoenzyme value in nanogram per milliliter if available for the patient now.","when_to_set_to_null":"Set to null if no current creatine kinase MB isoenzyme measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current creatine kinase MB isoenzyme concentration in nanogram per milliliter."} // "creatine kinase MB isoenzyme"
(declare-const patient_creatine_kinase_isoenzyme_mb_fraction_value_recorded_now_withunit_nanogram_per_milliliter@@shows_more_rapid_rise_and_fall Bool) ;; {"when_to_set_to_true":"Set to true if the patient's creatine kinase MB isoenzyme measurements demonstrate a more rapid rise and fall pattern consistent with acute myocardial infarction.","when_to_set_to_false":"Set to false if the patient's creatine kinase MB isoenzyme measurements do not demonstrate a more rapid rise and fall pattern.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's creatine kinase MB isoenzyme measurements show a more rapid rise and fall.","meaning":"Boolean indicating whether the patient's creatine kinase MB isoenzyme measurements show a more rapid rise and fall pattern."} // "a more rapid rise AND fall of creatine kinase MB isoenzyme"
(declare-const patient_has_finding_of_ischemic_symptoms_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has ischemic symptoms.","when_to_set_to_false":"Set to false if the patient currently does not have ischemic symptoms.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has ischemic symptoms.","meaning":"Boolean indicating whether the patient currently has ischemic symptoms."} // "ischemic symptoms"
(declare-const patient_has_finding_of_pathological_q_wave_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pathological Q waves detected.","when_to_set_to_false":"Set to false if the patient currently does not have pathological Q waves detected.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pathological Q waves.","meaning":"Boolean indicating whether the patient currently has pathological Q waves."} // "development of pathologic Q waves on the electrocardiogram"
(declare-const patient_has_finding_of_pathological_q_wave_now@@detected_on_electrocardiogram Bool) ;; {"when_to_set_to_true":"Set to true if pathological Q waves are detected on the patient's electrocardiogram.","when_to_set_to_false":"Set to false if pathological Q waves are not detected on the patient's electrocardiogram.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether pathological Q waves are detected on the electrocardiogram.","meaning":"Boolean indicating whether pathological Q waves are detected on the electrocardiogram."} // "development of pathologic Q waves on the electrocardiogram"
(declare-const patient_has_finding_of_ekg_myocardial_ischemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has electrocardiogram changes indicative of myocardial ischemia.","when_to_set_to_false":"Set to false if the patient currently does not have electrocardiogram changes indicative of myocardial ischemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has electrocardiogram changes indicative of myocardial ischemia.","meaning":"Boolean indicating whether the patient currently has electrocardiogram changes indicative of myocardial ischemia."} // "electrocardiogram changes indicative of ischemia"
(declare-const patient_has_finding_of_st_segment_elevation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has ST segment elevation.","when_to_set_to_false":"Set to false if the patient currently does not have ST segment elevation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has ST segment elevation.","meaning":"Boolean indicating whether the patient currently has ST segment elevation."} // "ST segment elevation"
(declare-const patient_has_finding_of_st_segment_depression_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has ST segment depression.","when_to_set_to_false":"Set to false if the patient currently does not have ST segment depression.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has ST segment depression.","meaning":"Boolean indicating whether the patient currently has ST segment depression."} // "ST segment depression"
(declare-const patient_has_diagnosis_of_acute_myocardial_infarction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of acute myocardial infarction.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of acute myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of acute myocardial infarction.","meaning":"Boolean indicating whether the patient currently has a diagnosis of acute myocardial infarction."} // "acute myocardial infarction"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_troponin_value_recorded_now_withunit_nanogram_per_milliliter@@shows_typical_rise_and_gradual_fall
         true)
     :named REQ4_AUXILIARY0)) ;; "a typical rise AND gradual fall of troponin"

(assert
  (! (=> patient_biochemical_marker_of_myocardial_necrosis_value_recorded_now_withunit_nanogram_per_milliliter@@shows_typical_rise_and_gradual_fall
         true)
     :named REQ4_AUXILIARY1)) ;; "a typical rise AND gradual fall of biochemical markers of myocardial necrosis"

(assert
  (! (=> patient_creatine_kinase_isoenzyme_mb_fraction_value_recorded_now_withunit_nanogram_per_milliliter@@shows_more_rapid_rise_and_fall
         true)
     :named REQ4_AUXILIARY2)) ;; "a more rapid rise AND fall of creatine kinase MB isoenzyme"

(assert
  (! (=> patient_has_finding_of_pathological_q_wave_now@@detected_on_electrocardiogram
         patient_has_finding_of_pathological_q_wave_now)
     :named REQ4_AUXILIARY3)) ;; "development of pathologic Q waves on the electrocardiogram"

;; EKG changes indicative of ischemia: ST segment elevation or depression imply umbrella
(assert
  (! (=> (or patient_has_finding_of_st_segment_elevation_now
            patient_has_finding_of_st_segment_depression_now)
         patient_has_finding_of_ekg_myocardial_ischemia_now)
     :named REQ4_AUXILIARY4)) ;; "electrocardiogram changes indicative of ischemia (ST segment elevation OR ST segment depression)"

;; Definition of acute myocardial infarction per requirement
(assert
  (! (= patient_has_diagnosis_of_acute_myocardial_infarction_now
        (and
          (or patient_troponin_value_recorded_now_withunit_nanogram_per_milliliter@@shows_typical_rise_and_gradual_fall
              patient_biochemical_marker_of_myocardial_necrosis_value_recorded_now_withunit_nanogram_per_milliliter@@shows_typical_rise_and_gradual_fall
              patient_creatine_kinase_isoenzyme_mb_fraction_value_recorded_now_withunit_nanogram_per_milliliter@@shows_more_rapid_rise_and_fall)
          (or patient_has_finding_of_ischemic_symptoms_now
              patient_has_finding_of_pathological_q_wave_now@@detected_on_electrocardiogram
              patient_has_finding_of_ekg_myocardial_ischemia_now)))
     :named REQ4_AUXILIARY5)) ;; "acute myocardial infarction (defined as ...)"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! patient_has_diagnosis_of_acute_myocardial_infarction_now
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have acute myocardial infarction (defined as ...)"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_finding_of_acute_anterior_st_segment_elevation_myocardial_infarction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an acute anterior ST segment elevation myocardial infarction.","when_to_set_to_false":"Set to false if the patient currently does not have an acute anterior ST segment elevation myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an acute anterior ST segment elevation myocardial infarction.","meaning":"Boolean indicating whether the patient currently has an acute anterior ST segment elevation myocardial infarction."} // "first anterior ST segment elevation myocardial infarction"
(declare-const patient_has_finding_of_acute_anterior_st_segment_elevation_myocardial_infarction_now@@first_occurrence Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an acute anterior ST segment elevation myocardial infarction and this is the first occurrence.","when_to_set_to_false":"Set to false if the patient currently has an acute anterior ST segment elevation myocardial infarction but it is not the first occurrence.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether this is the first occurrence.","meaning":"Boolean indicating whether the patient currently has an acute anterior ST segment elevation myocardial infarction and it is the first occurrence."} // "first anterior ST segment elevation myocardial infarction"
(declare-const patient_has_finding_of_acute_st_segment_elevation_myocardial_infarction_of_inferolateral_wall_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an acute inferolateral ST segment elevation myocardial infarction.","when_to_set_to_false":"Set to false if the patient currently does not have an acute inferolateral ST segment elevation myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an acute inferolateral ST segment elevation myocardial infarction.","meaning":"Boolean indicating whether the patient currently has an acute inferolateral ST segment elevation myocardial infarction."} // "first inferolateral ST segment elevation myocardial infarction"
(declare-const patient_has_finding_of_acute_st_segment_elevation_myocardial_infarction_of_inferolateral_wall_now@@first_occurrence Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an acute inferolateral ST segment elevation myocardial infarction and this is the first occurrence.","when_to_set_to_false":"Set to false if the patient currently has an acute inferolateral ST segment elevation myocardial infarction but it is not the first occurrence.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether this is the first occurrence.","meaning":"Boolean indicating whether the patient currently has an acute inferolateral ST segment elevation myocardial infarction and it is the first occurrence."} // "first inferolateral ST segment elevation myocardial infarction"
(declare-const patient_has_finding_of_acute_q_wave_infarction_anterior_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an acute anterior Q wave myocardial infarction.","when_to_set_to_false":"Set to false if the patient currently does not have an acute anterior Q wave myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an acute anterior Q wave myocardial infarction.","meaning":"Boolean indicating whether the patient currently has an acute anterior Q wave myocardial infarction."} // "first anterior Q wave myocardial infarction"
(declare-const patient_has_finding_of_acute_q_wave_infarction_anterior_now@@first_occurrence Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an acute anterior Q wave myocardial infarction and this is the first occurrence.","when_to_set_to_false":"Set to false if the patient currently has an acute anterior Q wave myocardial infarction but it is not the first occurrence.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether this is the first occurrence.","meaning":"Boolean indicating whether the patient currently has an acute anterior Q wave myocardial infarction and this is the first occurrence."} // "first anterior Q wave myocardial infarction"
(declare-const patient_has_finding_of_acute_q_wave_infarction_anterior_now@@location_v1_v3_or_v1_v4_or_v1_v5_or_v1_v6 Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an acute anterior Q wave myocardial infarction and the infarction is located in V1-V3, V1-V4, V1-V5, or V1-V6 on ECG.","when_to_set_to_false":"Set to false if the patient currently has an acute anterior Q wave myocardial infarction but the infarction is not located in these specified leads.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the infarction is located in these specified leads.","meaning":"Boolean indicating whether the patient currently has an acute anterior Q wave myocardial infarction and the infarction is located in the specified ECG leads."} // "Q wave myocardial infarction anterior: V1-V3 or V1-V4 or V1-V5 or V1-V6"
(declare-const patient_has_finding_of_acute_q_wave_infarction_inferior_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an acute inferior Q wave myocardial infarction.","when_to_set_to_false":"Set to false if the patient currently does not have an acute inferior Q wave myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an acute inferior Q wave myocardial infarction.","meaning":"Boolean indicating whether the patient currently has an acute inferior Q wave myocardial infarction."} // "Q wave myocardial infarction inferior"
(declare-const patient_has_finding_of_acute_q_wave_infarction_inferior_now@@location_l2_l3_avf_or_l2_l3_avf_plus_v5_v6_or_l2_l3_avf_plus_v6_v9_posterior_leads Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an acute inferior Q wave myocardial infarction and the infarction is located in L2, L3, AVF, or L2, L3, AVF plus V5, V6, or L2, L3, AVF plus V6-V9 (posterior leads) on ECG.","when_to_set_to_false":"Set to false if the patient currently has an acute inferior Q wave myocardial infarction but the infarction is not located in these specified leads.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the infarction is located in these specified leads.","meaning":"Boolean indicating whether the patient currently has an acute inferior Q wave myocardial infarction and the infarction is located in the specified ECG leads."} // "Q wave myocardial infarction inferior: L2, L3, AVF, or L2, L3, AVF + V5, V6 or L2, L3, AVF + V6-V9 [posterior leads]"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_finding_of_acute_anterior_st_segment_elevation_myocardial_infarction_now@@first_occurrence
         patient_has_finding_of_acute_anterior_st_segment_elevation_myocardial_infarction_now)
     :named REQ5_AUXILIARY0)) ;; "first anterior ST segment elevation myocardial infarction"

(assert
  (! (=> patient_has_finding_of_acute_st_segment_elevation_myocardial_infarction_of_inferolateral_wall_now@@first_occurrence
         patient_has_finding_of_acute_st_segment_elevation_myocardial_infarction_of_inferolateral_wall_now)
     :named REQ5_AUXILIARY1)) ;; "first inferolateral ST segment elevation myocardial infarction"

(assert
  (! (=> patient_has_finding_of_acute_q_wave_infarction_anterior_now@@first_occurrence
         patient_has_finding_of_acute_q_wave_infarction_anterior_now)
     :named REQ5_AUXILIARY2)) ;; "first anterior Q wave myocardial infarction"

(assert
  (! (=> patient_has_finding_of_acute_q_wave_infarction_anterior_now@@location_v1_v3_or_v1_v4_or_v1_v5_or_v1_v6
         patient_has_finding_of_acute_q_wave_infarction_anterior_now)
     :named REQ5_AUXILIARY3)) ;; "Q wave myocardial infarction anterior: V1-V3 or V1-V4 or V1-V5 or V1-V6"

(assert
  (! (=> patient_has_finding_of_acute_q_wave_infarction_inferior_now@@location_l2_l3_avf_or_l2_l3_avf_plus_v5_v6_or_l2_l3_avf_plus_v6_v9_posterior_leads
         patient_has_finding_of_acute_q_wave_infarction_inferior_now)
     :named REQ5_AUXILIARY4)) ;; "Q wave myocardial infarction inferior: L2, L3, AVF, or L2, L3, AVF + V5, V6 or L2, L3, AVF + V6-V9 [posterior leads]"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! (or
        patient_has_finding_of_acute_anterior_st_segment_elevation_myocardial_infarction_now@@first_occurrence
        patient_has_finding_of_acute_st_segment_elevation_myocardial_infarction_of_inferolateral_wall_now@@first_occurrence
        (and patient_has_finding_of_acute_q_wave_infarction_anterior_now@@first_occurrence
             patient_has_finding_of_acute_q_wave_infarction_anterior_now@@location_v1_v3_or_v1_v4_or_v1_v5_or_v1_v6)
        (and patient_has_finding_of_acute_q_wave_infarction_inferior_now
             patient_has_finding_of_acute_q_wave_infarction_inferior_now@@location_l2_l3_avf_or_l2_l3_avf_plus_v5_v6_or_l2_l3_avf_plus_v6_v9_posterior_leads)
     )
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have first anterior ST segment elevation myocardial infarction or first inferolateral ST segment elevation myocardial infarction or first anterior Q wave myocardial infarction (Q wave myocardial infarction anterior: V1-V3 or V1-V4 or V1-V5 or V1-V6. Q wave myocardial infarction inferior: L2, L3, AVF, or L2, L3, AVF + V5, V6 or L2, L3, AVF + V6-V9 [posterior leads])."

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const akinetic_segment_count_value_recorded_now_withunit_segment_count Real) ;; {"when_to_set_to_value":"Set to the numeric value representing the total number of akinetic segments recorded now, with unit segment count.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the total number of akinetic segments recorded at the current time, with unit segment count."} // "regional wall motion score index of (at least 4 out of 16 akinetic segments)"
(declare-const regional_wall_motion_score_index_value_recorded_now_withunit_segment_count Real) ;; {"when_to_set_to_value":"Set to the numeric value representing the number of akinetic segments in the regional wall motion score index recorded now, with unit segment count.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the number of akinetic segments in the regional wall motion score index recorded at the current time, with unit segment count."} // "regional wall motion score index of (at least 4 out of 16 akinetic segments)"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! (and (>= regional_wall_motion_score_index_value_recorded_now_withunit_segment_count 4)
          (<= regional_wall_motion_score_index_value_recorded_now_withunit_segment_count 16)
          (= akinetic_segment_count_value_recorded_now_withunit_segment_count 16))
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a regional wall motion score index of (at least 4 out of 16 akinetic segments)."

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_left_ventricular_ejection_fraction_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's left ventricular ejection fraction (in percent) is available now.","when_to_set_to_null":"Set to null if no such measurement is available now or the value is indeterminate.","meaning":"Numeric percent value representing the patient's current left ventricular ejection fraction."} // "left ventricular ejection fraction > 20 percent AND left ventricular ejection fraction < 45 percent as measured and calculated by two-dimensional measurement"
(declare-const patient_left_ventricular_ejection_fraction_value_recorded_now_withunit_percent@@measured_and_calculated_by_two_dimensional_measurement Bool) ;; {"when_to_set_to_true":"Set to true if the patient's left ventricular ejection fraction value was measured and calculated by two-dimensional measurement.","when_to_set_to_false":"Set to false if the patient's left ventricular ejection fraction value was not measured and calculated by two-dimensional measurement.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the measurement was obtained by two-dimensional method.","meaning":"Boolean indicating whether the left ventricular ejection fraction value was measured and calculated by two-dimensional measurement."} // "left ventricular ejection fraction > 20 percent AND left ventricular ejection fraction < 45 percent as measured and calculated by two-dimensional measurement"

(declare-const patient_creatine_kinase_value_recorded_now_withunit_international_units Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's peak creatine kinase (in international units) is available now.","when_to_set_to_null":"Set to null if no such measurement is available now or the value is indeterminate.","meaning":"Numeric value in international units representing the patient's current peak creatine kinase."} // "peak creatine kinase > 2000 international units"
(declare-const patient_creatine_kinase_value_recorded_now_withunit_international_units@@peak_value Bool) ;; {"when_to_set_to_true":"Set to true if the creatine kinase value represents the peak measurement for the patient.","when_to_set_to_false":"Set to false if the creatine kinase value does not represent the peak measurement.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the value is the peak measurement.","meaning":"Boolean indicating whether the creatine kinase value is the peak measurement."} // "peak creatine kinase > 2000 international units"

(declare-const patient_infarct_size_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's infarct size (in percent) is available now.","when_to_set_to_null":"Set to null if no such measurement is available now or the value is indeterminate.","meaning":"Numeric percent value representing the patient's current infarct size."} // "infarct size > 25 percent as measured by magnetic resonance imaging"
(declare-const patient_infarct_size_value_recorded_now_withunit_percent@@measured_by_magnetic_resonance_imaging Bool) ;; {"when_to_set_to_true":"Set to true if the patient's infarct size value was measured by magnetic resonance imaging.","when_to_set_to_false":"Set to false if the patient's infarct size value was not measured by magnetic resonance imaging.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the measurement was obtained by magnetic resonance imaging.","meaning":"Boolean indicating whether the infarct size value was measured by magnetic resonance imaging."} // "infarct size > 25 percent as measured by magnetic resonance imaging"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variable implies corresponding stem variable for LVEF
(assert
  (! (=> patient_left_ventricular_ejection_fraction_value_recorded_now_withunit_percent@@measured_and_calculated_by_two_dimensional_measurement
         (exists ((x Real)) (= x patient_left_ventricular_ejection_fraction_value_recorded_now_withunit_percent)))
     :named REQ7_AUXILIARY0)) ;; "left ventricular ejection fraction > 20 percent AND left ventricular ejection fraction < 45 percent as measured and calculated by two-dimensional measurement"

;; Qualifier variable implies corresponding stem variable for peak CK
(assert
  (! (=> patient_creatine_kinase_value_recorded_now_withunit_international_units@@peak_value
         (exists ((x Real)) (= x patient_creatine_kinase_value_recorded_now_withunit_international_units)))
     :named REQ7_AUXILIARY1)) ;; "peak creatine kinase > 2000 international units"

;; Qualifier variable implies corresponding stem variable for infarct size
(assert
  (! (=> patient_infarct_size_value_recorded_now_withunit_percent@@measured_by_magnetic_resonance_imaging
         (exists ((x Real)) (= x patient_infarct_size_value_recorded_now_withunit_percent)))
     :named REQ7_AUXILIARY2)) ;; "infarct size > 25 percent as measured by magnetic resonance imaging"

;; ===================== Constraint Assertions (REQ 7) =====================
;; At least one of the following:
;; (LVEF > 20% AND LVEF < 45% AND measured/calculated by 2D) OR (peak CK > 2000 IU) OR (infarct size > 25% by MRI)
(assert
  (! (or
        (and
          patient_left_ventricular_ejection_fraction_value_recorded_now_withunit_percent@@measured_and_calculated_by_two_dimensional_measurement
          (> patient_left_ventricular_ejection_fraction_value_recorded_now_withunit_percent 20.0)
          (< patient_left_ventricular_ejection_fraction_value_recorded_now_withunit_percent 45.0))
        (and
          patient_creatine_kinase_value_recorded_now_withunit_international_units@@peak_value
          (> patient_creatine_kinase_value_recorded_now_withunit_international_units 2000.0))
        (and
          patient_infarct_size_value_recorded_now_withunit_percent@@measured_by_magnetic_resonance_imaging
          (> patient_infarct_size_value_recorded_now_withunit_percent 25.0))
     )
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have at least one of the following: (left ventricular ejection fraction > 20 percent AND left ventricular ejection fraction < 45 percent as measured and calculated by two-dimensional measurement) OR (peak creatine kinase > 2000 international units) OR (infarct size > 25 percent as measured by magnetic resonance imaging)."

;; ===================== Declarations for the inclusion criterion (REQ 8) =====================
(declare-const patient_has_undergone_percutaneous_coronary_intervention_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a percutaneous coronary intervention (PCI) procedure at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone a percutaneous coronary intervention (PCI) procedure at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a percutaneous coronary intervention (PCI) procedure.","meaning":"Boolean indicating whether the patient has ever undergone a percutaneous coronary intervention (PCI) procedure in the past."} // "percutaneous coronary intervention"
(declare-const patient_has_undergone_percutaneous_coronary_intervention_inthehistory@@successful_revascularization Bool) ;; {"when_to_set_to_true":"Set to true if the patient's percutaneous coronary intervention (PCI) procedure resulted in successful revascularization.","when_to_set_to_false":"Set to false if the patient's PCI did not result in successful revascularization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the PCI resulted in successful revascularization.","meaning":"Boolean indicating whether the patient's PCI procedure resulted in successful revascularization."} // "successful revascularization with percutaneous coronary intervention"
(declare-const patient_has_undergone_percutaneous_coronary_intervention_inthehistory@@with_1_stent_only Bool) ;; {"when_to_set_to_true":"Set to true if the patient's percutaneous coronary intervention (PCI) procedure was performed with 1 stent only.","when_to_set_to_false":"Set to false if the PCI procedure was performed with more than 1 stent or with no stent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many stents were used during the PCI.","meaning":"Boolean indicating whether the patient's PCI procedure was performed with 1 stent only."} // "percutaneous coronary intervention with 1 stent only"
(declare-const patient_has_undergone_percutaneous_coronary_intervention_inthehistory@@temporalcontext_within7days_after_index_myocardial_infarction Bool) ;; {"when_to_set_to_true":"Set to true if the patient's percutaneous coronary intervention (PCI) procedure occurred within 7 days after the index myocardial infarction.","when_to_set_to_false":"Set to false if the PCI procedure did not occur within 7 days after the index myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the PCI occurred within 7 days after the index myocardial infarction.","meaning":"Boolean indicating whether the patient's PCI procedure occurred within 7 days after the index myocardial infarction."} // "the procedure occurred within 7 days of the index myocardial infarction"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variables imply the base variable
(assert
  (! (=> patient_has_undergone_percutaneous_coronary_intervention_inthehistory@@successful_revascularization
         patient_has_undergone_percutaneous_coronary_intervention_inthehistory)
     :named REQ8_AUXILIARY0)) ;; "successful revascularization with percutaneous coronary intervention"

(assert
  (! (=> patient_has_undergone_percutaneous_coronary_intervention_inthehistory@@with_1_stent_only
         patient_has_undergone_percutaneous_coronary_intervention_inthehistory)
     :named REQ8_AUXILIARY1)) ;; "percutaneous coronary intervention with 1 stent only"

(assert
  (! (=> patient_has_undergone_percutaneous_coronary_intervention_inthehistory@@temporalcontext_within7days_after_index_myocardial_infarction
         patient_has_undergone_percutaneous_coronary_intervention_inthehistory)
     :named REQ8_AUXILIARY2)) ;; "the procedure occurred within 7 days of the index myocardial infarction"

;; ===================== Constraint Assertions (REQ 8) =====================
;; Component 0: successful revascularization with PCI with 1 stent only
(assert
  (! (and patient_has_undergone_percutaneous_coronary_intervention_inthehistory@@successful_revascularization
          patient_has_undergone_percutaneous_coronary_intervention_inthehistory@@with_1_stent_only)
     :named REQ8_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "successful revascularization with percutaneous coronary intervention with 1 stent only"

;; Component 1: procedure occurred within 7 days of the index myocardial infarction
(assert
  (! patient_has_undergone_percutaneous_coronary_intervention_inthehistory@@temporalcontext_within7days_after_index_myocardial_infarction
     :named REQ8_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the procedure occurred within 7 days of the index myocardial infarction"

;; ===================== Declarations for the inclusion criterion (REQ 9) =====================
(declare-const patient_has_finding_of_myocardial_infarction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding or diagnosis of myocardial infarction.","when_to_set_to_false":"Set to false if the patient currently does not have a finding or diagnosis of myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding or diagnosis of myocardial infarction.","meaning":"Boolean indicating whether the patient currently has a finding or diagnosis of myocardial infarction."} // "myocardial infarction"
(declare-const patient_has_patent_infarct_related_artery_at_time_of_application_of_study_device Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a patent infarct related artery present at the time of application of the study device.","when_to_set_to_false":"Set to false if the patient does not have a patent infarct related artery present at the time of application of the study device.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a patent infarct related artery present at the time of application of the study device.","meaning":"Boolean indicating whether the patient has a patent infarct related artery present at the time of application of the study device."} // "the patient must have a patent infarct related artery at the time of application of study device"
(declare-const thrombolysis_in_myocardial_infarction_flow_grade_value_recorded_at_time_of_application_of_study_device_withunit_none Real) ;; {"when_to_set_to_value":"Set to the numeric value of the TIMI flow grade recorded at the time of application of the study device (possible values: 0, 1, 2, 3).","when_to_set_to_null":"Set to null if the TIMI flow grade at the time of application of the study device is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the TIMI flow grade recorded at the time of application of the study device."} // "thrombolysis in myocardial infarction flow grade = 3 at the time of application of study device"

;; ===================== Constraint Assertions (REQ 9) =====================
;; Component 0: patient must have a patent infarct related artery at the time of application of study device
(assert
  (! patient_has_patent_infarct_related_artery_at_time_of_application_of_study_device
     :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must have a patent infarct related artery at the time of application of study device"

;; Component 1: patient must have thrombolysis in myocardial infarction flow grade = 3 at the time of application of study device
(assert
  (! (= thrombolysis_in_myocardial_infarction_flow_grade_value_recorded_at_time_of_application_of_study_device_withunit_none 3)
     :named REQ9_COMPONENT1_OTHER_REQUIREMENTS)) ;; "thrombolysis in myocardial infarction flow grade = 3 at the time of application of study device"
