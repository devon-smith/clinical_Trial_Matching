;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female (e.g., male or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is female."} // "be a woman"
(declare-const patient_has_finding_of_non_smoker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a non-smoker.","when_to_set_to_false":"Set to false if the patient is currently a smoker.","when_to_set_to_null":"Set to null if the patient's current smoking status is unknown or cannot be determined.","meaning":"Boolean indicating whether the patient is currently a non-smoker."} // "non-smoker"
(declare-const patient_has_finding_of_smoker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a smoker.","when_to_set_to_false":"Set to false if the patient is currently a non-smoker.","when_to_set_to_null":"Set to null if the patient's current smoking status is unknown or cannot be determined.","meaning":"Boolean indicating whether the patient is currently a smoker."} // "smoker"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "age ≥ 18 years AND age ≤ 45 years; age ≥ 18 years AND age ≤ 34 years"

;; ===================== Constraint Assertions (REQ 0) =====================
;; To be included, the patient must ((be a woman AND be a non-smoker AND (age ≥ 18 years AND age ≤ 45 years)) OR (be a woman AND be a smoker AND (age ≥ 18 years AND age ≤ 34 years))).
(assert
  (! (or
        (and patient_sex_is_female_now
             patient_has_finding_of_non_smoker_now
             (>= patient_age_value_recorded_now_in_years 18.0)
             (<= patient_age_value_recorded_now_in_years 45.0))
        (and patient_sex_is_female_now
             patient_has_finding_of_smoker_now
             (>= patient_age_value_recorded_now_in_years 18.0)
             (<= patient_age_value_recorded_now_in_years 34.0)))
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must ((be a woman AND be a non-smoker AND (age ≥ 18 years AND age ≤ 45 years)) OR (be a woman AND be a smoker AND (age ≥ 18 years AND age ≤ 34 years)))."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_regular_periods_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has regular menstrual cycles.","when_to_set_to_false":"Set to false if the patient currently does not have regular menstrual cycles.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has regular menstrual cycles.","meaning":"Boolean indicating whether the patient currently has regular menstrual cycles."} // "regular menstrual cycles"
(declare-const patient_has_finding_of_regular_periods_now@@cycle_predictability_within_7_days_for_past_6_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient's regular menstrual cycles have cycle predictability within 7 days for the past 6 months.","when_to_set_to_false":"Set to false if the patient's regular menstrual cycles do not have cycle predictability within 7 days for the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's regular menstrual cycles have cycle predictability within 7 days for the past 6 months.","meaning":"Boolean indicating whether the patient's regular menstrual cycles have cycle predictability within 7 days for the past 6 months."} // "cycle predictability within 7 days for the past 6 months"
(declare-const patient_measure_of_duration_of_menstrual_cycle_value_recorded_now_withunit_days Real) ;; {"when_to_set_to_value":"Set to the measured value in days if the patient's current menstrual cycle length is recorded.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current menstrual cycle length in days."} // "cycle length ≥ 26 days AND cycle length ≤ 34 days"
(declare-const patient_measure_of_duration_of_menstrual_cycle_value_recorded_past_6_months_withunit_days Real) ;; {"when_to_set_to_value":"Set to the measured value in days for each menstrual cycle if the patient's cycle length is recorded for the past 6 months.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate for any cycle in the past 6 months.","meaning":"Numeric value representing the patient's menstrual cycle length in days, as recorded for each cycle in the past 6 months."} // "cycle length for the past 6 months"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_finding_of_regular_periods_now@@cycle_predictability_within_7_days_for_past_6_months
         patient_has_finding_of_regular_periods_now)
     :named REQ1_AUXILIARY0)) ;; "cycle predictability within 7 days for the past 6 months" implies "regular menstrual cycles"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: cycle length must be ≥ 26 days AND ≤ 34 days
(assert
  (! (and (>= patient_measure_of_duration_of_menstrual_cycle_value_recorded_now_withunit_days 26.0)
          (<= patient_measure_of_duration_of_menstrual_cycle_value_recorded_now_withunit_days 34.0))
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "cycle length ≥ 26 days AND cycle length ≤ 34 days"

;; Component 1: cycle predictability within 7 days for the past 6 months
(assert
  (! patient_has_finding_of_regular_periods_now@@cycle_predictability_within_7_days_for_past_6_months
     :named REQ1_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "cycle predictability within 7 days for the past 6 months"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_is_taking_antidepressant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking antidepressant medication.","when_to_set_to_false":"Set to false if the patient is currently not taking antidepressant medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking antidepressant medication.","meaning":"Boolean indicating whether the patient is currently taking antidepressant medication."} // "antidepressant medication"
(declare-const patient_is_taking_antidepressant_now@@initiated_for_treatment_of_unipolar_major_depressive_disorder Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking antidepressant medication and the medication was initiated for the treatment of unipolar major depressive disorder.","when_to_set_to_false":"Set to false if the patient is currently taking antidepressant medication but it was not initiated for the treatment of unipolar major depressive disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the antidepressant medication was initiated for the treatment of unipolar major depressive disorder.","meaning":"Boolean indicating whether the patient is currently taking antidepressant medication and it was initiated for the treatment of unipolar major depressive disorder."} // "antidepressant medication initiated for the treatment of unipolar major depressive disorder"
(declare-const patient_is_taking_antidepressant_now@@initiated_for_treatment_of_minor_depressive_disorder Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking antidepressant medication and the medication was initiated for the treatment of minor depressive disorder.","when_to_set_to_false":"Set to false if the patient is currently taking antidepressant medication but it was not initiated for the treatment of minor depressive disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the antidepressant medication was initiated for the treatment of minor depressive disorder.","meaning":"Boolean indicating whether the patient is currently taking antidepressant medication and it was initiated for the treatment of minor depressive disorder."} // "antidepressant medication initiated for the treatment of minor depressive disorder"
(declare-const patient_is_taking_antidepressant_now@@initiated_for_treatment_of_dysthymic_disorder Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking antidepressant medication and the medication was initiated for the treatment of dysthymic disorder.","when_to_set_to_false":"Set to false if the patient is currently taking antidepressant medication but it was not initiated for the treatment of dysthymic disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the antidepressant medication was initiated for the treatment of dysthymic disorder.","meaning":"Boolean indicating whether the patient is currently taking antidepressant medication and it was initiated for the treatment of dysthymic disorder."} // "antidepressant medication initiated for the treatment of dysthymic disorder"

(declare-const patient_has_diagnosis_of_major_depressive_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of major depressive disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of major depressive disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of major depressive disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of major depressive disorder."} // "major depressive disorder"
(declare-const patient_has_diagnosis_of_major_depressive_disorder_now@@diagnosed_by_mini_international_neuropsychiatric_interview Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of major depressive disorder and the diagnosis was made by administration of the Mini-International Neuropsychiatric Interview.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of major depressive disorder but it was not diagnosed by administration of the Mini-International Neuropsychiatric Interview.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis was made by administration of the Mini-International Neuropsychiatric Interview.","meaning":"Boolean indicating whether the patient currently has a diagnosis of major depressive disorder and it was diagnosed by administration of the Mini-International Neuropsychiatric Interview."} // "diagnosed by administration of the Mini-International Neuropsychiatric Interview"

(declare-const patient_has_diagnosis_of_minor_depressive_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of minor depressive disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of minor depressive disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of minor depressive disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of minor depressive disorder."} // "minor depressive disorder"
(declare-const patient_has_diagnosis_of_minor_depressive_disorder_now@@diagnosed_by_structured_clinical_interview_for_diagnosis_iv_section_j_3 Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of minor depressive disorder and the diagnosis was made by administration of the Structured Clinical Interview for Diagnosis-IV section J.3.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of minor depressive disorder but it was not diagnosed by administration of the Structured Clinical Interview for Diagnosis-IV section J.3.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis was made by administration of the Structured Clinical Interview for Diagnosis-IV section J.3.","meaning":"Boolean indicating whether the patient currently has a diagnosis of minor depressive disorder and it was diagnosed by administration of the Structured Clinical Interview for Diagnosis-IV section J.3."} // "diagnosed by administration of the Structured Clinical Interview for Diagnosis-IV section J.3"

(declare-const patient_has_diagnosis_of_dysthymia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of dysthymic disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of dysthymic disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of dysthymic disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of dysthymic disorder."} // "dysthymic disorder"
(declare-const patient_has_diagnosis_of_dysthymia_now@@diagnosed_by_mini_international_neuropsychiatric_interview Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of dysthymic disorder and the diagnosis was made by administration of the Mini-International Neuropsychiatric Interview.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of dysthymic disorder but it was not diagnosed by administration of the Mini-International Neuropsychiatric Interview.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis was made by administration of the Mini-International Neuropsychiatric Interview.","meaning":"Boolean indicating whether the patient currently has a diagnosis of dysthymic disorder and it was diagnosed by administration of the Mini-International Neuropsychiatric Interview."} // "diagnosed by administration of the Mini-International Neuropsychiatric Interview"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply their stem variables
(assert
  (! (=> patient_is_taking_antidepressant_now@@initiated_for_treatment_of_unipolar_major_depressive_disorder
         patient_is_taking_antidepressant_now)
     :named REQ2_AUXILIARY0)) ;; "antidepressant medication initiated for the treatment of unipolar major depressive disorder"

(assert
  (! (=> patient_is_taking_antidepressant_now@@initiated_for_treatment_of_minor_depressive_disorder
         patient_is_taking_antidepressant_now)
     :named REQ2_AUXILIARY1)) ;; "antidepressant medication initiated for the treatment of minor depressive disorder"

(assert
  (! (=> patient_is_taking_antidepressant_now@@initiated_for_treatment_of_dysthymic_disorder
         patient_is_taking_antidepressant_now)
     :named REQ2_AUXILIARY2)) ;; "antidepressant medication initiated for the treatment of dysthymic disorder"

(assert
  (! (=> patient_has_diagnosis_of_major_depressive_disorder_now@@diagnosed_by_mini_international_neuropsychiatric_interview
         patient_has_diagnosis_of_major_depressive_disorder_now)
     :named REQ2_AUXILIARY3)) ;; "major depressive disorder diagnosed by MINI"

(assert
  (! (=> patient_has_diagnosis_of_minor_depressive_disorder_now@@diagnosed_by_structured_clinical_interview_for_diagnosis_iv_section_j_3
         patient_has_diagnosis_of_minor_depressive_disorder_now)
     :named REQ2_AUXILIARY4)) ;; "minor depressive disorder diagnosed by SCID-IV J.3"

(assert
  (! (=> patient_has_diagnosis_of_dysthymia_now@@diagnosed_by_mini_international_neuropsychiatric_interview
         patient_has_diagnosis_of_dysthymia_now)
     :named REQ2_AUXILIARY5)) ;; "dysthymic disorder diagnosed by MINI"

;; ===================== Constraint Assertions (REQ 2) =====================
;; The patient must satisfy at least one of the following:
;; (1) Antidepressant initiated for unipolar major depressive disorder (diagnosed by MINI)
;; (2) Antidepressant initiated for minor depressive disorder (diagnosed by SCID-IV J.3)
;; (3) Antidepressant initiated for dysthymic disorder (diagnosed by MINI)
(assert
  (! (or
        (and patient_is_taking_antidepressant_now@@initiated_for_treatment_of_unipolar_major_depressive_disorder
             patient_has_diagnosis_of_major_depressive_disorder_now@@diagnosed_by_mini_international_neuropsychiatric_interview)
        (and patient_is_taking_antidepressant_now@@initiated_for_treatment_of_minor_depressive_disorder
             patient_has_diagnosis_of_minor_depressive_disorder_now@@diagnosed_by_structured_clinical_interview_for_diagnosis_iv_section_j_3)
        (and patient_is_taking_antidepressant_now@@initiated_for_treatment_of_dysthymic_disorder
             patient_has_diagnosis_of_dysthymia_now@@diagnosed_by_mini_international_neuropsychiatric_interview)
     )
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must ((have had antidepressant medication initiated for the treatment of unipolar major depressive disorder (diagnosed by administration of the Mini-International Neuropsychiatric Interview)) OR (have had antidepressant medication initiated for the treatment of minor depressive disorder (depressive disorder, not otherwise specified) (diagnosed by administration of the Structured Clinical Interview for Diagnosis-IV section J.3)) OR (have had antidepressant medication initiated for the treatment of dysthymic disorder (diagnosed by administration of the Mini-International Neuropsychiatric Interview)))."

;; ===================== Declarations for the inclusion criterion (REQ 3) =====================
(declare-const patient_is_taking_antidepressant_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever taken an antidepressant medication at any time in the past.","when_to_set_to_false":"Set to false if the patient has never taken an antidepressant medication at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever taken an antidepressant medication.","meaning":"Boolean indicating whether the patient has ever taken an antidepressant medication in the past."} // "have used an antidepressant medication for ≥ 3 months for treatment of a depressive disorder"
(declare-const patient_is_taking_antidepressant_inthehistory@@used_for_at_least_3_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken antidepressant medication for at least 3 months in the past.","when_to_set_to_false":"Set to false if the patient has taken antidepressant medication for less than 3 months in the past.","when_to_set_to_null":"Set to null if the duration of antidepressant use is unknown, not documented, or cannot be determined.","meaning":"Boolean indicating whether the patient has taken antidepressant medication for at least 3 months in the past."} // "for ≥ 3 months"
(declare-const patient_is_taking_antidepressant_inthehistory@@used_for_treatment_of_depressive_disorder Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken antidepressant medication for the treatment of a depressive disorder in the past.","when_to_set_to_false":"Set to false if the patient has taken antidepressant medication but not for the treatment of a depressive disorder in the past.","when_to_set_to_null":"Set to null if the indication for antidepressant use is unknown, not documented, or cannot be determined.","meaning":"Boolean indicating whether the patient has taken antidepressant medication for the treatment of a depressive disorder in the past."} // "for treatment of a depressive disorder"
(declare-const patient_is_taking_antidepressant_inthehistory@@stable_dose_for_at_least_2_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has maintained a stable dose of antidepressant medication for at least 2 months in the past.","when_to_set_to_false":"Set to false if the patient has not maintained a stable dose for at least 2 months in the past.","when_to_set_to_null":"Set to null if the duration of dose stability is unknown, not documented, or cannot be determined.","meaning":"Boolean indicating whether the patient has maintained a stable dose of antidepressant medication for at least 2 months in the past."} // "stable dose of antidepressant medication for ≥ 2 months"
(declare-const patient_is_taking_psychiatric_medication_now_count Real) ;; {"when_to_set_to_value":"Set to the total number of psychiatric medications the patient is currently taking.","when_to_set_to_null":"Set to null if the number of psychiatric medications currently taken is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the total number of psychiatric medications the patient is currently taking."} // "if the patient is on more than one psychiatric medication"
(declare-const patient_is_taking_antidepressant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking antidepressant medication.","when_to_set_to_false":"Set to false if the patient is currently not taking antidepressant medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking antidepressant medication.","meaning":"Boolean indicating whether the patient is currently taking antidepressant medication."} // "at least one of them is an antidepressant medication"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies stem variable: "used for at least 3 months"
(assert
  (! (=> patient_is_taking_antidepressant_inthehistory@@used_for_at_least_3_months
         patient_is_taking_antidepressant_inthehistory)
     :named REQ3_AUXILIARY0)) ;; "used for at least 3 months"

;; Qualifier variable implies stem variable: "used for treatment of depressive disorder"
(assert
  (! (=> patient_is_taking_antidepressant_inthehistory@@used_for_treatment_of_depressive_disorder
         patient_is_taking_antidepressant_inthehistory)
     :named REQ3_AUXILIARY1)) ;; "used for treatment of a depressive disorder"

;; Qualifier variable implies stem variable: "stable dose for at least 2 months"
(assert
  (! (=> patient_is_taking_antidepressant_inthehistory@@stable_dose_for_at_least_2_months
         patient_is_taking_antidepressant_inthehistory)
     :named REQ3_AUXILIARY2)) ;; "stable dose for at least 2 months"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: "have used an antidepressant medication for ≥ 3 months for treatment of a depressive disorder"
(assert
  (! (and patient_is_taking_antidepressant_inthehistory@@used_for_at_least_3_months
          patient_is_taking_antidepressant_inthehistory@@used_for_treatment_of_depressive_disorder)
     :named REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE))

;; Component 1: "have a stable dose of antidepressant medication for ≥ 2 months"
(assert
  (! patient_is_taking_antidepressant_inthehistory@@stable_dose_for_at_least_2_months
     :named REQ3_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE))

;; Component 2: "if the patient is on more than one psychiatric medication, at least one of them is an antidepressant medication"
(assert
  (! (or (<= patient_is_taking_psychiatric_medication_now_count 1)
         (and (> patient_is_taking_psychiatric_medication_now_count 1)
              patient_is_taking_antidepressant_now))
     :named REQ3_COMPONENT2_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE))

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_is_taking_antidepressant_inthehistory@@expected_to_continue_same_medication_and_dose_for_study_duration Bool) ;; {"when_to_set_to_true":"Set to true if the patient is expected to continue use of the same antidepressant medication at the same dose for the duration of the study.","when_to_set_to_false":"Set to false if the patient is not expected to continue use of the same antidepressant medication at the same dose for the duration of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is expected to continue use of the same antidepressant medication at the same dose for the duration of the study.","meaning":"Boolean indicating whether the patient is expected to continue use of the same antidepressant medication at the same dose for the duration of the study."} // "be expected to continue use of the same antidepressant medication at the same dose for the duration of the study"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_is_taking_antidepressant_inthehistory@@expected_to_continue_same_medication_and_dose_for_study_duration
         patient_is_taking_antidepressant_inthehistory)
     :named REQ4_AUXILIARY0)) ;; "expected to continue use of the same antidepressant medication at the same dose for the duration of the study" implies "has ever taken an antidepressant medication in the past"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! patient_is_taking_antidepressant_inthehistory@@expected_to_continue_same_medication_and_dose_for_study_duration
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "be expected to continue use of the same antidepressant medication at the same dose for the duration of the study"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patients_madrs_montgomery_asberg_depression_rating_scale_score_is_positive_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if there is any positive MADRS (Montgomery-Åsberg Depression Rating Scale) score recorded for the patient at any time in the past.","when_to_set_to_false":"Set to false if there is no positive MADRS score recorded for the patient at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient ever had a positive MADRS score.","meaning":"Boolean indicating whether the patient has ever had a positive MADRS score in the past."} // "Montgomery-Åsberg Depression Rating Scale"
(declare-const patients_madrs_montgomery_asberg_depression_rating_scale_score_value_recorded_late_luteal_phase_tracking_phase_1_menstrual_cycle_withunit_points Real) ;; {"when_to_set_to_value":"Set to the value of the patient's MADRS score as recorded during the late-luteal phase of the menstrual cycle, prospectively assessed over 1 menstrual cycle during the tracking phase, in points.","when_to_set_to_null":"Set to null if the MADRS score for the late-luteal phase during the tracking phase is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's MADRS score during the late-luteal phase of the menstrual cycle in the tracking phase, in points."} // "late-luteal phase Montgomery-Åsberg Depression Rating Scale score"
(declare-const patients_madrs_montgomery_asberg_depression_rating_scale_score_value_recorded_mid_follicular_phase_tracking_phase_1_menstrual_cycle_withunit_points Real) ;; {"when_to_set_to_value":"Set to the value of the patient's MADRS score as recorded during the mid-follicular phase of the menstrual cycle, prospectively assessed over 1 menstrual cycle during the tracking phase, in points.","when_to_set_to_null":"Set to null if the MADRS score for the mid-follicular phase during the tracking phase is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's MADRS score during the mid-follicular phase of the menstrual cycle in the tracking phase, in points."} // "mid-follicular phase Montgomery-Åsberg Depression Rating Scale score"

;; ===================== Constraint Assertions (REQ 5) =====================
;; The patient must have a ≥ 30% increase from the mid-follicular phase MADRS score to the late-luteal phase MADRS score, as assessed prospectively over 1 menstrual cycle during the tracking phase of the study.
(assert
  (! (>=
        (- patients_madrs_montgomery_asberg_depression_rating_scale_score_value_recorded_late_luteal_phase_tracking_phase_1_menstrual_cycle_withunit_points
           patients_madrs_montgomery_asberg_depression_rating_scale_score_value_recorded_mid_follicular_phase_tracking_phase_1_menstrual_cycle_withunit_points)
        (* 0.3 patients_madrs_montgomery_asberg_depression_rating_scale_score_value_recorded_mid_follicular_phase_tracking_phase_1_menstrual_cycle_withunit_points))
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "≥ 30 % increase from the mid-follicular phase Montgomery-Åsberg Depression Rating Scale score to the late-luteal phase Montgomery-Åsberg Depression Rating Scale score, as assessed prospectively over 1 menstrual cycle during the tracking phase of the study"

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_has_undergone_manual_pelvic_examination_inthepast12months_outcome_is_normal Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a manual pelvic examination with a normal outcome within the past 12 months.","when_to_set_to_false":"Set to false if the patient has not undergone a manual pelvic examination with a normal outcome within the past 12 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a manual pelvic examination with a normal outcome within the past 12 months.","meaning":"Boolean indicating whether the patient has undergone a manual pelvic examination with a normal outcome within the past 12 months."} // "have had a normal pelvic examination within the past 12 months"
(declare-const patient_has_undergone_papanicolaou_smear_inthepast12months_outcome_is_normal Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a Papanicolaou smear with a normal outcome within the past 12 months.","when_to_set_to_false":"Set to false if the patient has not undergone a Papanicolaou smear with a normal outcome within the past 12 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a Papanicolaou smear with a normal outcome within the past 12 months.","meaning":"Boolean indicating whether the patient has undergone a Papanicolaou smear with a normal outcome within the past 12 months."} // "have had a normal Papanicolaou smear within the past 12 months"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Component 0: To be included, the patient must have had a normal pelvic examination within the past 12 months.
(assert
  (! patient_has_undergone_manual_pelvic_examination_inthepast12months_outcome_is_normal
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "have had a normal pelvic examination within the past 12 months"

;; Component 1: To be included, the patient must have had a normal Papanicolaou smear within the past 12 months.
(assert
  (! patient_has_undergone_papanicolaou_smear_inthepast12months_outcome_is_normal
     :named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "have had a normal Papanicolaou smear within the past 12 months"

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_has_undergone_thyroid_stimulating_hormone_measurement_now_outcome_is_normal Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a thyroid-stimulating hormone measurement at screening and the result is normal.","when_to_set_to_false":"Set to false if the patient has undergone a thyroid-stimulating hormone measurement at screening and the result is not normal.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a thyroid-stimulating hormone measurement at screening and the result is normal.","meaning":"Boolean indicating whether the patient has undergone a thyroid-stimulating hormone measurement at screening and the result is normal."} // "have a normal thyroid-stimulating hormone level at screening"
(declare-const patient_is_taking_thyroid_hormone_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a thyroid hormone-containing medication.","when_to_set_to_false":"Set to false if the patient is not currently taking a thyroid hormone-containing medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a thyroid hormone-containing medication.","meaning":"Boolean indicating whether the patient is currently taking a thyroid hormone-containing medication."} // "if the patient is on thyroid medication"
(declare-const patient_is_taking_thyroid_hormone_containing_product_now@@stable_dose_for_at_least_2_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a thyroid hormone-containing medication and the dose has been stable for at least 2 months.","when_to_set_to_false":"Set to false if the patient is currently taking a thyroid hormone-containing medication but the dose has not been stable for at least 2 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the dose has been stable for at least 2 months.","meaning":"Boolean indicating whether the patient is currently taking a thyroid hormone-containing medication and the dose has been stable for at least 2 months."} // "be on a stable dose of thyroid medication for ≥ 2 months"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variable implies stem variable
(assert
  (! (=> patient_is_taking_thyroid_hormone_containing_product_now@@stable_dose_for_at_least_2_months
         patient_is_taking_thyroid_hormone_containing_product_now)
     :named REQ7_AUXILIARY0)) ;; "stable dose for ≥ 2 months" implies "currently taking thyroid medication"

;; ===================== Constraint Assertions (REQ 7) =====================
;; Component 0: ((normal TSH at screening) OR (currently on thyroid medication AND stable dose ≥ 2 months AND normal TSH at screening))
(assert
  (! (or patient_has_undergone_thyroid_stimulating_hormone_measurement_now_outcome_is_normal
         (and patient_is_taking_thyroid_hormone_containing_product_now
              patient_is_taking_thyroid_hormone_containing_product_now@@stable_dose_for_at_least_2_months
              patient_has_undergone_thyroid_stimulating_hormone_measurement_now_outcome_is_normal))
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must ((have a normal thyroid-stimulating hormone level at screening) OR (if the patient is on thyroid medication, be on a stable dose of thyroid medication for ≥ 2 months AND have a normal thyroid-stimulating hormone level at screening))."

;; ===================== Declarations for the inclusion criterion (REQ 8) =====================
(declare-const patient_has_undergone_serum_total_hcg_measurement_now_outcome_is_negative Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a serum total hCG measurement now and the outcome is negative.","when_to_set_to_false":"Set to false if the patient has undergone a serum total hCG measurement now and the outcome is not negative.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a serum total hCG measurement now with a negative outcome.","meaning":"Boolean indicating whether the patient has undergone a serum total hCG measurement now and the outcome is negative."} // "serum human chorionic gonadotropin test"
(declare-const patient_has_undergone_serum_total_hcg_measurement_now_outcome_is_negative@@performed_at_baseline Bool) ;; {"when_to_set_to_true":"Set to true if the serum total hCG measurement was performed at baseline.","when_to_set_to_false":"Set to false if the serum total hCG measurement was not performed at baseline.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the serum total hCG measurement was performed at baseline.","meaning":"Boolean indicating whether the serum total hCG measurement was performed at baseline."} // "serum human chorionic gonadotropin test at baseline"
(declare-const patient_has_undergone_urine_chorionic_gonadotrophin_measurement_now_outcome_is_negative Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a urine chorionic gonadotrophin measurement now and the outcome is negative.","when_to_set_to_false":"Set to false if the patient has undergone a urine chorionic gonadotrophin measurement now and the outcome is not negative.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a urine chorionic gonadotrophin measurement now with a negative outcome.","meaning":"Boolean indicating whether the patient has undergone a urine chorionic gonadotrophin measurement now and the outcome is negative."} // "urine human chorionic gonadotropin test"
(declare-const patient_has_undergone_urine_chorionic_gonadotrophin_measurement_now_outcome_is_negative@@performed_at_visit_3 Bool) ;; {"when_to_set_to_true":"Set to true if the urine chorionic gonadotrophin measurement was performed at visit 3.","when_to_set_to_false":"Set to false if the urine chorionic gonadotrophin measurement was not performed at visit 3.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the urine chorionic gonadotrophin measurement was performed at visit 3.","meaning":"Boolean indicating whether the urine chorionic gonadotrophin measurement was performed at visit 3."} // "urine human chorionic gonadotropin test at visit 3"
(declare-const patient_has_undergone_urine_chorionic_gonadotrophin_measurement_now_outcome_is_negative@@performed_at_visit_5 Bool) ;; {"when_to_set_to_true":"Set to true if the urine chorionic gonadotrophin measurement was performed at visit 5.","when_to_set_to_false":"Set to false if the urine chorionic gonadotrophin measurement was not performed at visit 5.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the urine chorionic gonadotrophin measurement was performed at visit 5.","meaning":"Boolean indicating whether the urine chorionic gonadotrophin measurement was performed at visit 5."} // "urine human chorionic gonadotropin test at visit 5"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variable implies corresponding stem variable for serum hCG at baseline
(assert
  (! (=> patient_has_undergone_serum_total_hcg_measurement_now_outcome_is_negative@@performed_at_baseline
         patient_has_undergone_serum_total_hcg_measurement_now_outcome_is_negative)
     :named REQ8_AUXILIARY0)) ;; "serum human chorionic gonadotropin test at baseline"

;; Qualifier variable implies corresponding stem variable for urine hCG at visit 3
(assert
  (! (=> patient_has_undergone_urine_chorionic_gonadotrophin_measurement_now_outcome_is_negative@@performed_at_visit_3
         patient_has_undergone_urine_chorionic_gonadotrophin_measurement_now_outcome_is_negative)
     :named REQ8_AUXILIARY1)) ;; "urine human chorionic gonadotropin test at visit 3"

;; Qualifier variable implies corresponding stem variable for urine hCG at visit 5
(assert
  (! (=> patient_has_undergone_urine_chorionic_gonadotrophin_measurement_now_outcome_is_negative@@performed_at_visit_5
         patient_has_undergone_urine_chorionic_gonadotrophin_measurement_now_outcome_is_negative)
     :named REQ8_AUXILIARY2)) ;; "urine human chorionic gonadotropin test at visit 5"

;; ===================== Constraint Assertions (REQ 8) =====================
;; Component 0: Negative serum hCG test at baseline
(assert
  (! patient_has_undergone_serum_total_hcg_measurement_now_outcome_is_negative@@performed_at_baseline
     :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "have a negative serum human chorionic gonadotropin test at baseline"

;; Component 1: Negative urine hCG test at visit 3
(assert
  (! patient_has_undergone_urine_chorionic_gonadotrophin_measurement_now_outcome_is_negative@@performed_at_visit_3
     :named REQ8_COMPONENT1_OTHER_REQUIREMENTS)) ;; "have a negative urine human chorionic gonadotropin test at visit 3"

;; Component 2: Negative urine hCG test at visit 5
(assert
  (! patient_has_undergone_urine_chorionic_gonadotrophin_measurement_now_outcome_is_negative@@performed_at_visit_5
     :named REQ8_COMPONENT2_OTHER_REQUIREMENTS)) ;; "have a negative urine human chorionic gonadotropin test at visit 5"

;; ===================== Declarations for the criterion (REQ 9) =====================
(declare-const patient_has_finding_of_potassium_level_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a potassium level finding (regardless of value or context).","when_to_set_to_false":"Set to false if the patient currently does not have a potassium level finding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a potassium level finding.","meaning":"Boolean indicating whether the patient currently has a potassium level finding."} // "potassium levels"
(declare-const patient_has_finding_of_potassium_level_finding_now@@is_normal Bool) ;; {"when_to_set_to_true":"Set to true if the patient's potassium level finding is normal.","when_to_set_to_false":"Set to false if the patient's potassium level finding is not normal.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the potassium level finding is normal.","meaning":"Boolean indicating whether the patient's potassium level finding is normal."} // "normal potassium levels"
(declare-const patient_has_finding_of_potassium_level_finding_now@@measured_at_screening Bool) ;; {"when_to_set_to_true":"Set to true if the potassium level finding was measured at the screening visit.","when_to_set_to_false":"Set to false if the potassium level finding was not measured at the screening visit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the potassium level finding was measured at the screening visit.","meaning":"Boolean indicating whether the potassium level finding was measured at the screening visit."} // "at screening"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_finding_of_potassium_level_finding_now@@is_normal
         patient_has_finding_of_potassium_level_finding_now)
     :named REQ9_AUXILIARY0)) ;; "normal potassium levels"

(assert
  (! (=> patient_has_finding_of_potassium_level_finding_now@@measured_at_screening
         patient_has_finding_of_potassium_level_finding_now)
     :named REQ9_AUXILIARY1)) ;; "measured at screening"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
  (! (and patient_has_finding_of_potassium_level_finding_now@@is_normal
          patient_has_finding_of_potassium_level_finding_now@@measured_at_screening)
     :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have normal potassium levels at screening."

;; ===================== Declarations for the criterion (REQ 10) =====================
(declare-const patient_has_finding_of_barrier_contraception_method_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using a barrier contraception method.","when_to_set_to_false":"Set to false if the patient is currently not using a barrier contraception method.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using a barrier contraception method.","meaning":"Boolean indicating whether the patient is currently using a barrier contraception method."} // "barrier contraceptive methods"
(declare-const patient_has_finding_of_barrier_contraception_method_now@@used_during_study_period Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using a barrier contraception method during the study period.","when_to_set_to_false":"Set to false if the patient is currently not using a barrier contraception method during the study period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using a barrier contraception method during the study period.","meaning":"Boolean indicating whether the patient is currently using a barrier contraception method during the study period."} // "barrier contraceptive methods during the study"
(declare-const patient_has_finding_of_sexually_active_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently sexually active.","when_to_set_to_false":"Set to false if the patient is currently not sexually active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently sexually active.","meaning":"Boolean indicating whether the patient is currently sexually active."} // "sexually active"
(declare-const patient_is_willing_to_use_barrier_contraception_method_during_study_period Bool) ;; {"when_to_set_to_true":"Set to true if the patient is willing to use barrier contraceptive methods during the study period.","when_to_set_to_false":"Set to false if the patient is not willing to use barrier contraceptive methods during the study period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to use barrier contraceptive methods during the study period.","meaning":"Boolean indicating whether the patient is willing to use barrier contraceptive methods during the study period."} // "willing to use barrier contraceptive methods during the study"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_finding_of_barrier_contraception_method_now@@used_during_study_period
         patient_has_finding_of_barrier_contraception_method_now)
     :named REQ10_AUXILIARY0)) ;; "barrier contraceptive methods during the study period" implies "barrier contraceptive methods"

;; ===================== Constraint Assertions (REQ 10) =====================
;; Component 0: To be included, the patient must (NOT sexually active OR willing to use barrier contraceptive methods during the study)
(assert
  (! (or (not patient_has_finding_of_sexually_active_now)
         patient_is_willing_to_use_barrier_contraception_method_during_study_period)
     :named REQ10_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "NOT sexually active OR willing to use barrier contraceptive methods during the study"

;; ===================== Declarations for the criterion (REQ 11) =====================
(declare-const patient_has_finding_of_general_well_being_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently in good general health as determined by clinical assessment.","when_to_set_to_false":"Set to false if the patient is currently not in good general health as determined by clinical assessment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently in good general health.","meaning":"Boolean indicating whether the patient is currently in good general health."} // "the patient must be in good general health"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
  (! patient_has_finding_of_general_well_being_finding_now
     :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must be in good general health"
