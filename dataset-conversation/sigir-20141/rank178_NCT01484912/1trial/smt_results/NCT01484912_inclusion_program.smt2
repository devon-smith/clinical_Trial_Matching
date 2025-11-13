;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as male.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not male (e.g., female or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is male."} // "be male"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female (e.g., male or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is female."} // "be female"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "be aged greater than 20 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (or patient_sex_is_male_now
         (and patient_sex_is_female_now
              (> patient_age_value_recorded_now_in_years 20.0)))
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must ((be male) OR (be female AND be aged greater than 20 years))."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_exercise_induced_angina_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of effort-induced angina.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of effort-induced angina.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of effort-induced angina.","meaning":"Boolean indicating whether the patient currently has effort-induced angina."} // "have effort-induced angina"
(declare-const patient_has_finding_of_exercise_induced_angina_now@@relieved_by_rest Bool) ;; {"when_to_set_to_true":"Set to true if the patient's effort-induced angina is relieved by rest.","when_to_set_to_false":"Set to false if the patient's effort-induced angina is not relieved by rest.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's effort-induced angina is relieved by rest.","meaning":"Boolean indicating whether the patient's effort-induced angina is relieved by rest."} // "relieved by rest"
(declare-const patient_has_finding_of_exercise_induced_angina_now@@relieved_by_nitroglycerin Bool) ;; {"when_to_set_to_true":"Set to true if the patient's effort-induced angina is relieved by nitroglycerin.","when_to_set_to_false":"Set to false if the patient's effort-induced angina is not relieved by nitroglycerin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's effort-induced angina is relieved by nitroglycerin.","meaning":"Boolean indicating whether the patient's effort-induced angina is relieved by nitroglycerin."} // "relieved by nitroglycerin"
(declare-const patient_has_finding_of_coronary_arteriosclerosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of coronary artery disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of coronary artery disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of coronary artery disease.","meaning":"Boolean indicating whether the patient currently has coronary artery disease."} // "coronary artery disease"
(declare-const patient_has_finding_of_coronary_arteriosclerosis_now@@documented_by_catheterization Bool) ;; {"when_to_set_to_true":"Set to true if the patient's coronary artery disease is documented by catheterization.","when_to_set_to_false":"Set to false if the patient's coronary artery disease is not documented by catheterization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's coronary artery disease is documented by catheterization.","meaning":"Boolean indicating whether the patient's coronary artery disease is documented by catheterization."} // "documented by catheterization"
(declare-const patient_has_finding_of_myocardial_infarction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of myocardial infarction.","when_to_set_to_false":"Set to false if the patient does not have a history of myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of myocardial infarction.","meaning":"Boolean indicating whether the patient has a history of myocardial infarction."} // "previous myocardial infarction"
(declare-const patient_has_finding_of_myocardial_infarction_inthehistory@@temporalcontext_at_least_3_months_before_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient's myocardial infarction occurred at least 3 months before screening.","when_to_set_to_false":"Set to false if the patient's myocardial infarction did not occur at least 3 months before screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's myocardial infarction occurred at least 3 months before screening.","meaning":"Boolean indicating whether the patient's myocardial infarction occurred at least 3 months before screening."} // "at least 3 months before screening"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_finding_of_exercise_induced_angina_now@@relieved_by_rest
         patient_has_finding_of_exercise_induced_angina_now)
     :named REQ1_AUXILIARY0)) ;; "effort-induced angina relieved by rest" implies "effort-induced angina"

(assert
  (! (=> patient_has_finding_of_exercise_induced_angina_now@@relieved_by_nitroglycerin
         patient_has_finding_of_exercise_induced_angina_now)
     :named REQ1_AUXILIARY1)) ;; "effort-induced angina relieved by nitroglycerin" implies "effort-induced angina"

(assert
  (! (=> patient_has_finding_of_coronary_arteriosclerosis_now@@documented_by_catheterization
         patient_has_finding_of_coronary_arteriosclerosis_now)
     :named REQ1_AUXILIARY2)) ;; "coronary artery disease documented by catheterization" implies "coronary artery disease"

