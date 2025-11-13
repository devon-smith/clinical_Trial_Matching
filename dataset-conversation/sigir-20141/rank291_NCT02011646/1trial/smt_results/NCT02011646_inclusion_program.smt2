;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged ≥ 12 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 12)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be aged ≥ 12 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_dissatisfaction_with_body_image_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of dissatisfaction with their body image (body image concern).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of dissatisfaction with their body image (body image concern).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has dissatisfaction with their body image.","meaning":"Boolean indicating whether the patient currently has dissatisfaction with their body image (body image concern)."} ;; "body image concern"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_finding_of_dissatisfaction_with_body_image_now
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have body image concern."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_eating_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any eating disorder symptomatology, including sub-threshold symptoms.","when_to_set_to_false":"Set to false if the patient currently does not have any eating disorder symptomatology.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any eating disorder symptomatology.","meaning":"Boolean indicating whether the patient currently has any eating disorder symptomatology."} ;; "eating disorder symptomatology"
(declare-const patient_has_finding_of_subthreshold_eating_disorder_symptomatology_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has sub-threshold eating disorder symptomatology (i.e., symptoms that do not meet full criteria for an eating disorder but are clinically significant).","when_to_set_to_false":"Set to false if the patient currently does not have any sub-threshold eating disorder symptomatology.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has sub-threshold eating disorder symptomatology.","meaning":"Boolean indicating whether the patient currently has sub-threshold eating disorder symptomatology."} ;; "sub-threshold eating disorder symptomatology"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Sub-threshold eating disorder symptomatology is a subset of eating disorder symptomatology
(assert
  (! (=> patient_has_finding_of_subthreshold_eating_disorder_symptomatology_now
         patient_has_finding_of_eating_disorder_now)
     :named REQ2_AUXILIARY0)) ;; "sub-threshold eating disorder symptomatology" implies "eating disorder symptomatology"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: To be included, the patient must have sub-threshold eating disorder symptomatology.
(assert
  (! patient_has_finding_of_subthreshold_eating_disorder_symptomatology_now
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have sub-threshold eating disorder symptomatology."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_body_mass_index_percentile_for_age_and_sex_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured BMI percentile for age and sex if a numeric measurement recorded now is available.","when_to_set_to_null":"Set to null if no such BMI percentile measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current BMI percentile for age and sex in percent."} ;; "body mass index percentile for age and sex"
(declare-const patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 Real) ;; {"when_to_set_to_value":"Set to the measured BMI value in kg/m² if a numeric measurement recorded now is available.","when_to_set_to_null":"Set to null if no such BMI measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current BMI in kg/m²."} ;; "body mass index"
(declare-const patient_has_finding_of_obesity_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of obesity.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of obesity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of obesity.","meaning":"Boolean indicating whether the patient currently has obesity."} ;; "obesity"
(declare-const patient_has_finding_of_overweight_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of overweight.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of overweight.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of overweight.","meaning":"Boolean indicating whether the patient currently has overweight."} ;; "overweight"
(declare-const patient_is_adolescent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently classified as an adolescent.","when_to_set_to_false":"Set to false if the patient is currently not classified as an adolescent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently classified as an adolescent.","meaning":"Boolean indicating whether the patient is currently classified as an adolescent."} ;; "adolescent"
(declare-const patient_is_adult_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently classified as an adult.","when_to_set_to_false":"Set to false if the patient is currently not classified as an adult.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently classified as an adult.","meaning":"Boolean indicating whether the patient is currently classified as an adult."} ;; "adult"
(declare-const patient_is_child_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently classified as a child.","when_to_set_to_false":"Set to false if the patient is currently not classified as a child.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently classified as a child.","meaning":"Boolean indicating whether the patient is currently classified as a child."} ;; "child"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex matches the specified sex.","when_to_set_to_false":"Set to false if the patient's current sex does not match the specified sex.","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Indicates the patient's current sex."} ;; "sex (female)"
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex matches the specified sex.","when_to_set_to_false":"Set to false if the patient's current sex does not match the specified sex.","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Indicates the patient's current sex."} ;; "sex (male)"
;; patient_age_value_recorded_now_in_years already declared

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Definition: Overweight for children/adolescents: BMI percentile ≥ 85th and < 95th for age and sex
(assert
  (! (= (or patient_is_child_now patient_is_adolescent_now)
        (and (or patient_is_child_now patient_is_adolescent_now)
             (>= patient_body_mass_index_percentile_for_age_and_sex_value_recorded_now_withunit_percent 85.0)
             (< patient_body_mass_index_percentile_for_age_and_sex_value_recorded_now_withunit_percent 95.0)))
     :named REQ3_AUXILIARY0)) ;; "for a patient who is a child or adolescent, body mass index ≥ 85th percentile AND body mass index < 95th percentile for age and sex"

;; Definition: Overweight for adults aged ≥ 21 and ≤ 24: BMI ≥ 25 and < 30 kg/m²
(assert
  (! (= (and patient_is_adult_now
             (>= patient_age_value_recorded_now_in_years 21.0)
             (<= patient_age_value_recorded_now_in_years 24.0))
        (and patient_is_adult_now
             (>= patient_age_value_recorded_now_in_years 21.0)
             (<= patient_age_value_recorded_now_in_years 24.0)
             (>= patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 25.0)
             (< patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 30.0)))
     :named REQ3_AUXILIARY1)) ;; "for a patient who is an adult aged ≥ 21 years AND ≤ 24 years, body mass index ≥ 25 kilograms per square meter AND body mass index < 30 kilograms per square meter"

;; Definition: Overweight is present if either child/adolescent or adult (21-24) criteria are met
(assert
  (! (= patient_has_finding_of_overweight_now
        (or (and (or patient_is_child_now patient_is_adolescent_now)
                 (>= patient_body_mass_index_percentile_for_age_and_sex_value_recorded_now_withunit_percent 85.0)
                 (< patient_body_mass_index_percentile_for_age_and_sex_value_recorded_now_withunit_percent 95.0))
            (and patient_is_adult_now
                 (>= patient_age_value_recorded_now_in_years 21.0)
                 (<= patient_age_value_recorded_now_in_years 24.0)
                 (>= patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 25.0)
                 (< patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 30.0))))
     :named REQ3_AUXILIARY2)) ;; "overweight, defined as ((for a patient who is a child or adolescent, body mass index ≥ 85th percentile AND body mass index < 95th percentile for age and sex) OR (for a patient who is an adult aged ≥ 21 years AND ≤ 24 years, body mass index ≥ 25 kilograms per square meter AND body mass index < 30 kilograms per square meter))"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: Must be overweight AND NOT have obesity
(assert
  (! (and patient_has_finding_of_overweight_now
          (not patient_has_finding_of_obesity_now))
     :named REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be overweight AND NOT have obesity"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_can_commit_to_weekly_session_for_six_weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able to commit to attending a weekly 1-hour session for six consecutive weeks.","when_to_set_to_false":"Set to false if the patient is not able to commit to attending a weekly 1-hour session for six consecutive weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to commit to attending a weekly 1-hour session for six consecutive weeks.","meaning":"Boolean indicating whether the patient is able to commit to attending a weekly 1-hour session for six consecutive weeks."} ;; "commit to weekly 1-hour session for six weeks"
(declare-const session_count_committed_by_patient_in_six_weeks_withunit_sessions Real) ;; {"when_to_set_to_value":"Set to the number of weekly 1-hour sessions the patient is able to commit to over a six-week period, measured in sessions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many weekly 1-hour sessions the patient is able to commit to over a six-week period.","meaning":"Numeric value indicating the number of weekly 1-hour sessions the patient is able to commit to over a six-week period, measured in sessions."} ;; "commit to weekly 1-hour session for six weeks"

(declare-const patient_can_commit_to_three_assessment_visits_at_mount_sinai_adolescent_health_center Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able to commit to attending three separate assessment visits at the Mount Sinai Adolescent Health Center.","when_to_set_to_false":"Set to false if the patient is not able to commit to attending three separate assessment visits at the Mount Sinai Adolescent Health Center.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to commit to attending three separate assessment visits at the Mount Sinai Adolescent Health Center.","meaning":"Boolean indicating whether the patient is able to commit to attending three separate assessment visits at the Mount Sinai Adolescent Health Center."} ;; "commit to three separate assessment visits to the Mount Sinai Adolescent Health Center"
(declare-const assessment_visit_count_committed_by_patient_at_mount_sinai_adolescent_health_center_withunit_visits Real) ;; {"when_to_set_to_value":"Set to the number of separate assessment visits at the Mount Sinai Adolescent Health Center the patient is able to commit to, measured in visits.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many separate assessment visits at the Mount Sinai Adolescent Health Center the patient is able to commit to.","meaning":"Numeric value indicating the number of separate assessment visits at the Mount Sinai Adolescent Health Center the patient is able to commit to, measured in visits."} ;; "commit to three separate assessment visits to the Mount Sinai Adolescent Health Center"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Definition: patient_can_commit_to_weekly_session_for_six_weeks is true iff session_count_committed_by_patient_in_six_weeks_withunit_sessions >= 6
(assert
  (! (= patient_can_commit_to_weekly_session_for_six_weeks
        (>= session_count_committed_by_patient_in_six_weeks_withunit_sessions 6))
     :named REQ4_AUXILIARY0)) ;; "commit to weekly 1-hour session for six weeks"

;; Definition: patient_can_commit_to_three_assessment_visits_at_mount_sinai_adolescent_health_center is true iff assessment_visit_count_committed_by_patient_at_mount_sinai_adolescent_health_center_withunit_visits >= 3
(assert
  (! (= patient_can_commit_to_three_assessment_visits_at_mount_sinai_adolescent_health_center
        (>= assessment_visit_count_committed_by_patient_at_mount_sinai_adolescent_health_center_withunit_visits 3))
     :named REQ4_AUXILIARY1)) ;; "commit to three separate assessment visits to the Mount Sinai Adolescent Health Center"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: patient must be able to commit to weekly 1-hour session for six weeks
(assert
  (! patient_can_commit_to_weekly_session_for_six_weeks
     :named REQ4_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "commit to weekly 1-hour session for six weeks"

;; Component 1: patient must be able to commit to three separate assessment visits to the Mount Sinai Adolescent Health Center
(assert
  (! patient_can_commit_to_three_assessment_visits_at_mount_sinai_adolescent_health_center
     :named REQ4_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "commit to three separate assessment visits to the Mount Sinai Adolescent Health Center"
