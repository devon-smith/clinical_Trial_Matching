;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "aged ≥ 18 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18.0)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be aged ≥ 18 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_systolic_hypertension_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of systolic hypertension.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of systolic hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of systolic hypertension.","meaning":"Boolean indicating whether the patient currently has systolic hypertension."} ;; "systolic hypertension"
(declare-const patient_has_finding_of_systolic_hypertension_now@@stage_ii Bool) ;; {"when_to_set_to_true":"Set to true if the patient's systolic hypertension is specifically classified as stage II.","when_to_set_to_false":"Set to false if the patient's systolic hypertension is not classified as stage II.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's systolic hypertension is stage II.","meaning":"Boolean indicating whether the patient's systolic hypertension is specifically stage II."} ;; "stage II systolic hypertension"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_systolic_hypertension_now@@stage_ii
         patient_has_finding_of_systolic_hypertension_now)
     :named REQ1_AUXILIARY0)) ;; "stage II systolic hypertension" implies "systolic hypertension"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must have stage II systolic hypertension.
(assert
  (! patient_has_finding_of_systolic_hypertension_now@@stage_ii
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have stage II systolic hypertension."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female (male or other) at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Indicates whether the patient's sex is female at the current time."} ;; "if the patient is female"
(declare-const serum_pregnancy_test_result_at_screening Bool) ;; {"when_to_set_to_true":"Set to true if the serum pregnancy test result at screening is negative.","when_to_set_to_false":"Set to false if the serum pregnancy test result at screening is not negative.","when_to_set_to_null":"Set to null if the serum pregnancy test result at screening is unknown, not documented, or cannot be determined.","meaning":"Boolean indicating whether the serum pregnancy test result at screening is negative."} ;; "negative serum pregnancy test at screening"
(declare-const patient_is_postmenopausal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently post-menopausal.","when_to_set_to_false":"Set to false if the patient is not currently post-menopausal.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently post-menopausal.","meaning":"Boolean indicating whether the patient is currently post-menopausal."} ;; "be post-menopausal"
(declare-const patient_has_undergone_hysterectomy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a hysterectomy at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone a hysterectomy at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a hysterectomy.","meaning":"Boolean indicating whether the patient has ever undergone a hysterectomy."} ;; "have had a hysterectomy"
(declare-const patient_has_undergone_ligation_of_fallopian_tube_before_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone ligation of the fallopian tube (tubal ligation) before the time of consent.","when_to_set_to_false":"Set to false if the patient has not undergone ligation of the fallopian tube (tubal ligation) before the time of consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone ligation of the fallopian tube (tubal ligation) before the time of consent.","meaning":"Boolean indicating whether the patient has undergone ligation of the fallopian tube (tubal ligation) before the time of consent."} ;; "have had a tubal ligation ≥ 6 months before consent"
(declare-const time_since_patient_ligation_of_fallopian_tube_before_consent_in_months Real) ;; {"when_to_set_to_value":"Set to the number of months since the patient underwent ligation of the fallopian tube (tubal ligation) before the time of consent.","when_to_set_to_null":"Set to null if the number of months since tubal ligation before consent is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the number of months since the patient underwent ligation of the fallopian tube (tubal ligation) before the time of consent."} ;; "tubal ligation ≥ 6 months before consent"
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has childbearing potential (i.e., is not post-menopausal, has not had a hysterectomy, and has not had a tubal ligation ≥ 6 months before consent).","when_to_set_to_false":"Set to false if the patient does not have childbearing potential (i.e., is post-menopausal, has had a hysterectomy, or has had a tubal ligation ≥ 6 months before consent).","when_to_set_to_null":"Set to null if the patient's childbearing potential status is unknown, not documented, or cannot be determined.","meaning":"Indicates whether the patient currently has childbearing potential."} ;; "be of childbearing potential"
(declare-const patient_is_practicing_approved_birth_control_measures_throughout_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient is practicing approved measures of birth control throughout the study.","when_to_set_to_false":"Set to false if the patient is not practicing approved measures of birth control throughout the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is practicing approved measures of birth control throughout the study.","meaning":"Boolean indicating whether the patient is practicing approved measures of birth control throughout the study."} ;; "practice approved measures of birth control throughout the study"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Tubal ligation ≥ 6 months before consent
(assert
  (! (= patient_has_undergone_ligation_of_fallopian_tube_before_consent
        (and patient_has_undergone_ligation_of_fallopian_tube_before_consent
             (>= time_since_patient_ligation_of_fallopian_tube_before_consent_in_months 6.0)))
     :named REQ2_AUXILIARY0)) ;; "have had a tubal ligation ≥ 6 months before consent"

;; Childbearing potential definition (as per requirement)
(assert
  (! (= patient_has_childbearing_potential_now
        (and (not patient_is_postmenopausal_now)
             (not patient_has_undergone_hysterectomy_inthehistory)
             (not patient_has_undergone_ligation_of_fallopian_tube_before_consent)))
     :named REQ2_AUXILIARY1)) ;; "be of childbearing potential"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: If female, must have negative serum pregnancy test at screening
(assert
  (! (or (not patient_sex_is_female_now)
         serum_pregnancy_test_result_at_screening)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "if the patient is female, the patient must have a negative serum pregnancy test at screening"

;; Component 1: If female, must satisfy one of the following: post-menopausal OR hysterectomy OR tubal ligation ≥ 6 months before consent OR (childbearing potential AND practicing birth control)
(assert
  (! (or (not patient_sex_is_female_now)
         (or patient_is_postmenopausal_now
             patient_has_undergone_hysterectomy_inthehistory
             patient_has_undergone_ligation_of_fallopian_tube_before_consent
             (and patient_has_childbearing_potential_now
                  patient_is_practicing_approved_birth_control_measures_throughout_study)))
     :named REQ2_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "if the patient is female, the patient must ((be post-menopausal) OR (have had a hysterectomy) OR (have had a tubal ligation ≥ 6 months before consent) OR ((be of childbearing potential) AND (practice approved measures of birth control throughout the study)))"