(assert
  (! (=> patient_has_finding_of_myocardial_infarction_inthehistory@@temporalcontext_at_least_3_months_before_screening
         patient_has_finding_of_myocardial_infarction_inthehistory)
     :named REQ1_AUXILIARY3)) ;; "myocardial infarction at least 3 months before screening" implies "history of myocardial infarction"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (or patient_has_finding_of_exercise_induced_angina_now@@relieved_by_rest
         patient_has_finding_of_exercise_induced_angina_now@@relieved_by_nitroglycerin
         patient_has_finding_of_coronary_arteriosclerosis_now@@documented_by_catheterization
         patient_has_finding_of_myocardial_infarction_inthehistory@@temporalcontext_at_least_3_months_before_screening)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must ((have effort-induced angina relieved by rest) OR (have effort-induced angina relieved by nitroglycerin) OR (have coronary artery disease documented by catheterization) OR (have previous myocardial infarction at least 3 months before screening))."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_exercise_tolerance_test_abnormal_inthepast7days Bool) ;; {"when_to_set_to_true":"Set to true if the patient had an abnormal (positive) exercise tolerance test within the past 7 days.","when_to_set_to_false":"Set to false if the patient did not have an abnormal (positive) exercise tolerance test within the past 7 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient had an abnormal (positive) exercise tolerance test within the past 7 days.","meaning":"Boolean indicating whether the patient had an abnormal (positive) exercise tolerance test within the past 7 days."} // "positive exercise tolerance testing"
(declare-const patient_has_finding_of_exercise_tolerance_test_abnormal_inthepast7days@@occurred_at_screening_day_minus_7 Bool) ;; {"when_to_set_to_true":"Set to true if the abnormal (positive) exercise tolerance test within the past 7 days occurred specifically at the screening visit (Day -7).","when_to_set_to_false":"Set to false if the abnormal (positive) exercise tolerance test within the past 7 days did not occur at the screening visit (Day -7).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the abnormal (positive) exercise tolerance test within the past 7 days occurred at the screening visit (Day -7).","meaning":"Boolean indicating whether the abnormal (positive) exercise tolerance test within the past 7 days occurred at the screening visit (Day -7)."} // "at screening (Day -7)"
(declare-const st_segment_depression_value_recorded_at_screening_day_minus_7_in_millimeter Real) ;; {"when_to_set_to_value":"Set to the numeric value (in millimeters) of the patient's ST-segment depression recorded during exercise tolerance testing at screening (Day -7).","when_to_set_to_null":"Set to null if the ST-segment depression value at screening (Day -7) is unknown, not documented, or cannot be determined.","meaning":"Numeric value of ST-segment depression in millimeters recorded during exercise tolerance testing at screening (Day -7)."} // "ST-segment depression ≥ 1 millimeter compared with at rest, with or without limiting angina"
(declare-const patient_has_finding_of_angina_pectoris_inthepast7days Bool) ;; {"when_to_set_to_true":"Set to true if the patient had angina pectoris within the past 7 days.","when_to_set_to_false":"Set to false if the patient did not have angina pectoris within the past 7 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient had angina pectoris within the past 7 days.","meaning":"Boolean indicating whether the patient had angina pectoris within the past 7 days."} // "with or without limiting angina"
(declare-const patient_has_finding_of_angina_pectoris_inthepast7days@@is_limiting Bool) ;; {"when_to_set_to_true":"Set to true if the angina pectoris within the past 7 days was limiting.","when_to_set_to_false":"Set to false if the angina pectoris within the past 7 days was not limiting.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the angina pectoris within the past 7 days was limiting.","meaning":"Boolean indicating whether the angina pectoris within the past 7 days was limiting."} // "with or without limiting angina"
(declare-const patient_has_finding_of_angina_pectoris_inthepast7days@@associated_with_exercise_tolerance_test_at_screening_day_minus_7 Bool) ;; {"when_to_set_to_true":"Set to true if the angina pectoris within the past 7 days was associated with the exercise tolerance test at the screening visit (Day -7).","when_to_set_to_false":"Set to false if the angina pectoris within the past 7 days was not associated with the exercise tolerance test at the screening visit (Day -7).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the angina pectoris within the past 7 days was associated with the exercise tolerance test at the screening visit (Day -7).","meaning":"Boolean indicating whether the angina pectoris within the past 7 days was associated with the exercise tolerance test at the screening visit (Day -7)."} // "with or without limiting angina"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies stem variable for exercise tolerance test at screening
(assert
  (! (=> patient_has_finding_of_exercise_tolerance_test_abnormal_inthepast7days@@occurred_at_screening_day_minus_7
         patient_has_finding_of_exercise_tolerance_test_abnormal_inthepast7days)
     :named REQ2_AUXILIARY0)) ;; "occurred at screening (Day -7)"

