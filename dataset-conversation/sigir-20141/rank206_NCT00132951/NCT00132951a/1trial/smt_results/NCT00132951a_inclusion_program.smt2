;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "adult"
(declare-const patient_is_adult_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently classified as an adult according to clinical or legal standards.","when_to_set_to_false":"Set to false if the patient is currently not classified as an adult according to clinical or legal standards.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently classified as an adult according to clinical or legal standards.","meaning":"Boolean indicating whether the patient is currently classified as an adult according to clinical or legal standards."}  ;; "adult"
(declare-const patient_is_outpatient_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently classified as an outpatient.","when_to_set_to_false":"Set to false if the patient is currently not classified as an outpatient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently classified as an outpatient.","meaning":"Boolean indicating whether the patient is currently classified as an outpatient."}  ;; "outpatient"
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current recorded sex is male.","when_to_set_to_false":"Set to false if the patient's current recorded sex is not male.","when_to_set_to_null":"Set to null if the patient's current recorded sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current recorded sex is male."}  ;; "male adult outpatient"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current recorded sex is female.","when_to_set_to_false":"Set to false if the patient's current recorded sex is not female.","when_to_set_to_null":"Set to null if the patient's current recorded sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current recorded sex is female."}  ;; "female adult outpatient"
(declare-const patient_has_diagnosis_of_acute_exacerbation_of_chronic_bronchitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently diagnosed with acute exacerbation of chronic bronchitis.","when_to_set_to_false":"Set to false if the patient is currently not diagnosed with acute exacerbation of chronic bronchitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently diagnosed with acute exacerbation of chronic bronchitis.","meaning":"Boolean indicating whether the patient is currently diagnosed with acute exacerbation of chronic bronchitis."}  ;; "acute exacerbation of chronic bronchitis"

;; ===================== Constraint Assertions (REQ 0) =====================
;; To be included, the patient must be ((a male adult outpatient diagnosed with acute exacerbation of chronic bronchitis) OR (a female adult outpatient diagnosed with acute exacerbation of chronic bronchitis)).
(assert
  (! (or
        (and patient_sex_is_male_now
             patient_is_adult_now
             patient_is_outpatient_now
             patient_has_diagnosis_of_acute_exacerbation_of_chronic_bronchitis_now)
        (and patient_sex_is_female_now
             patient_is_adult_now
             patient_is_outpatient_now
             patient_has_diagnosis_of_acute_exacerbation_of_chronic_bronchitis_now))
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be ((a male adult outpatient diagnosed with acute exacerbation of chronic bronchitis) OR (a female adult outpatient diagnosed with acute exacerbation of chronic bronchitis))."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has childbearing potential.","when_to_set_to_false":"Set to false if the patient currently does not have childbearing potential (e.g., postmenopausal for at least 1 year or surgically incapable of bearing children).","when_to_set_to_null":"Set to null if the patient's current childbearing potential status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient currently has childbearing potential."}  ;; "postmenopausal female adult outpatient for at least 1 year"
(declare-const patient_is_postmenopausal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently postmenopausal.","when_to_set_to_false":"Set to false if the patient is not currently postmenopausal.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently postmenopausal.","meaning":"Boolean indicating whether the patient is currently postmenopausal."}  ;; "postmenopausal female adult outpatient for at least 1 year"
(declare-const patient_is_postmenopausal_now@@duration_at_least_1_year Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently postmenopausal and has been postmenopausal for at least 1 year.","when_to_set_to_false":"Set to false if the patient is currently postmenopausal but has not been postmenopausal for at least 1 year.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been postmenopausal for at least 1 year.","meaning":"Boolean indicating whether the patient is currently postmenopausal and has been so for at least 1 year."}  ;; "postmenopausal female adult outpatient for at least 1 year"
(declare-const patient_is_surgically_incapable_of_bearing_children_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently surgically incapable of bearing children.","when_to_set_to_false":"Set to false if the patient is not currently surgically incapable of bearing children.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently surgically incapable of bearing children.","meaning":"Boolean indicating whether the patient is currently surgically incapable of bearing children."}  ;; "surgically incapable of bearing children female adult outpatient"
(declare-const patients_menstruation_is_normal_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a normal menstrual flow at any time in the history.","when_to_set_to_false":"Set to false if the patient has not had a normal menstrual flow at any time in the history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a normal menstrual flow at any time in the history.","meaning":"Boolean indicating whether the patient has had a normal menstrual flow at any time in the history."}  ;; "menstrual flow"
(declare-const patients_menstruation_is_normal_inthehistory@@temporalcontext_within_1_month_before_study_entry Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a normal menstrual flow within 1 month before study entry.","when_to_set_to_false":"Set to false if the patient has not had a normal menstrual flow within 1 month before study entry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a normal menstrual flow within 1 month before study entry.","meaning":"Boolean indicating whether the patient has had a normal menstrual flow within 1 month before study entry."}  ;; "have a normal menstrual flow within 1 month before study entry"
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as determined by a serum pregnancy test immediately prior to study entry.","when_to_set_to_false":"Set to false if the patient is not currently pregnant as determined by a serum pregnancy test immediately prior to study entry.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown or cannot be determined immediately prior to study entry.","meaning":"Boolean value indicating whether the patient is currently pregnant."}  ;; "have a negative serum pregnancy test immediately prior to study entry"
(declare-const patient_meets_criteria_for_acceptable_birth_control_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently meets the criteria for acceptable birth control.","when_to_set_to_false":"Set to false if the patient does not currently meet the criteria for acceptable birth control.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently meets the criteria for acceptable birth control.","meaning":"Boolean indicating whether the patient currently meets the criteria for acceptable birth control."}  ;; "meet the criteria for acceptable birth control"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_is_postmenopausal_now@@duration_at_least_1_year
         patient_is_postmenopausal_now)
     :named REQ1_AUXILIARY0)) ;; "postmenopausal female adult outpatient for at least 1 year"

;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patients_menstruation_is_normal_inthehistory@@temporalcontext_within_1_month_before_study_entry
         patients_menstruation_is_normal_inthehistory)
     :named REQ1_AUXILIARY1)) ;; "have a normal menstrual flow within 1 month before study entry"

;; ===================== Constraint Assertions (REQ 1) =====================
;; If the patient is a female adult outpatient, then must satisfy one of the three branches:
;; (1) postmenopausal for at least 1 year
;; (2) surgically incapable of bearing children
;; (3) childbearing potential AND normal menstruation within 1 month before study entry AND negative serum pregnancy test AND meets criteria for acceptable birth control

(assert
  (! (=> (and patient_is_adult_now
              patient_is_outpatient_now
              patient_sex_is_female_now)
         (or patient_is_postmenopausal_now@@duration_at_least_1_year
             patient_is_surgically_incapable_of_bearing_children_now
             (and patient_has_childbearing_potential_now
                  patients_menstruation_is_normal_inthehistory@@temporalcontext_within_1_month_before_study_entry
                  (not patient_is_pregnant_now)
                  patient_meets_criteria_for_acceptable_birth_control_now)))
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, if the patient is a female adult outpatient, the patient must be ((a postmenopausal female adult outpatient for at least 1 year) OR (a surgically incapable of bearing children female adult outpatient) OR ((a female adult outpatient of childbearing potential) AND (have a normal menstrual flow within 1 month before study entry) AND (have a negative serum pregnancy test immediately prior to study entry) AND (meet the criteria for acceptable birth control)))."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_provided_written_informed_consent_upon_enrollment Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided written informed consent at the time of enrollment.","when_to_set_to_false":"Set to false if the patient has not provided written informed consent at the time of enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided written informed consent at the time of enrollment.","meaning":"Boolean indicating whether the patient has provided written informed consent at the time of enrollment."} ;; "To be included, the patient must have provided written informed consent upon enrollment."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_provided_written_informed_consent_upon_enrollment
     :named REQ2_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have provided written informed consent upon enrollment."

;; ===================== Constraint Assertions (REQ 3) =====================
;; To be included, the patient must have a diagnosis of acute exacerbation of chronic bronchitis (acute exacerbation of chronic bronchitis is defined below).
(assert
  (! patient_has_diagnosis_of_acute_exacerbation_of_chronic_bronchitis_now
     :named REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE))

;; ===================== Constraint Assertions (REQ 4) =====================
;; "To be included, the patient must be greater than or equal to 35 years of age."
(assert
  (! (>= patient_age_value_recorded_now_in_years 35)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS))

;; ===================== Declarations for the inclusion criterion (REQ 5) =====================
(declare-const patient_has_diagnosis_of_chronic_bronchitis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of chronic bronchitis at any time in the past.","when_to_set_to_false":"Set to false if the patient has no documented history of chronic bronchitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of chronic bronchitis.","meaning":"Boolean indicating whether the patient has a documented history of chronic bronchitis."} ;; "have a documented history of chronic bronchitis"
(declare-const patient_forced_expired_volume_in_1_second_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured percent value if the patient's basal FEV1 is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric percent representing the patient's basal FEV1 as a percent of predicted."} ;; "basal forced expiratory volume in one second less than 70 percent AND greater than 35 percent"
(declare-const patient_has_finding_of_acute_exacerbation_of_chronic_bronchitis_inthepast1years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had at least one acute exacerbation of chronic bronchitis in the previous year.","when_to_set_to_false":"Set to false if the patient has not had any acute exacerbation of chronic bronchitis in the previous year.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had an acute exacerbation of chronic bronchitis in the previous year.","meaning":"Boolean indicating whether the patient has had an acute exacerbation of chronic bronchitis in the past 1 year."} ;; "have had at least one acute exacerbation of chronic bronchitis in the previous year"
(declare-const patient_forced_expired_volume_in_1_second_to_forced_vital_capacity_ratio_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured percent value if the patient's FEV1/FVC ratio is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric percent representing the patient's basal FEV1/FVC ratio as a percent."} ;; "forced expiratory volume in one second/forced vital capacity less than 70 percent"
(declare-const patient_forced_vital_capacity_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured percent value if the patient's FVC is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric percent representing the patient's current FVC as a percent of predicted."} ;; "forced vital capacity"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Component 0: Documented history of chronic bronchitis
(assert
  (! patient_has_diagnosis_of_chronic_bronchitis_inthehistory
     :named REQ5_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "have a documented history of chronic bronchitis"

;; Component 1: Basal FEV1 < 70% AND > 35%
(assert
  (! (and (< patient_forced_expired_volume_in_1_second_value_recorded_now_withunit_percent 70.0)
          (> patient_forced_expired_volume_in_1_second_value_recorded_now_withunit_percent 35.0))
     :named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "basal forced expiratory volume in one second less than 70 percent AND greater than 35 percent"

;; Component 2: At least one acute exacerbation of chronic bronchitis in previous year
(assert
  (! patient_has_finding_of_acute_exacerbation_of_chronic_bronchitis_inthepast1years
     :named REQ5_COMPONENT2_OTHER_REQUIREMENTS)) ;; "have had at least one acute exacerbation of chronic bronchitis in the previous year"

;; Component 3: FEV1/FVC ratio < 70%
(assert
  (! (< patient_forced_expired_volume_in_1_second_to_forced_vital_capacity_ratio_value_recorded_now_withunit_percent 70.0)
     :named REQ5_COMPONENT3_OTHER_REQUIREMENTS)) ;; "forced expiratory volume in one second/forced vital capacity less than 70 percent"

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_has_diagnosis_of_acute_exacerbation_of_chronic_bronchitis_now@@presumed_due_to_bacterial_infection Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of acute exacerbation of chronic bronchitis is presumed to be due to bacterial infection.","when_to_set_to_false":"Set to false if the patient's current diagnosis of acute exacerbation of chronic bronchitis is not presumed to be due to bacterial infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is presumed to be due to bacterial infection.","meaning":"Boolean indicating whether the patient's current diagnosis of acute exacerbation of chronic bronchitis is presumed to be due to bacterial infection."} ;; "presumed to be due to bacterial infection"
(declare-const patient_has_finding_of_purulent_sputum_now@@increased Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current purulent sputum is increased compared to baseline.","when_to_set_to_false":"Set to false if the patient's current purulent sputum is not increased compared to baseline.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the purulence is increased compared to baseline.","meaning":"Boolean indicating whether the patient's current purulent sputum is increased compared to baseline."} ;; "increased sputum purulence"
(declare-const patient_has_finding_of_dyspnea_now@@increased Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current dyspnea is increased compared to baseline.","when_to_set_to_false":"Set to false if the patient's current dyspnea is not increased compared to baseline.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the dyspnea is increased compared to baseline.","meaning":"Boolean indicating whether the patient's current dyspnea is increased compared to baseline."} ;; "increased dyspnea"
(declare-const patient_has_finding_of_sputum_volume_now@@increased Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sputum volume is increased compared to baseline.","when_to_set_to_false":"Set to false if the patient's current sputum volume is not increased compared to baseline.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the sputum volume is increased compared to baseline.","meaning":"Boolean indicating whether the patient's current sputum volume is increased compared to baseline."} ;; "increased sputum volume"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; The diagnosis qualifier is defined by increased sputum purulence AND (increased dyspnea OR increased sputum volume)
(assert
  (! (= patient_has_diagnosis_of_acute_exacerbation_of_chronic_bronchitis_now@@presumed_due_to_bacterial_infection
        (and patient_has_finding_of_purulent_sputum_now@@increased
             (or patient_has_finding_of_dyspnea_now@@increased
                 patient_has_finding_of_sputum_volume_now@@increased)))
     :named REQ6_AUXILIARY0)) ;; "presumed to be due to bacterial infection (based on increased sputum purulence AND (increased dyspnea OR increased sputum volume))"

;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_diagnosis_of_acute_exacerbation_of_chronic_bronchitis_now@@presumed_due_to_bacterial_infection
         patient_has_diagnosis_of_acute_exacerbation_of_chronic_bronchitis_now)
     :named REQ6_AUXILIARY1)) ;; "diagnosis of acute exacerbation of chronic bronchitis"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! patient_has_diagnosis_of_acute_exacerbation_of_chronic_bronchitis_now@@presumed_due_to_bacterial_infection
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a clinical diagnosis of acute exacerbation of chronic bronchitis, presumed to be due to bacterial infection (based on increased sputum purulence AND (increased dyspnea OR increased sputum volume))."

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_is_exposed_to_sputum_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently producing or exposed to sputum, regardless of whether it is produced spontaneously or induced.","when_to_set_to_false":"Set to false if the patient is not currently producing or exposed to sputum.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently producing or exposed to sputum.","meaning":"Boolean indicating whether the patient is currently producing or exposed to sputum."} ;; "the patient must be producing spontaneous sputum"
(declare-const patient_is_exposed_to_sputum_now@@produced_spontaneously Bool) ;; {"when_to_set_to_true":"Set to true if the sputum currently produced or exposed to by the patient is produced spontaneously (not induced).","when_to_set_to_false":"Set to false if the sputum currently produced or exposed to by the patient is not produced spontaneously (i.e., it is induced).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the sputum is produced spontaneously.","meaning":"Boolean indicating whether the sputum currently produced or exposed to by the patient is produced spontaneously (not induced)."} ;; "the patient must be producing spontaneous sputum"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variable implies the stem variable (if sputum is produced spontaneously, then sputum is being produced)
(assert
  (! (=> patient_is_exposed_to_sputum_now@@produced_spontaneously
         patient_is_exposed_to_sputum_now)
     :named REQ7_AUXILIARY0)) ;; "the patient must be producing spontaneous sputum"

;; ===================== Constraint Assertions (REQ 7) =====================
;; The patient must be producing spontaneous sputum
(assert
  (! patient_is_exposed_to_sputum_now@@produced_spontaneously
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must be producing spontaneous sputum"

;; ===================== Declarations for the criterion (REQ 8) =====================
(declare-const patient_tobacco_smoking_behavior_finding_value_recorded_inthehistory_withunit_pack_years Real) ;; {"when_to_set_to_value":"Set to the total number of pack-years of cigarette smoking documented in the patient's history, if available.","when_to_set_to_null":"Set to null if the patient's cumulative pack-year history is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's cumulative history of tobacco smoking behavior in pack-years, at any time in the past."} ;; "history of cigarette smoking of at least 10 pack-years"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
  (! (>= patient_tobacco_smoking_behavior_finding_value_recorded_inthehistory_withunit_pack_years 10.0)
     :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "history of cigarette smoking of at least 10 pack-years"
