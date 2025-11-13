;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "be aged > 18 years"
(declare-const patient_is_able_to_provide_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to provide consent.","when_to_set_to_false":"Set to false if the patient is currently not able to provide consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to provide consent.","meaning":"Boolean indicating whether the patient is currently able to provide consent."} // "be able to provide consent"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (> patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "be aged > 18 years"

(assert
  (! patient_is_able_to_provide_consent_now
     :named REQ0_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "be able to provide consent"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} // "the patient must have a singleton pregnancy"
(declare-const pregnancy_is_singleton_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current pregnancy is a singleton pregnancy (only one fetus present).","when_to_set_to_false":"Set to false if the patient's current pregnancy is not a singleton pregnancy (e.g., multiple fetuses present).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current pregnancy is singleton or not.","meaning":"Boolean indicating whether the patient's current pregnancy is a singleton pregnancy."} // "the patient must have a singleton pregnancy"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (and patient_is_pregnant_now
          pregnancy_is_singleton_now)
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have a singleton pregnancy."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_structural_examination_between_16_and_20_weeks_gestation Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a structural examination and the examination occurred between 16 weeks and 20 weeks of gestation.","when_to_set_to_false":"Set to false if the patient has not undergone a structural examination between 16 weeks and 20 weeks of gestation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a structural examination between 16 weeks and 20 weeks of gestation.","meaning":"Boolean indicating whether the patient has undergone a structural examination between 16 weeks and 20 weeks of gestation."} // "the patient must have had a normal structural examination (between 16 weeks of gestation AND 20 weeks of gestation)"
(declare-const structural_examination_gestation_age_at_exam_in_weeks Real) ;; {"when_to_set_to_value":"Set to the gestational age in weeks at which the structural examination was performed.","when_to_set_to_null":"Set to null if the gestational age at which the structural examination was performed is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the gestational age in weeks at which the structural examination was performed."} // "between 16 weeks of gestation AND 20 weeks of gestation"
(declare-const structural_examination_result_is_normal_between_16_and_20_weeks_gestation Bool) ;; {"when_to_set_to_true":"Set to true if the result of the structural examination performed between 16 weeks and 20 weeks of gestation was normal.","when_to_set_to_false":"Set to false if the result of the structural examination performed between 16 weeks and 20 weeks of gestation was not normal.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the result of the structural examination performed between 16 weeks and 20 weeks of gestation was normal.","meaning":"Boolean indicating whether the result of the structural examination performed between 16 weeks and 20 weeks of gestation was normal."} // "the patient must have had a normal structural examination (between 16 weeks of gestation AND 20 weeks of gestation)"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Definition: patient has structural examination between 16 and 20 weeks gestation if there was an exam and the gestational age at exam is within [16, 20]
(assert
  (! (= patient_has_structural_examination_between_16_and_20_weeks_gestation
        (and (<= 16.0 structural_examination_gestation_age_at_exam_in_weeks)
             (<= structural_examination_gestation_age_at_exam_in_weeks 20.0)))
     :named REQ2_AUXILIARY0)) ;; "between 16 weeks of gestation AND 20 weeks of gestation"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Inclusion: patient must have had a normal structural examination between 16 and 20 weeks gestation
(assert
  (! (and patient_has_structural_examination_between_16_and_20_weeks_gestation
          structural_examination_result_is_normal_between_16_and_20_weeks_gestation)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must have had a normal structural examination (between 16 weeks of gestation AND 20 weeks of gestation)"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const pregnancy_duration_value_recorded_now_in_weeks Real) ;; {"when_to_set_to_value":"Set to the value of the patient's current pregnancy duration in weeks of gestation, as determined at the time of assessment.","when_to_set_to_null":"Set to null if the patient's current pregnancy duration in weeks of gestation is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current pregnancy duration in weeks of gestation."} // "gestation ≥ 18 weeks of gestation AND ≤ 34 weeks of gestation"
(declare-const pregnancy_duration_value_recorded_now_in_weeks@@determined_by_ultrasound_verification Bool) ;; {"when_to_set_to_true":"Set to true if the pregnancy duration value is determined by ultrasound verification.","when_to_set_to_false":"Set to false if the pregnancy duration value is not determined by ultrasound verification.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the pregnancy duration value is determined by ultrasound verification.","meaning":"Boolean indicating whether the pregnancy duration value is determined by ultrasound verification."} // "pregnancy duration determined by ultrasound verification"
(declare-const pregnancy_duration_value_recorded_now_in_weeks@@ultrasound_performed_within_20th_week_of_gestation Bool) ;; {"when_to_set_to_true":"Set to true if the ultrasound used to determine pregnancy duration was performed within the 20th week of gestation.","when_to_set_to_false":"Set to false if the ultrasound used to determine pregnancy duration was not performed within the 20th week of gestation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the ultrasound used to determine pregnancy duration was performed within the 20th week of gestation.","meaning":"Boolean indicating whether the ultrasound used to determine pregnancy duration was performed within the 20th week of gestation."} // "ultrasound verification within the 20th week of gestation"
(declare-const patient_has_undergone_ultrasonography_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone ultrasonography (ultrasound) in the past, regardless of timing.","when_to_set_to_false":"Set to false if the patient has never undergone ultrasonography (ultrasound) in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone ultrasonography (ultrasound) in the past.","meaning":"Boolean indicating whether the patient has ever undergone ultrasonography (ultrasound) in the past."} // "ultrasound"
(declare-const patient_has_undergone_ultrasonography_inthehistory@@performed_within_20th_week_of_gestation Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone ultrasonography (ultrasound) and the procedure was performed within the 20th week of gestation.","when_to_set_to_false":"Set to false if the patient has undergone ultrasonography but the procedure was not performed within the 20th week of gestation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the ultrasonography was performed within the 20th week of gestation.","meaning":"Boolean indicating whether the ultrasonography was performed within the 20th week of gestation."} // "ultrasound performed within the 20th week of gestation"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies stem variable
(assert
  (! (=> pregnancy_duration_value_recorded_now_in_weeks@@determined_by_ultrasound_verification
         (and (exists ((v Real)) (= v pregnancy_duration_value_recorded_now_in_weeks)))
              )
     :named REQ3_AUXILIARY0)) ;; "pregnancy duration determined by ultrasound verification"

;; Qualifier variable implies stem variable
(assert
  (! (=> pregnancy_duration_value_recorded_now_in_weeks@@ultrasound_performed_within_20th_week_of_gestation
         (exists ((v Real)) (= v pregnancy_duration_value_recorded_now_in_weeks)))
     :named REQ3_AUXILIARY1)) ;; "ultrasound performed within the 20th week of gestation"

;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_undergone_ultrasonography_inthehistory@@performed_within_20th_week_of_gestation
         patient_has_undergone_ultrasonography_inthehistory)
     :named REQ3_AUXILIARY2)) ;; "ultrasound performed within the 20th week of gestation"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: gestation ≥ 18 weeks AND ≤ 34 weeks
(assert
  (! (and (>= pregnancy_duration_value_recorded_now_in_weeks 18.0)
          (<= pregnancy_duration_value_recorded_now_in_weeks 34.0))
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "gestation ≥ 18 weeks of gestation AND ≤ 34 weeks of gestation"

;; Component 1: pregnancy duration determined by ultrasound verification within the 20th week of gestation
(assert
  (! (and pregnancy_duration_value_recorded_now_in_weeks@@determined_by_ultrasound_verification
          pregnancy_duration_value_recorded_now_in_weeks@@ultrasound_performed_within_20th_week_of_gestation)
     :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "pregnancy duration determined by ultrasound verification within the 20th week of gestation"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_undergone_ultrasonography_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone ultrasonography at the time of presentation.","when_to_set_to_false":"Set to false if the patient has not undergone ultrasonography at the time of presentation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone ultrasonography at the time of presentation.","meaning":"Boolean indicating whether the patient has undergone ultrasonography at the time of presentation."} // "ultrasound examinations at the presentation"
(declare-const patient_has_undergone_ultrasonography_now@@for_confirmation Bool) ;; {"when_to_set_to_true":"Set to true if the ultrasonography at presentation was performed for confirmation.","when_to_set_to_false":"Set to false if the ultrasonography at presentation was not performed for confirmation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the ultrasonography at presentation was performed for confirmation.","meaning":"Boolean indicating whether the ultrasonography at presentation was performed for confirmation."} // "for confirmation"
(declare-const patient_has_undergone_ultrasonography_now@@for_diagnosis_of_persistent_oligohydramnios Bool) ;; {"when_to_set_to_true":"Set to true if the ultrasonography at presentation was performed for the diagnosis of persistent oligohydramnios.","when_to_set_to_false":"Set to false if the ultrasonography at presentation was not performed for the diagnosis of persistent oligohydramnios.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the ultrasonography at presentation was performed for the diagnosis of persistent oligohydramnios.","meaning":"Boolean indicating whether the ultrasonography at presentation was performed for the diagnosis of persistent oligohydramnios."} // "for the diagnosis of persistent oligohydramnios"
(declare-const patient_ultrasound_examination_count_at_presentation Real) ;; {"when_to_set_to_value":"Set to the total number of ultrasound examinations the patient has undergone at the time of presentation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many ultrasound examinations the patient has undergone at the time of presentation.","meaning":"Numeric variable indicating the total number of ultrasound examinations the patient has undergone at the time of presentation."} // "≥ 2 ultrasound examinations at the presentation"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variables imply the stem variable (ultrasonography at presentation)
(assert
  (! (=> patient_has_undergone_ultrasonography_now@@for_confirmation
         patient_has_undergone_ultrasonography_now)
     :named REQ4_AUXILIARY0)) ;; "ultrasonography at presentation for confirmation"

(assert
  (! (=> patient_has_undergone_ultrasonography_now@@for_diagnosis_of_persistent_oligohydramnios
         patient_has_undergone_ultrasonography_now)
     :named REQ4_AUXILIARY1)) ;; "ultrasonography at presentation for diagnosis of persistent oligohydramnios"

;; ===================== Constraint Assertions (REQ 4) =====================
;; The patient must have had at least 2 ultrasound examinations at the presentation, for confirmation AND for the diagnosis of persistent oligohydramnios
(assert
  (! (and (>= patient_ultrasound_examination_count_at_presentation 2)
          patient_has_undergone_ultrasonography_now@@for_confirmation
          patient_has_undergone_ultrasonography_now@@for_diagnosis_of_persistent_oligohydramnios)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "≥ 2 ultrasound examinations at the presentation for confirmation AND for the diagnosis of persistent oligohydramnios"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_is_undergoing_ultrasonography_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing ultrasonography (ultrasound examinations).","when_to_set_to_false":"Set to false if the patient is currently not undergoing ultrasonography (ultrasound examinations).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing ultrasonography.","meaning":"Boolean indicating whether the patient is currently undergoing ultrasonography (ultrasound examinations)."} // "the patient must undergo follow up ultrasound examinations"
(declare-const patient_is_undergoing_ultrasonography_now@@performed_weekly Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing ultrasonography and the procedure is performed weekly.","when_to_set_to_false":"Set to false if the patient is currently undergoing ultrasonography but the procedure is not performed weekly.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the procedure is performed weekly.","meaning":"Boolean indicating whether the patient's current ultrasonography is performed weekly."} // "the patient must undergo follow up ultrasound examinations weekly"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_is_undergoing_ultrasonography_now@@performed_weekly
         patient_is_undergoing_ultrasonography_now)
     :named REQ5_AUXILIARY0)) ;; "the patient must undergo follow up ultrasound examinations weekly"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! patient_is_undergoing_ultrasonography_now@@performed_weekly
     :named REQ5_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must undergo follow up ultrasound examinations weekly"