;; Qualifier variable implies stem variable for angina pectoris
(assert
  (! (=> patient_has_finding_of_angina_pectoris_inthepast7days@@is_limiting
         patient_has_finding_of_angina_pectoris_inthepast7days)
     :named REQ2_AUXILIARY1)) ;; "limiting angina"

;; Qualifier variable implies stem variable for angina pectoris associated with ETT at screening
(assert
  (! (=> patient_has_finding_of_angina_pectoris_inthepast7days@@associated_with_exercise_tolerance_test_at_screening_day_minus_7
         patient_has_finding_of_angina_pectoris_inthepast7days)
     :named REQ2_AUXILIARY2)) ;; "angina associated with ETT at screening"

;; Definition of positive exercise tolerance test at screening (Day -7): ST-segment depression ≥ 1 mm at screening, with or without limiting angina
(assert
  (! (= patient_has_finding_of_exercise_tolerance_test_abnormal_inthepast7days@@occurred_at_screening_day_minus_7
        (>= st_segment_depression_value_recorded_at_screening_day_minus_7_in_millimeter 1.0))
     :named REQ2_AUXILIARY3)) ;; "positive exercise tolerance testing (defined as ST-segment depression ≥ 1 millimeter compared with at rest, with or without limiting angina) at screening (Day -7)"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Inclusion: patient must have manifested positive exercise tolerance testing at screening (Day -7)
