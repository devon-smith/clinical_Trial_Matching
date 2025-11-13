;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_cytomegalovirus_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of cytomegalovirus infection.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of cytomegalovirus infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of cytomegalovirus infection.","meaning":"Boolean indicating whether the patient currently has a diagnosis of cytomegalovirus infection."}  ;; "diagnosis of primary maternal cytomegalovirus infection"
(declare-const patient_has_diagnosis_of_cytomegalovirus_infection_now@@primary Bool) ;; {"when_to_set_to_true":"Set to true if the cytomegalovirus infection diagnosis is primary.","when_to_set_to_false":"Set to false if the cytomegalovirus infection diagnosis is not primary.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the cytomegalovirus infection diagnosis is primary.","meaning":"Boolean indicating whether the cytomegalovirus infection diagnosis is primary."}  ;; "primary"
(declare-const patient_has_diagnosis_of_cytomegalovirus_infection_now@@maternal Bool) ;; {"when_to_set_to_true":"Set to true if the cytomegalovirus infection diagnosis is maternal (pertains to the mother).","when_to_set_to_false":"Set to false if the cytomegalovirus infection diagnosis is not maternal.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the cytomegalovirus infection diagnosis is maternal.","meaning":"Boolean indicating whether the cytomegalovirus infection diagnosis is maternal."}  ;; "maternal"
(declare-const patients_cytomegalovirus_igm_antibody_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a positive cytomegalovirus immunoglobulin M antibody result.","when_to_set_to_false":"Set to false if the patient currently does not have a positive cytomegalovirus immunoglobulin M antibody result.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a positive cytomegalovirus immunoglobulin M antibody result.","meaning":"Boolean indicating whether the patient currently has a positive cytomegalovirus immunoglobulin M antibody result."}  ;; "a positive cytomegalovirus immunoglobulin M antibody"
(declare-const patients_cytomegalovirus_igg_is_abnormal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an abnormal cytomegalovirus immunoglobulin G antibody result.","when_to_set_to_false":"Set to false if the patient currently does not have an abnormal cytomegalovirus immunoglobulin G antibody result.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an abnormal cytomegalovirus immunoglobulin G antibody result.","meaning":"Boolean indicating whether the patient currently has an abnormal cytomegalovirus immunoglobulin G antibody result."}  ;; "cytomegalovirus immunoglobulin G antibody"
(declare-const patients_cytomegalovirus_igg_is_abnormal_now@@low_avidity Bool) ;; {"when_to_set_to_true":"Set to true if the abnormal cytomegalovirus immunoglobulin G antibody result is specifically low-avidity.","when_to_set_to_false":"Set to false if the abnormal cytomegalovirus immunoglobulin G antibody result is not low-avidity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the abnormal cytomegalovirus immunoglobulin G antibody result is low-avidity.","meaning":"Boolean indicating whether the abnormal cytomegalovirus immunoglobulin G antibody result is low-avidity."}  ;; "low-avidity maternal cytomegalovirus immunoglobulin G antibody screen"
(declare-const patient_has_evidence_of_maternal_seroconversion_to_cytomegalovirus_igg_now Bool) ;; {"when_to_set_to_true":"Set to true if there is evidence that the patient (mother) has seroconverted to cytomegalovirus immunoglobulin G antibody at the current time, following a prior negative cytomegalovirus screen.","when_to_set_to_false":"Set to false if there is evidence that the patient (mother) has not seroconverted to cytomegalovirus immunoglobulin G antibody at the current time, or if there is no evidence of seroconversion following a prior negative cytomegalovirus screen.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether there is evidence of maternal seroconversion to cytomegalovirus immunoglobulin G antibody at the current time following a prior negative cytomegalovirus screen.","meaning":"Boolean indicating whether there is evidence that the patient (mother) has seroconverted to cytomegalovirus immunoglobulin G antibody at the current time, following a prior negative cytomegalovirus screen."}  ;; "evidence of maternal seroconversion with development of cytomegalovirus immunoglobulin G antibody following a prior negative cytomegalovirus screen"
(declare-const patients_cytomegalovirus_igg_antibody_was_negative_in_the_past Bool) ;; {"when_to_set_to_true":"Set to true if the patient's cytomegalovirus immunoglobulin G antibody was negative in the past.","when_to_set_to_false":"Set to false if the patient's cytomegalovirus immunoglobulin G antibody was not negative in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's cytomegalovirus immunoglobulin G antibody was negative in the past.","meaning":"Boolean indicating whether the patient's cytomegalovirus immunoglobulin G antibody was negative in the past."}  ;; "prior negative cytomegalovirus screen"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_diagnosis_of_cytomegalovirus_infection_now@@primary
         patient_has_diagnosis_of_cytomegalovirus_infection_now)
     :named REQ0_AUXILIARY0)) ;; "primary"

