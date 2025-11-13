;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged ≥ 18 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be aged ≥ 18 years."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_coronary_arteriosclerosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of coronary artery disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of coronary artery disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of coronary artery disease.","meaning":"Boolean indicating whether the patient currently has coronary artery disease."} ;; "coronary artery disease"
(declare-const patient_has_finding_of_coronary_arteriosclerosis_now@@symptomatic Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has coronary artery disease and the disease is symptomatic.","when_to_set_to_false":"Set to false if the patient currently has coronary artery disease but it is not symptomatic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's coronary artery disease is symptomatic.","meaning":"Boolean indicating whether the patient's current coronary artery disease is symptomatic."} ;; "symptomatic coronary artery disease"
(declare-const patient_has_finding_of_angina_pectoris_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of angina pectoris.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of angina pectoris.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of angina pectoris.","meaning":"Boolean indicating whether the patient currently has angina pectoris."} ;; "angina pectoris"
(declare-const patient_has_finding_of_angina_pectoris_now@@chronic Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has angina pectoris and it is chronic.","when_to_set_to_false":"Set to false if the patient currently has angina pectoris but it is not chronic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's angina pectoris is chronic.","meaning":"Boolean indicating whether the patient's current angina pectoris is chronic."} ;; "chronic angina pectoris"
(declare-const patient_has_finding_of_angina_pectoris_now@@stable Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has angina pectoris and it is stable.","when_to_set_to_false":"Set to false if the patient currently has angina pectoris but it is not stable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's angina pectoris is stable.","meaning":"Boolean indicating whether the patient's current angina pectoris is stable."} ;; "stable angina pectoris"
(declare-const patient_has_finding_of_silent_myocardial_ischemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of silent myocardial ischemia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of silent myocardial ischemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of silent myocardial ischemia.","meaning":"Boolean indicating whether the patient currently has silent myocardial ischemia."} ;; "silent myocardial ischemia"
(declare-const patient_has_finding_of_acute_coronary_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of acute coronary syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of acute coronary syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of acute coronary syndrome.","meaning":"Boolean indicating whether the patient currently has acute coronary syndrome."} ;; "acute coronary syndrome"
(declare-const patient_has_finding_of_acute_coronary_syndrome_now@@non_st_elevation Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has acute coronary syndrome and it is non-ST-elevation.","when_to_set_to_false":"Set to false if the patient currently has acute coronary syndrome but it is not non-ST-elevation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's acute coronary syndrome is non-ST-elevation.","meaning":"Boolean indicating whether the patient's current acute coronary syndrome is non-ST-elevation type."} ;; "non-ST-elevation acute coronary syndrome"
(declare-const patient_has_finding_of_acute_coronary_syndrome_now@@st_elevation Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has acute coronary syndrome and it is ST-elevation.","when_to_set_to_false":"Set to false if the patient currently has acute coronary syndrome but it is not ST-elevation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's acute coronary syndrome is ST-elevation.","meaning":"Boolean indicating whether the patient's current acute coronary syndrome is ST-elevation type."} ;; "ST-elevation acute coronary syndrome"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply their stem variables
(assert
  (! (=> patient_has_finding_of_coronary_arteriosclerosis_now@@symptomatic
         patient_has_finding_of_coronary_arteriosclerosis_now)
     :named REQ1_AUXILIARY0)) ;; "symptomatic coronary artery disease" implies "coronary artery disease"

(assert
  (! (=> patient_has_finding_of_angina_pectoris_now@@chronic
         patient_has_finding_of_angina_pectoris_now)
     :named REQ1_AUXILIARY1)) ;; "chronic angina pectoris" implies "angina pectoris"

(assert
  (! (=> patient_has_finding_of_angina_pectoris_now@@stable
         patient_has_finding_of_angina_pectoris_now)
     :named REQ1_AUXILIARY2)) ;; "stable angina pectoris" implies "angina pectoris"

(assert
  (! (=> patient_has_finding_of_acute_coronary_syndrome_now@@non_st_elevation
         patient_has_finding_of_acute_coronary_syndrome_now)
     :named REQ1_AUXILIARY3)) ;; "non-ST-elevation acute coronary syndrome" implies "acute coronary syndrome"

(assert
  (! (=> patient_has_finding_of_acute_coronary_syndrome_now@@st_elevation
         patient_has_finding_of_acute_coronary_syndrome_now)
     :named REQ1_AUXILIARY4)) ;; "ST-elevation acute coronary syndrome" implies "acute coronary syndrome"

;; Non-exhaustive examples: chronic stable angina pectoris, silent myocardial ischemia, acute coronary syndrome (with non-exhaustive examples: non-ST-elevation, ST-elevation)
(assert
  (! (=> (and patient_has_finding_of_angina_pectoris_now@@chronic
              patient_has_finding_of_angina_pectoris_now@@stable)
         patient_has_finding_of_coronary_arteriosclerosis_now@@symptomatic)
     :named REQ1_AUXILIARY5)) ;; "chronic stable angina pectoris" is a non-exhaustive example of symptomatic coronary artery disease

(assert
  (! (=> patient_has_finding_of_silent_myocardial_ischemia_now
         patient_has_finding_of_coronary_arteriosclerosis_now@@symptomatic)
     :named REQ1_AUXILIARY6)) ;; "silent myocardial ischemia" is a non-exhaustive example of symptomatic coronary artery disease

(assert
  (! (=> patient_has_finding_of_acute_coronary_syndrome_now
         patient_has_finding_of_coronary_arteriosclerosis_now@@symptomatic)
     :named REQ1_AUXILIARY7)) ;; "acute coronary syndrome" is a non-exhaustive example of symptomatic coronary artery disease

(assert
  (! (=> patient_has_finding_of_acute_coronary_syndrome_now@@non_st_elevation
         patient_has_finding_of_acute_coronary_syndrome_now)
     :named REQ1_AUXILIARY8)) ;; "non-ST-elevation acute coronary syndrome" is a non-exhaustive example of acute coronary syndrome

(assert
  (! (=> patient_has_finding_of_acute_coronary_syndrome_now@@st_elevation
         patient_has_finding_of_acute_coronary_syndrome_now)
     :named REQ1_AUXILIARY9)) ;; "ST-elevation acute coronary syndrome" is a non-exhaustive example of acute coronary syndrome

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_finding_of_coronary_arteriosclerosis_now@@symptomatic
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have symptomatic coronary artery disease"

;; ===================== Declarations for the inclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_coronary_artery_stenosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a coronary artery stenosis.","when_to_set_to_false":"Set to false if the patient currently does not have a coronary artery stenosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a coronary artery stenosis.","meaning":"Boolean indicating whether the patient currently has a coronary artery stenosis."} ;; "coronary artery stenosis"
(declare-const patient_has_finding_of_coronary_artery_stenosis_now@@located_in_native_coronary_artery Bool) ;; {"when_to_set_to_true":"Set to true if the patient's coronary artery stenosis is located in a native coronary artery.","when_to_set_to_false":"Set to false if the patient's coronary artery stenosis is not located in a native coronary artery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the stenosis is located in a native coronary artery.","meaning":"Boolean indicating whether the patient's coronary artery stenosis is located in a native coronary artery."} ;; "coronary artery stenosis in a native coronary artery"
(declare-const patient_has_finding_of_coronary_artery_stenosis_now@@located_in_saphenous_vein_bypass_graft Bool) ;; {"when_to_set_to_true":"Set to true if the patient's coronary artery stenosis is located in a saphenous vein bypass graft.","when_to_set_to_false":"Set to false if the patient's coronary artery stenosis is not located in a saphenous vein bypass graft.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the stenosis is located in a saphenous vein bypass graft.","meaning":"Boolean indicating whether the patient's coronary artery stenosis is located in a saphenous vein bypass graft."} ;; "coronary artery stenosis in a saphenous vein bypass graft"
(declare-const coronary_artery_stent_diameter_value_recorded_now_withunit_mm Real) ;; {"when_to_set_to_value":"Set to the value in millimeters (mm) of the diameter of a coronary artery stent that can be used to treat a coronary artery stenosis, as recorded now.","when_to_set_to_null":"Set to null if the diameter of a coronary artery stent that can be used to treat a coronary artery stenosis is unknown, not documented, or cannot be determined as recorded now.","meaning":"Numeric value in millimeters (mm) of the diameter of a coronary artery stent that can be used to treat a coronary artery stenosis, as recorded now."} ;; "coronary artery stent with diameter ≥ 2.25 mm AND ≤ 4.0 mm"
(declare-const coronary_artery_stent_count_needed_to_cover_each_stenosis_value_recorded_now Real) ;; {"when_to_set_to_value":"Set to the number of coronary artery stents needed to cover each coronary artery stenosis, as recorded now.","when_to_set_to_null":"Set to null if the number of coronary artery stents needed to cover each coronary artery stenosis is unknown, not documented, or cannot be determined as recorded now.","meaning":"Numeric value indicating the number of coronary artery stents needed to cover each coronary artery stenosis, as recorded now."} ;; "each stenosis can be covered with ≥ 1 coronary artery stent"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply the stem variable
(assert
  (! (=> patient_has_finding_of_coronary_artery_stenosis_now@@located_in_native_coronary_artery
         patient_has_finding_of_coronary_artery_stenosis_now)
     :named REQ2_AUXILIARY0)) ;; "coronary artery stenosis in a native coronary artery" implies "coronary artery stenosis"

(assert
  (! (=> patient_has_finding_of_coronary_artery_stenosis_now@@located_in_saphenous_vein_bypass_graft
         patient_has_finding_of_coronary_artery_stenosis_now)
     :named REQ2_AUXILIARY1)) ;; "coronary artery stenosis in a saphenous vein bypass graft" implies "coronary artery stenosis"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: (≥ 1 coronary artery stenosis > 50 % in a native coronary artery OR ≥ 1 coronary artery stenosis > 50 % in a saphenous vein bypass graft)
(assert
  (! (or patient_has_finding_of_coronary_artery_stenosis_now@@located_in_native_coronary_artery
         patient_has_finding_of_coronary_artery_stenosis_now@@located_in_saphenous_vein_bypass_graft)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "≥ 1 coronary artery stenosis > 50 % in a native coronary artery OR ≥ 1 coronary artery stenosis > 50 % in a saphenous vein bypass graft"

;; Component 1: each stenosis can be treated with a coronary artery stent with diameter ≥ 2.25 mm AND ≤ 4.0 mm
(assert
  (! (and (>= coronary_artery_stent_diameter_value_recorded_now_withunit_mm 2.25)
          (<= coronary_artery_stent_diameter_value_recorded_now_withunit_mm 4.0))
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "each stenosis can be treated with a coronary artery stent with diameter ≥ 2.25 mm AND ≤ 4.0 mm"

;; Component 2: each stenosis can be covered with ≥ 1 coronary artery stent
(assert
  (! (>= coronary_artery_stent_count_needed_to_cover_each_stenosis_value_recorded_now 1)
     :named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "each stenosis can be covered with ≥ 1 coronary artery stent"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const number_of_treated_coronary_artery_lesions_value_recorded_now_withunit_count Real) ;; {"when_to_set_to_value":"Set to the total number of treated coronary artery lesions for the patient at the current time.","when_to_set_to_null":"Set to null if the number of treated coronary artery lesions is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the total number of treated coronary artery lesions in the patient, recorded now, with unit 'count'."} ;; "number of treated coronary artery lesions"
(declare-const number_of_treated_coronary_arteries_value_recorded_now_withunit_count Real) ;; {"when_to_set_to_value":"Set to the total number of treated coronary arteries for the patient at the current time.","when_to_set_to_null":"Set to null if the number of treated coronary arteries is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the total number of treated coronary arteries in the patient, recorded now, with unit 'count'."} ;; "number of treated coronary arteries"
(declare-const length_of_treated_coronary_artery_lesions_value_recorded_now_withunit_millimeter Real) ;; {"when_to_set_to_value":"Set to the length (in millimeters) of the treated coronary artery lesions for the patient at the current time.","when_to_set_to_null":"Set to null if the length of treated coronary artery lesions is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the length of treated coronary artery lesions in the patient, recorded now, with unit 'millimeter'."} ;; "length of treated coronary artery lesions"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: No limitation on the number of treated coronary artery lesions
(assert
  (! true
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "no limitation on the number of treated coronary artery lesions"

;; Component 1: No limitation on the number of treated coronary arteries
(assert
  (! true
     :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "no limitation on the number of treated coronary arteries"

;; Component 2: No limitation on the length of treated coronary artery lesions
(assert
  (! true
     :named REQ3_COMPONENT2_OTHER_REQUIREMENTS)) ;; "no limitation on the length of treated coronary artery lesions"