(assert
  (! patient_has_finding_of_exercise_tolerance_test_abnormal_inthepast7days@@occurred_at_screening_day_minus_7
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have manifested positive exercise tolerance testing (defined as ST-segment depression ≥ 1 millimeter compared with at rest, with or without limiting angina) at screening (Day -7)."

;; ===================== Declarations for the inclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_exercise_tolerance_test_abnormal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient manifested a positive (abnormal) exercise tolerance test result on Day 0 (enrollment day).","when_to_set_to_false":"Set to false if the patient did not manifest a positive (abnormal) exercise tolerance test result on Day 0.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient manifested a positive (abnormal) exercise tolerance test result on Day 0.","meaning":"Boolean indicating whether the patient manifested a positive (abnormal) exercise tolerance test result on Day 0 (enrollment day)."} // "have manifested positive exercise tolerance testing ... on the day of enrollment (Day 0)"
(declare-const patient_st_segment_depression_value_recorded_now_withunit_millimeter Real) ;; {"when_to_set_to_value":"Set to the measured ST-segment depression (in millimeters) during the exercise tolerance test performed on Day 0 (enrollment day).","when_to_set_to_null":"Set to null if no such measurement is available or cannot be determined for the test performed on Day 0.","meaning":"Numeric value representing the ST-segment depression (in millimeters) measured during the exercise tolerance test performed on Day 0 (enrollment day)."} // "ST-segment depression ≥ 1 millimeter compared with at rest"
(declare-const patient_has_finding_of_angina_pectoris_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient manifested angina pectoris on Day 0 (enrollment day).","when_to_set_to_false":"Set to false if the patient did not manifest angina pectoris on Day 0.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient manifested angina pectoris on Day 0.","meaning":"Boolean indicating whether the patient manifested angina pectoris on Day 0 (enrollment day)."} // "with or without limiting angina"
(declare-const patient_has_finding_of_angina_pectoris_now@@limiting Bool) ;; {"when_to_set_to_true":"Set to true if the patient manifested limiting angina pectoris on Day 0 (enrollment day).","when_to_set_to_false":"Set to false if the patient manifested angina pectoris on Day 0 but it was not limiting, or did not manifest angina pectoris at all.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the angina pectoris was limiting on Day 0.","meaning":"Boolean indicating whether the patient's angina pectoris on Day 0 was limiting."} // "with or without limiting angina"
(declare-const patient_has_undergone_exercise_tolerance_test_inthepast7days Bool) ;; {"when_to_set_to_true":"Set to true if the patient underwent exercise tolerance testing at least once between Day -7 and Day 0.","when_to_set_to_false":"Set to false if the patient did not undergo exercise tolerance testing between Day -7 and Day 0.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient underwent exercise tolerance testing between Day -7 and Day 0.","meaning":"Boolean indicating whether the patient underwent exercise tolerance testing between Day -7 and Day 0."} // "the exercise tolerance testing performance between Day -7 and Day 0"
(declare-const patient_exercise_tolerance_test_value_recorded_inthepast7days_withunit_minutes Real) ;; {"when_to_set_to_value":"Set to the measured total exercise time (in minutes) for each exercise tolerance test performed between Day -7 and Day 0.","when_to_set_to_null":"Set to null if no such measurement is available or cannot be determined for tests performed between Day -7 and Day 0.","meaning":"Numeric value representing the total exercise time (in minutes) for each exercise tolerance test performed between Day -7 and Day 0."} // "total exercise time"
(declare-const patient_exercise_tolerance_test_value_recorded_now_withunit_minutes Real) ;; {"when_to_set_to_value":"Set to the measured total exercise time (in minutes) for the exercise tolerance test performed on Day 0 (enrollment day).","when_to_set_to_null":"Set to null if no such measurement is available or cannot be determined for the test performed on Day 0.","meaning":"Numeric value representing the total exercise time (in minutes) for the exercise tolerance test performed on Day 0 (enrollment day)."} // "total exercise time on Day 0"
(declare-const patient_exercise_tolerance_test_value_recorded_at_screening_day_minus_7_withunit_minutes Real) ;; {"when_to_set_to_value":"Set to the measured total exercise time (in minutes) for the exercise tolerance test performed at screening (Day -7).","when_to_set_to_null":"Set to null if no such measurement is available or cannot be determined for the test performed at screening (Day -7).","meaning":"Numeric value representing the total exercise time (in minutes) for the exercise tolerance test performed at screening (Day -7)."} // "total exercise time at Day -7"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Definition: Positive exercise tolerance test on Day 0 is defined as ST-segment depression ≥ 1 mm compared with at rest, with or without limiting angina
(assert
  (! (= patient_has_finding_of_exercise_tolerance_test_abnormal_now
        (>= patient_st_segment_depression_value_recorded_now_withunit_millimeter 1.0))
     :named REQ3_AUXILIARY0)) ;; "positive exercise tolerance testing (defined as ST-segment depression ≥ 1 millimeter compared with at rest, with or without limiting angina) on the day of enrollment (Day 0)"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: Must have manifested positive exercise tolerance testing on Day 0
(assert
  (! patient_has_finding_of_exercise_tolerance_test_abnormal_now
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "have manifested positive exercise tolerance testing ... on the day of enrollment (Day 0)"

;; Component 1: The exercise tolerance testing performance between Day -7 and Day 0 must not differ by more than 20 percent in total exercise time
(assert
  (! (and patient_has_undergone_exercise_tolerance_test_inthepast7days
          (<= (abs (- patient_exercise_tolerance_test_value_recorded_now_withunit_minutes
                      patient_exercise_tolerance_test_value_recorded_at_screening_day_minus_7_withunit_minutes))
              (* 0.2 patient_exercise_tolerance_test_value_recorded_at_screening_day_minus_7_withunit_minutes)))
     :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the exercise tolerance testing performance between Day -7 and Day 0 must not differ by more than 20 percent in total exercise time"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently considered to have childbearing potential.","when_to_set_to_false":"Set to false if the patient is currently considered not to have childbearing potential (e.g., post-menopausal, surgically sterile).","when_to_set_to_null":"Set to null if the patient's childbearing potential status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient currently has childbearing potential."} // "be of childbearing potential"
(declare-const patient_is_post_menopausal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently considered post-menopausal.","when_to_set_to_false":"Set to false if the patient is currently considered not post-menopausal.","when_to_set_to_null":"Set to null if the patient's menopausal status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently post-menopausal."} // "be post-menopausal"

;; ===================== Constraint Assertions (REQ 4) =====================
;; If the patient is female, she must be post-menopausal OR of childbearing potential
(assert
  (! (or (not patient_sex_is_female_now)
         (or patient_is_post_menopausal_now
             patient_has_childbearing_potential_now))
     :named REQ4_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "if the patient is female, the patient must (be post-menopausal OR be of childbearing potential)"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_used_adequate_contraception_since_last_menstruation Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used adequate contraception continuously since the last menstruation.","when_to_set_to_false":"Set to false if the patient has not used adequate contraception continuously since the last menstruation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used adequate contraception continuously since the last menstruation.","meaning":"Boolean indicating whether the patient has used adequate contraception continuously since the last menstruation."} // "have used adequate contraception since last menstruation"
(declare-const patient_has_plan_for_conception_during_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a plan for conception at any time during the study period.","when_to_set_to_false":"Set to false if the patient does not have a plan for conception at any time during the study period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a plan for conception at any time during the study period.","meaning":"Boolean indicating whether the patient has a plan for conception at any time during the study period."} // "have no plan for conception during the study"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Component 0: If the patient is a female of childbearing potential, the patient must have used adequate contraception since last menstruation.
(assert
  (! (or (not (and patient_sex_is_female_now patient_has_childbearing_potential_now))
         patient_has_used_adequate_contraception_since_last_menstruation)
     :named REQ5_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "if the patient is a female of childbearing potential, the patient must have used adequate contraception since last menstruation"

;; Component 1: If the patient is a female of childbearing potential, the patient must have no plan for conception during the study.
(assert
  (! (or (not (and patient_sex_is_female_now patient_has_childbearing_potential_now))
         (not patient_has_plan_for_conception_during_study))
     :named REQ5_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "if the patient is a female of childbearing potential, the patient must have no plan for conception during the study"

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_is_lactating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently lactating.","when_to_set_to_false":"Set to false if the patient is currently not lactating.","when_to_set_to_null":"Set to null if the patient's current lactation status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently lactating."} // "the patient must be non-lactating"

;; ===================== Constraint Assertions (REQ 6) =====================
;; If the patient is a female of childbearing potential, the patient must be non-lactating.
(assert
  (! (or (not (and patient_sex_is_female_now patient_has_childbearing_potential_now))
         (not patient_is_lactating_now))
     :named REQ6_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, if the patient is a female of childbearing potential, the patient must be non-lactating."

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_has_undergone_urine_pregnancy_test_inthehistory_outcome_is_negative Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a urine pregnancy test at any time in the past and the result was negative.","when_to_set_to_false":"Set to false if the patient has undergone a urine pregnancy test in the past and the result was not negative, or if all past urine pregnancy tests are known to be non-negative.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a urine pregnancy test in the past with a negative result.","meaning":"Boolean indicating whether the patient has undergone a urine pregnancy test in the past with a negative result."} // "urine pregnancy test"
(declare-const patient_has_undergone_urine_pregnancy_test_inthehistory_outcome_is_negative@@temporalcontext_within14days_before_study Bool) ;; {"when_to_set_to_true":"Set to true if the urine pregnancy test with a negative result occurred within 14 days prior to the study.","when_to_set_to_false":"Set to false if the urine pregnancy test with a negative result did not occur within 14 days prior to the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the urine pregnancy test with a negative result occurred within 14 days prior to the study.","meaning":"Boolean indicating whether the urine pregnancy test with a negative result occurred within 14 days prior to the study."} // "negative urine pregnancy test within 14 days prior to the study"
(declare-const patient_is_pregnant_inthepast14days Bool) ;; {"when_to_set_to_true":"Set to true if the patient was pregnant at any time during the 14 days prior to the study.","when_to_set_to_false":"Set to false if the patient was not pregnant at any time during the 14 days prior to the study.","when_to_set_to_null":"Set to null if pregnancy status during the 14 days prior to the study is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient was pregnant at any time during the 14 days prior to the study."} // "negative urine pregnancy test within 14 days prior to the study"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_undergone_urine_pregnancy_test_inthehistory_outcome_is_negative@@temporalcontext_within14days_before_study
         patient_has_undergone_urine_pregnancy_test_inthehistory_outcome_is_negative)
     :named REQ7_AUXILIARY0)) ;; "negative urine pregnancy test within 14 days prior to the study"

;; ===================== Constraint Assertions (REQ 7) =====================
;; If the patient is a female of childbearing potential, she must have had a negative urine pregnancy test within 14 days prior to the study.
(assert
  (! (or (not (and patient_sex_is_female_now patient_has_childbearing_potential_now))
         patient_has_undergone_urine_pregnancy_test_inthehistory_outcome_is_negative@@temporalcontext_within14days_before_study)
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "if the patient is a female of childbearing potential, the patient must have had a negative urine pregnancy test within 14 days prior to the study."

;; ===================== Declarations for the criterion (REQ 8) =====================
(declare-const patient_is_able_to_provide_written_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to provide written informed consent.","when_to_set_to_false":"Set to false if the patient is currently not able to provide written informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to provide written informed consent.","meaning":"Boolean indicating whether the patient is currently able to provide written informed consent."} // "the patient must be able to provide written informed consent"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
  (! patient_is_able_to_provide_written_informed_consent_now
     :named REQ8_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must be able to provide written informed consent"
