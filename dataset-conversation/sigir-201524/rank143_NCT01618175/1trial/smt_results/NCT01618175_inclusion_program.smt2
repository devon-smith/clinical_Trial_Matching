;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_months Real) ;; {"when_to_set_to_value":"Set to the patient's current age in months if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in months is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in months."}  ;; "aged ≥ 2 months AND aged ≤ 24 months"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged ≥ 2 months AND aged ≤ 24 months"
(declare-const patient_postconceptional_age_value_recorded_now_in_weeks Real) ;; {"when_to_set_to_value":"Set to the patient's current postconceptional age in weeks if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current postconceptional age in weeks is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current postconceptional age in weeks."}  ;; "have a postconceptional age > 44 weeks"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: To be included, the patient must be aged ≥ 2 months.
(assert
  (! (>= patient_age_value_recorded_now_in_months 2.0)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "aged ≥ 2 months"

;; Component 1: To be included, the patient must be aged ≤ 24 months.
(assert
  (! (<= patient_age_value_recorded_now_in_months 24.0)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "aged ≤ 24 months"

;; Component 2: To be included, the patient must have a postconceptional age > 44 weeks.
(assert
  (! (> patient_postconceptional_age_value_recorded_now_in_weeks 44.0)
     :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "have a postconceptional age > 44 weeks"

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_has_acute_respiratory_illness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an acute respiratory illness.","when_to_set_to_false":"Set to false if the patient currently does not have an acute respiratory illness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an acute respiratory illness.","meaning":"Boolean indicating whether the patient currently has an acute respiratory illness."} ;; "acute respiratory illness"
(declare-const patient_has_diagnosis_of_acute_bronchiolitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical diagnosis of acute bronchiolitis.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical diagnosis of acute bronchiolitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical diagnosis of acute bronchiolitis.","meaning":"Boolean indicating whether the patient currently has a clinical diagnosis of acute bronchiolitis."} ;; "clinical diagnosis of acute bronchiolitis"
(declare-const patient_has_finding_of_nasal_congestion_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of nasal congestion.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of nasal congestion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of nasal congestion.","meaning":"Boolean indicating whether the patient currently has the clinical finding of nasal congestion."} ;; "nasal congestion"
(declare-const patient_has_finding_of_nasal_congestion_now@@present_during_acute_respiratory_illness Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has nasal congestion and it is present during an acute respiratory illness.","when_to_set_to_false":"Set to false if the patient currently has nasal congestion but it is not present during an acute respiratory illness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether nasal congestion is present during an acute respiratory illness.","meaning":"Boolean indicating whether the patient's nasal congestion is present during an acute respiratory illness."} ;; "nasal congestion ... during acute respiratory illness"
(declare-const patient_has_finding_of_cough_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of cough.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of cough.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of cough.","meaning":"Boolean indicating whether the patient currently has the clinical finding of cough."} ;; "cough"
(declare-const patient_has_finding_of_cough_now@@present_during_acute_respiratory_illness Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cough and it is present during an acute respiratory illness.","when_to_set_to_false":"Set to false if the patient currently has cough but it is not present during an acute respiratory illness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether cough is present during an acute respiratory illness.","meaning":"Boolean indicating whether the patient's cough is present during an acute respiratory illness."} ;; "cough ... during acute respiratory illness"
(declare-const patient_has_finding_of_wheezing_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of wheezing.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of wheezing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of wheezing.","meaning":"Boolean indicating whether the patient currently has the clinical finding of wheezing."} ;; "wheezing"
(declare-const patient_has_finding_of_respiratory_crackles_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of respiratory crackles.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of respiratory crackles.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of respiratory crackles.","meaning":"Boolean indicating whether the patient currently has the clinical finding of respiratory crackles."} ;; "crackles"
(declare-const patient_has_finding_of_tachypnea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of tachypnea.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of tachypnea.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of tachypnea.","meaning":"Boolean indicating whether the patient currently has the clinical finding of tachypnea."} ;; "tachypnea"
(declare-const patient_has_finding_of_chest_wall_retraction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of chest wall retraction.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of chest wall retraction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of chest wall retraction.","meaning":"Boolean indicating whether the patient currently has the clinical finding of chest wall retraction."} ;; "retractions of the chest"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_finding_of_nasal_congestion_now@@present_during_acute_respiratory_illness
         (and patient_has_finding_of_nasal_congestion_now patient_has_acute_respiratory_illness_now))
     :named REQ1_AUXILIARY0)) ;; "nasal congestion ... during acute respiratory illness"

(assert
  (! (=> patient_has_finding_of_cough_now@@present_during_acute_respiratory_illness
         (and patient_has_finding_of_cough_now patient_has_acute_respiratory_illness_now))
     :named REQ1_AUXILIARY1)) ;; "cough ... during acute respiratory illness"

;; "acute respiratory illness including nasal congestion, cough and wheezing or crackles, tachypnea or retractions of the chest"
;; The list is non-exhaustive (default), so we only use one-way implication for umbrella definition.
(assert
  (! (=> (and patient_has_finding_of_nasal_congestion_now@@present_during_acute_respiratory_illness
              patient_has_finding_of_cough_now@@present_during_acute_respiratory_illness
              (or patient_has_finding_of_wheezing_now patient_has_finding_of_respiratory_crackles_now)
              (or patient_has_finding_of_tachypnea_now patient_has_finding_of_chest_wall_retraction_now))
         patient_has_acute_respiratory_illness_now)
     :named REQ1_AUXILIARY2)) ;; "acute respiratory illness including nasal congestion, cough and wheezing or crackles, tachypnea or retractions of the chest"

;; ===================== Constraint Assertions (REQ 1) =====================
;; To be included, the patient must have a clinical diagnosis of acute bronchiolitis, defined as acute respiratory illness including nasal congestion, cough and wheezing or crackles, tachypnea or retractions of the chest.
(assert
  (! (and patient_has_diagnosis_of_acute_bronchiolitis_now
          patient_has_acute_respiratory_illness_now
          patient_has_finding_of_nasal_congestion_now@@present_during_acute_respiratory_illness
          patient_has_finding_of_cough_now@@present_during_acute_respiratory_illness
          (or patient_has_finding_of_wheezing_now patient_has_finding_of_respiratory_crackles_now)
          (or patient_has_finding_of_tachypnea_now patient_has_finding_of_chest_wall_retraction_now))
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a clinical diagnosis of acute bronchiolitis, defined as acute respiratory illness including nasal congestion, cough and wheezing or crackles, tachypnea or retractions of the chest."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_bronchiolitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of bronchiolitis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of bronchiolitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of bronchiolitis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of bronchiolitis."} ;; "the patient must have a chest X-ray confirming a viral diagnosis of bronchiolitis."
(declare-const patient_has_diagnosis_of_bronchiolitis_now@@diagnosed_as_viral_by_chest_x_ray Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of bronchiolitis now is viral and determined by chest X-ray.","when_to_set_to_false":"Set to false if the diagnosis of bronchiolitis now is not viral or not determined by chest X-ray.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of bronchiolitis now is viral and determined by chest X-ray.","meaning":"Boolean indicating whether the diagnosis of bronchiolitis now is viral and determined by chest X-ray."} ;; "the patient must have a chest X-ray confirming a viral diagnosis of bronchiolitis."
(declare-const patient_has_undergone_plain_chest_x_ray_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a chest X-ray now.","when_to_set_to_false":"Set to false if the patient has not undergone a chest X-ray now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a chest X-ray now.","meaning":"Boolean indicating whether the patient has undergone a chest X-ray now."} ;; "the patient must have a chest X-ray confirming a viral diagnosis of bronchiolitis."
(declare-const patient_has_undergone_plain_chest_x_ray_now@@confirms_viral_diagnosis_of_bronchiolitis Bool) ;; {"when_to_set_to_true":"Set to true if the chest X-ray performed now confirms a viral diagnosis of bronchiolitis.","when_to_set_to_false":"Set to false if the chest X-ray performed now does not confirm a viral diagnosis of bronchiolitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the chest X-ray performed now confirms a viral diagnosis of bronchiolitis.","meaning":"Boolean indicating whether the chest X-ray performed now confirms a viral diagnosis of bronchiolitis."} ;; "the patient must have a chest X-ray confirming a viral diagnosis of bronchiolitis."

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_diagnosis_of_bronchiolitis_now@@diagnosed_as_viral_by_chest_x_ray
         patient_has_diagnosis_of_bronchiolitis_now)
     :named REQ2_AUXILIARY0)) ;; "diagnosed as viral by chest X-ray" implies "diagnosis of bronchiolitis now"

;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_undergone_plain_chest_x_ray_now@@confirms_viral_diagnosis_of_bronchiolitis
         patient_has_undergone_plain_chest_x_ray_now)
     :named REQ2_AUXILIARY1)) ;; "chest X-ray confirms viral diagnosis of bronchiolitis" implies "undergone chest X-ray now"

;; The chest X-ray confirming viral bronchiolitis implies the diagnosis is viral by chest X-ray
(assert
  (! (=> patient_has_undergone_plain_chest_x_ray_now@@confirms_viral_diagnosis_of_bronchiolitis
         patient_has_diagnosis_of_bronchiolitis_now@@diagnosed_as_viral_by_chest_x_ray)
     :named REQ2_AUXILIARY2)) ;; "chest X-ray confirms viral diagnosis of bronchiolitis" implies "diagnosed as viral by chest X-ray"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_undergone_plain_chest_x_ray_now@@confirms_viral_diagnosis_of_bronchiolitis
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must have a chest X-ray confirming a viral diagnosis of bronchiolitis."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_finding_of_wheezing_now@@first_attack Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently experiencing wheezing and this is the patient's first attack of wheezing.","when_to_set_to_false":"Set to false if the patient is currently experiencing wheezing but this is not the patient's first attack, or if the patient is not currently experiencing wheezing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the current wheezing is the patient's first attack.","meaning":"Boolean indicating whether the patient is currently experiencing wheezing and it is the first attack."} ;; "the patient must be experiencing a first attack of wheezing."

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_finding_of_wheezing_now@@first_attack
         patient_has_finding_of_wheezing_now)
     :named REQ3_AUXILIARY0)) ;; "the patient must be experiencing a first attack of wheezing."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_has_finding_of_wheezing_now@@first_attack
     :named REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must be experiencing a first attack of wheezing."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_hemoglobin_saturation_with_oxygen_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured percent value if the patient's oxygen saturation (hemoglobin saturation with oxygen) is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric percent value representing the patient's current hemoglobin saturation with oxygen (oxygen saturation)."} ;; "oxygen saturation < 91 percent"
(declare-const patient_hemoglobin_saturation_with_oxygen_value_recorded_now_withunit_percent@@measured_in_room_air Bool) ;; {"when_to_set_to_true":"Set to true if the oxygen saturation measurement was performed in room air.","when_to_set_to_false":"Set to false if the oxygen saturation measurement was not performed in room air.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the measurement was performed in room air.","meaning":"Boolean indicating whether the oxygen saturation measurement was performed in room air."} ;; "in room air"
(declare-const patient_hemoglobin_saturation_with_oxygen_value_recorded_now_withunit_percent@@measured_upon_arrival_to_emergency_department Bool) ;; {"when_to_set_to_true":"Set to true if the oxygen saturation measurement was performed upon arrival to the emergency department.","when_to_set_to_false":"Set to false if the oxygen saturation measurement was not performed upon arrival to the emergency department.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the measurement was performed upon arrival to the emergency department.","meaning":"Boolean indicating whether the oxygen saturation measurement was performed upon arrival to the emergency department."} ;; "upon arrival to the emergency department"
(declare-const patient_hemoglobin_saturation_with_oxygen_value_recorded_now_withunit_percent@@measured_in_room_air@@measured_upon_arrival_to_emergency_department Real) ;; {"when_to_set_to_value":"Set to the measured percent value if the patient's oxygen saturation (hemoglobin saturation with oxygen) is recorded now, measured in room air, and measured upon arrival to the emergency department.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric percent value representing the patient's current hemoglobin saturation with oxygen (oxygen saturation), measured in room air and upon arrival to the emergency department."} ;; "oxygen saturation < 91 percent in room air upon arrival to the emergency department"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; The doubly-qualified variable is only defined if both qualifiers are true
(assert
  (! (=> (and patient_hemoglobin_saturation_with_oxygen_value_recorded_now_withunit_percent@@measured_in_room_air
              patient_hemoglobin_saturation_with_oxygen_value_recorded_now_withunit_percent@@measured_upon_arrival_to_emergency_department)
         (= patient_hemoglobin_saturation_with_oxygen_value_recorded_now_withunit_percent@@measured_in_room_air@@measured_upon_arrival_to_emergency_department
            patient_hemoglobin_saturation_with_oxygen_value_recorded_now_withunit_percent))
     :named REQ4_AUXILIARY0)) ;; "oxygen saturation < 91 percent in room air upon arrival to the emergency department"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (and patient_hemoglobin_saturation_with_oxygen_value_recorded_now_withunit_percent@@measured_in_room_air
          patient_hemoglobin_saturation_with_oxygen_value_recorded_now_withunit_percent@@measured_upon_arrival_to_emergency_department
          (< patient_hemoglobin_saturation_with_oxygen_value_recorded_now_withunit_percent@@measured_in_room_air@@measured_upon_arrival_to_emergency_department 91.0))
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "oxygen saturation < 91 percent in room air upon arrival to the emergency department"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_way_to_return_to_emergency_department_after_discharge Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a way to return to the emergency department after discharge.","when_to_set_to_false":"Set to false if the patient does not have a way to return to the emergency department after discharge.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a way to return to the emergency department after discharge.","meaning":"Boolean indicating whether the patient has a way to return to the emergency department after discharge."} ;; "the patient must have a way for the patient to return to the emergency department after discharge"
(declare-const patient_has_way_to_return_to_emergency_department_after_discharge@@emergency_department_accessible_after_discharge Bool) ;; {"when_to_set_to_true":"Set to true if the emergency department is accessible to the patient after discharge.","when_to_set_to_false":"Set to false if the emergency department is not accessible to the patient after discharge.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the emergency department is accessible to the patient after discharge.","meaning":"Boolean indicating whether the emergency department is accessible to the patient after discharge."} ;; "the patient must have a way for the patient to return to the emergency department after discharge"
(declare-const family_has_way_to_return_to_emergency_department_after_discharge Bool) ;; {"when_to_set_to_true":"Set to true if the family of the patient has a way to return to the emergency department after discharge.","when_to_set_to_false":"Set to false if the family of the patient does not have a way to return to the emergency department after discharge.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the family of the patient has a way to return to the emergency department after discharge.","meaning":"Boolean indicating whether the family of the patient has a way to return to the emergency department after discharge."} ;; "the patient must have a way for the family of the patient to return to the emergency department after discharge"
(declare-const family_has_way_to_return_to_emergency_department_after_discharge@@emergency_department_accessible_after_discharge Bool) ;; {"when_to_set_to_true":"Set to true if the emergency department is accessible to the family of the patient after discharge.","when_to_set_to_false":"Set to false if the emergency department is not accessible to the family of the patient after discharge.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the emergency department is accessible to the family of the patient after discharge.","meaning":"Boolean indicating whether the emergency department is accessible to the family of the patient after discharge."} ;; "the patient must have a way for the family of the patient to return to the emergency department after discharge"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_way_to_return_to_emergency_department_after_discharge@@emergency_department_accessible_after_discharge
         patient_has_way_to_return_to_emergency_department_after_discharge)
     :named REQ5_AUXILIARY0)) ;; "the patient must have a way for the patient to return to the emergency department after discharge"

(assert
  (! (=> family_has_way_to_return_to_emergency_department_after_discharge@@emergency_department_accessible_after_discharge
         family_has_way_to_return_to_emergency_department_after_discharge)
     :named REQ5_AUXILIARY1)) ;; "the patient must have a way for the family of the patient to return to the emergency department after discharge"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! patient_has_way_to_return_to_emergency_department_after_discharge
     :named REQ5_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must have a way for the patient to return to the emergency department after discharge"

(assert
  (! family_has_way_to_return_to_emergency_department_after_discharge
     :named REQ5_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must have a way for the family of the patient to return to the emergency department after discharge"

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const family_of_patient_drive_time_to_emergency_medicine_center_in_minutes Real) ;; {"when_to_set_to_value":"Set to the minimum number of minutes required to drive from the residence of any family member of the patient to the center of emergency medicine, if known and documented.","when_to_set_to_null":"Set to null if the drive time is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the minimum drive time in minutes from the residence of any family member of the patient to the center of emergency medicine."} ;; "family of the patient that lives a distance < 30 minutes drive from the center of emergency medicine"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! (< family_of_patient_drive_time_to_emergency_medicine_center_in_minutes 30)
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "family of the patient that lives a distance < 30 minutes drive from the center of emergency medicine"

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const environment_has_exposure_to_tobacco_smoke_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current environment has any exposure to tobacco smoke.","when_to_set_to_false":"Set to false if the patient's current environment has no exposure to tobacco smoke.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current environment has exposure to tobacco smoke.","meaning":"Boolean indicating whether the patient's current environment has any exposure to tobacco smoke."} ;; "live in an environment with NO exposure to tobacco smoke."
(declare-const patient_is_exposed_to_tobacco_smoke_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to tobacco smoke in their environment.","when_to_set_to_false":"Set to false if the patient is currently not exposed to tobacco smoke in their environment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to tobacco smoke.","meaning":"Boolean indicating whether the patient is currently exposed to tobacco smoke."} ;; "live in an environment with NO exposure to tobacco smoke."

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; If the environment has exposure to tobacco smoke, the patient is exposed to tobacco smoke.
(assert
  (! (=> environment_has_exposure_to_tobacco_smoke_now
         patient_is_exposed_to_tobacco_smoke_now)
     :named REQ7_AUXILIARY0)) ;; "live in an environment with NO exposure to tobacco smoke."

;; ===================== Constraint Assertions (REQ 7) =====================
;; The patient must live in an environment with NO exposure to tobacco smoke.
(assert
  (! (not environment_has_exposure_to_tobacco_smoke_now)
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "live in an environment with NO exposure to tobacco smoke."

;; ===================== Declarations for the criterion (REQ 8) =====================
(declare-const family_of_patient_is_available_by_telephone_now Bool) ;; {"when_to_set_to_true":"Set to true if the family of the patient is currently available by telephone.","when_to_set_to_false":"Set to false if the family of the patient is currently not available by telephone.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the family of the patient is currently available by telephone.","meaning":"Boolean indicating whether the family of the patient is currently available by telephone."} ;; "the family of the patient must be available by telephone."

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
  (! family_of_patient_is_available_by_telephone_now
     :named REQ8_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the family of the patient must be available by telephone."

;; ===================== Declarations for the criterion (REQ 9) =====================
(declare-const family_is_ready_for_continuous_monitoring_of_patient_at_home Bool) ;; {"when_to_set_to_true":"Set to true if the family of the patient is ready for continuous monitoring of the patient at home.","when_to_set_to_false":"Set to false if the family of the patient is not ready for continuous monitoring of the patient at home.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the family of the patient is ready for continuous monitoring of the patient at home.","meaning":"Boolean indicating whether the family of the patient is ready for continuous monitoring of the patient at home."} ;; "the family of the patient must be ready for continuous monitoring of the patient at home."

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
  (! family_is_ready_for_continuous_monitoring_of_patient_at_home
     :named REQ9_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the family of the patient must be ready for continuous monitoring of the patient at home."

;; ===================== Declarations for the criterion (REQ 10) =====================
(declare-const patient_respiratory_distress_value_recorded_now_withunit_score Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric respiratory distress severity score is recorded for the patient now.","when_to_set_to_null":"Set to null if no such score is recorded now or the value is indeterminate.","meaning":"Numeric value representing the patient's current respiratory distress severity score."} ;; "respiratory distress severity score < 4"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
  (! (< patient_respiratory_distress_value_recorded_now_withunit_score 4)
     :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must have a respiratory distress severity score < 4."