(assert
  (! (=> patient_has_diagnosis_of_cytomegalovirus_infection_now@@maternal
         patient_has_diagnosis_of_cytomegalovirus_infection_now)
     :named REQ0_AUXILIARY1)) ;; "maternal"

(assert
  (! (=> patients_cytomegalovirus_igg_is_abnormal_now@@low_avidity
         patients_cytomegalovirus_igg_is_abnormal_now)
     :named REQ0_AUXILIARY2)) ;; "low-avidity maternal cytomegalovirus immunoglobulin G antibody screen"

;; ===================== Constraint Assertions (REQ 0) =====================
;; The patient must have a diagnosis of primary maternal cytomegalovirus infection on the basis of:
;; (at least one of the following:
;;   (a positive cytomegalovirus IgM antibody AND a low-avidity maternal cytomegalovirus IgG antibody screen)
;;   OR
;;   (evidence of maternal seroconversion with development of cytomegalovirus IgG antibody following a prior negative cytomegalovirus screen)
;; )
(assert
  (! (and patient_has_diagnosis_of_cytomegalovirus_infection_now@@primary
          patient_has_diagnosis_of_cytomegalovirus_infection_now@@maternal
          (or (and patients_cytomegalovirus_igm_antibody_is_positive_now
                   patients_cytomegalovirus_igg_is_abnormal_now@@low_avidity)
              (and patient_has_evidence_of_maternal_seroconversion_to_cytomegalovirus_igg_now
                   patients_cytomegalovirus_igg_antibody_was_negative_in_the_past)))
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "diagnosis of primary maternal cytomegalovirus infection on the basis of (at least one of the following: (a positive cytomegalovirus immunoglobulin M antibody AND a low-avidity maternal cytomegalovirus immunoglobulin G antibody screen) OR (evidence of maternal seroconversion with development of cytomegalovirus immunoglobulin G antibody following a prior negative cytomegalovirus screen))"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const gestational_age_at_randomization_value_in_days Real) ;; {"when_to_set_to_value":"Set to the number of days of gestational age at the time of randomization, regardless of method of determination.","when_to_set_to_null":"Set to null if the gestational age at randomization is unknown, not documented, or cannot be determined.","meaning":"Numeric value (in days) of gestational age at randomization, regardless of method of determination."} ;; "gestational age at randomization"
(declare-const gestational_age_at_randomization_value_in_days_based_on_clinical_info_and_earliest_ultrasound Real) ;; {"when_to_set_to_value":"Set to the number of days of gestational age at the time of randomization, as determined by clinical information and the earliest ultrasound.","when_to_set_to_null":"Set to null if the gestational age at randomization based on clinical information and earliest ultrasound is unknown, not documented, or cannot be determined.","meaning":"Numeric value (in days) of gestational age at randomization, determined by clinical information and earliest ultrasound."} ;; "gestational age at randomization based on clinical information AND evaluation of the earliest ultrasound"
(declare-const patient_has_undergone_ultrasonography_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone ultrasonography at any time in the history.","when_to_set_to_false":"Set to false if the patient has not undergone ultrasonography at any time in the history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone ultrasonography in the history.","meaning":"Boolean indicating whether the patient has undergone ultrasonography at any time in the history."} ;; "ultrasound"
(declare-const patient_has_undergone_ultrasonography_inthehistory@@is_earliest_ultrasound Bool) ;; {"when_to_set_to_true":"Set to true if the ultrasonography is the earliest one performed in the patient's history.","when_to_set_to_false":"Set to false if the ultrasonography is not the earliest one performed in the patient's history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the ultrasonography is the earliest one performed.","meaning":"Boolean indicating whether the ultrasonography is the earliest one performed in the patient's history."} ;; "earliest ultrasound"
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown or cannot be determined.","meaning":"Indicates whether the patient is currently pregnant."} ;; "patient is pregnant"
(declare-const patients_cytomegalovirus_igg_antibody_was_negative_before_23_weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient's cytomegalovirus IgG antibody was negative on an initial screening performed before 23 weeks gestational age.","when_to_set_to_false":"Set to false if the patient's cytomegalovirus IgG antibody was not negative on an initial screening performed before 23 weeks gestational age.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's cytomegalovirus IgG antibody was negative on an initial screening performed before 23 weeks gestational age.","meaning":"Boolean indicating whether the patient's cytomegalovirus IgG antibody was negative on an initial screening performed before 23 weeks gestational age."} ;; "negative cytomegalovirus IgG antibody initially screened before 23 weeks"
(declare-const patients_cytomegalovirus_igg_antibody_was_rescreened_after_2_to_4_weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient's cytomegalovirus IgG antibody was rescreened after 2 to 4 weeks from the initial screening.","when_to_set_to_false":"Set to false if the patient's cytomegalovirus IgG antibody was not rescreened after 2 to 4 weeks from the initial screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's cytomegalovirus IgG antibody was rescreened after 2 to 4 weeks from the initial screening.","meaning":"Boolean indicating whether the patient's cytomegalovirus IgG antibody was rescreened after 2 to 4 weeks from the initial screening."} ;; "rescreened after 2-4 weeks"
(declare-const patients_cytomegalovirus_igm_antibody_was_positive_before_23_weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient's cytomegalovirus IgM antibody was positive on an initial screening performed before 23 weeks gestational age.","when_to_set_to_false":"Set to false if the patient's cytomegalovirus IgM antibody was not positive on an initial screening performed before 23 weeks gestational age.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's cytomegalovirus IgM antibody was positive on an initial screening performed before 23 weeks gestational age.","meaning":"Boolean indicating whether the patient's cytomegalovirus IgM antibody was positive on an initial screening performed before 23 weeks gestational age."} ;; "positive cytomegalovirus IgM antibody initially screened before 23 weeks"
(assert
  (! (=> patient_has_undergone_ultrasonography_inthehistory@@is_earliest_ultrasound
         patient_has_undergone_ultrasonography_inthehistory)
     :named REQ1_AUXILIARY0)) ;; "evaluation of the earliest ultrasound"

;; Gestational age in days for 23 weeks 6 days and 27 weeks 6 days
(define-fun gestational_age_23w6d_in_days () Real 167.0) ;; 23*7 + 6 = 167 days ;; "23 weeks 6 days"
(define-fun gestational_age_27w6d_in_days () Real 195.0) ;; 27*7 + 6 = 195 days ;; "27 weeks 6 days"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: (gestational age at randomization ≤ 23w6d based on clinical info AND evaluation of the earliest ultrasound)
;; OR
;; (gestational age at randomization ≤ 27w6d AND positive CMV IgM AND negative CMV IgG initially screened before 23w AND rescreened after 2-4 weeks AND evidence of CMV IgG seroconversion)

(assert
  (! (or
        ;; First branch: gestational age at randomization ≤ 23w6d based on clinical info AND evaluation of the earliest ultrasound
        (and
          (<= gestational_age_at_randomization_value_in_days_based_on_clinical_info_and_earliest_ultrasound gestational_age_23w6d_in_days)
          patient_is_pregnant_now
          patient_has_undergone_ultrasonography_inthehistory@@is_earliest_ultrasound
        )
        ;; Second branch: gestational age at randomization ≤ 27w6d AND all serologic criteria
        (and
          (<= gestational_age_at_randomization_value_in_days gestational_age_27w6d_in_days)
          patient_is_pregnant_now
          patients_cytomegalovirus_igm_antibody_was_positive_before_23_weeks
          patients_cytomegalovirus_igg_antibody_was_negative_before_23_weeks
          patients_cytomegalovirus_igg_antibody_was_rescreened_after_2_to_4_weeks
          patient_has_evidence_of_maternal_seroconversion_to_cytomegalovirus_igg_now
        )
     )
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (gestational age at randomization ≤ 23 weeks 6 days based on clinical information AND evaluation of the earliest ultrasound) OR ((gestational age at randomization ≤ 27 weeks 6 days) AND (a positive cytomegalovirus immunoglobulin M antibody AND a negative cytomegalovirus immunoglobulin G antibody initially screened before 23 weeks AND rescreened after 2-4 weeks AND evidence of cytomegalovirus immunoglobulin G antibody seroconversion))."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_fetal_gestational_age_value_recorded_now_withunit_weeks Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current fetal gestational age in weeks is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current fetal gestational age in weeks."} ;; "gestational age"
(declare-const patient_has_singleton_pregnancy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a singleton pregnancy.","when_to_set_to_false":"Set to false if the patient currently does not have a singleton pregnancy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a singleton pregnancy.","meaning":"Boolean indicating whether the patient currently has a singleton pregnancy."} ;; "singleton pregnancy"
(declare-const patient_has_twin_pregnancy_reduced_to_singleton_pregnancy_before_14_weeks_by_project_gestational_age_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a history of twin pregnancy that was reduced to a singleton pregnancy (either spontaneously or therapeutically) before 14 weeks by project gestational age.","when_to_set_to_false":"Set to false if the patient does not have a history of twin pregnancy reduced to singleton pregnancy before 14 weeks by project gestational age.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of twin pregnancy reduced to singleton pregnancy before 14 weeks by project gestational age.","meaning":"Boolean indicating whether the patient currently has a history of twin pregnancy reduced to singleton pregnancy before 14 weeks by project gestational age."} ;; "a twin pregnancy reduced to a singleton pregnancy (either spontaneously OR therapeutically) before 14 weeks by project gestational age"
(declare-const patient_has_twin_pregnancy_reduced_to_singleton_pregnancy_before_14_weeks_by_project_gestational_age_now@@reduction_spontaneous_or_therapeutic Bool) ;; {"when_to_set_to_true":"Set to true if the reduction from twin pregnancy to singleton pregnancy occurred either spontaneously or therapeutically.","when_to_set_to_false":"Set to false if the reduction did not occur spontaneously or therapeutically.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the reduction occurred spontaneously or therapeutically.","meaning":"Boolean indicating whether the reduction from twin pregnancy to singleton pregnancy occurred either spontaneously or therapeutically."} ;; "either spontaneously OR therapeutically"
(declare-const patient_has_twin_pregnancy_reduced_to_singleton_pregnancy_before_14_weeks_by_project_gestational_age_now@@before_14_weeks_by_project_gestational_age Bool) ;; {"when_to_set_to_true":"Set to true if the reduction from twin pregnancy to singleton pregnancy occurred before 14 weeks by project gestational age.","when_to_set_to_false":"Set to false if the reduction occurred at or after 14 weeks by project gestational age.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the reduction occurred before 14 weeks by project gestational age.","meaning":"Boolean indicating whether the reduction from twin pregnancy to singleton pregnancy occurred before 14 weeks by project gestational age."} ;; "before 14 weeks by project gestational age"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_twin_pregnancy_reduced_to_singleton_pregnancy_before_14_weeks_by_project_gestational_age_now@@reduction_spontaneous_or_therapeutic
        patient_has_twin_pregnancy_reduced_to_singleton_pregnancy_before_14_weeks_by_project_gestational_age_now)
     :named REQ2_AUXILIARY0)) ;; "either spontaneously OR therapeutically"

(assert
  (! (=> patient_has_twin_pregnancy_reduced_to_singleton_pregnancy_before_14_weeks_by_project_gestational_age_now@@before_14_weeks_by_project_gestational_age
        patient_has_twin_pregnancy_reduced_to_singleton_pregnancy_before_14_weeks_by_project_gestational_age_now)
     :named REQ2_AUXILIARY1)) ;; "before 14 weeks by project gestational age"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: To be included, the patient must have a singleton pregnancy OR (a twin pregnancy reduced to a singleton pregnancy (either spontaneously OR therapeutically) before 14 weeks by project gestational age).
(assert
  (! (or patient_has_singleton_pregnancy_now
         patient_has_twin_pregnancy_reduced_to_singleton_pregnancy_before_14_weeks_by_project_gestational_age_now)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a singleton pregnancy OR (a twin pregnancy reduced to a singleton pregnancy (either spontaneously OR therapeutically) before 14 weeks by project gestational age)."
