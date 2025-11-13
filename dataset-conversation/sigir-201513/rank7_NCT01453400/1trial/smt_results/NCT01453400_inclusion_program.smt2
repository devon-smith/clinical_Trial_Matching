;; ===================== Declarations for the inclusion criteria (REQ 0) =====================
(declare-const patient_is_healthy_subject_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently documented as a healthy subject.","when_to_set_to_false":"Set to false if the patient is currently documented as not a healthy subject.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a healthy subject.","meaning":"Boolean indicating whether the patient is currently a healthy subject."}  ;; "To be included, the patient must be a healthy subject."
(declare-const patient_is_ambulatory_subject_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently documented as an ambulatory subject.","when_to_set_to_false":"Set to false if the patient is currently documented as not an ambulatory subject.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently an ambulatory subject.","meaning":"Boolean indicating whether the patient is currently an ambulatory subject."}  ;; "To be included, the patient must be an ambulatory subject."
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as male.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not male (e.g., female or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently male."}  ;; "be a male subject"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female (e.g., male or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently female."}  ;; "be a female subject"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "be at least 18 years of age"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: The patient must be a healthy subject.
(assert
  (! patient_is_healthy_subject_now
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be a healthy subject."

;; Component 1: The patient must be an ambulatory subject.
(assert
  (! patient_is_ambulatory_subject_now
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be an ambulatory subject."

;; Component 2: The patient must ((be a male subject) OR (be a female subject AND be at least 18 years of age)).
(assert
  (! (or patient_sex_is_male_now
         (and patient_sex_is_female_now (>= patient_age_value_recorded_now_in_years 18)))
     :named REQ0_COMPONENT2_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must ((be a male subject) OR (be a female subject AND be at least 18 years of age))."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_sore_throat_symptom_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of sore throat symptom.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of sore throat symptom.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of sore throat symptom.","meaning":"Boolean indicating whether the patient currently has sore throat symptom."}  ;; "To be included, the patient must have a sore throat due to upper respiratory tract infection."
(declare-const patient_has_finding_of_sore_throat_symptom_now@@due_to_upper_respiratory_tract_infection Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sore throat symptom is due to upper respiratory tract infection.","when_to_set_to_false":"Set to false if the patient's current sore throat symptom is not due to upper respiratory tract infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current sore throat symptom is due to upper respiratory tract infection.","meaning":"Boolean indicating whether the patient's current sore throat symptom is due to upper respiratory tract infection."}  ;; "To be included, the patient must have a sore throat due to upper respiratory tract infection."

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies the stem variable (if sore throat is due to URI, then sore throat is present)
(assert
  (! (=> patient_has_finding_of_sore_throat_symptom_now@@due_to_upper_respiratory_tract_infection
         patient_has_finding_of_sore_throat_symptom_now)
     :named REQ1_AUXILIARY0)) ;; "To be included, the patient must have a sore throat due to upper respiratory tract infection."

;; ===================== Constraint Assertions (REQ 1) =====================
;; The patient must have a sore throat due to upper respiratory tract infection
(assert
  (! patient_has_finding_of_sore_throat_symptom_now@@due_to_upper_respiratory_tract_infection
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a sore throat due to upper respiratory tract infection."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const onset_of_sore_throat_pain_to_screening_period_start_value_in_days Real) ;; {"when_to_set_to_value":"Set to the number of days between the onset of sore throat pain and the start of the screening period, if both dates are known.","when_to_set_to_null":"Set to null if either the onset date of sore throat pain or the start date of the screening period is unknown, not documented, or cannot be determined.","meaning":"Numeric value (in days) representing the interval between the onset of sore throat pain and the start of the screening period."}  ;; "onset of sore throat pain within six days of the screening period."
(declare-const patient_has_finding_of_pain_in_throat_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had pain in throat (sore throat pain) at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had pain in throat (sore throat pain) in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had pain in throat (sore throat pain) in their history.","meaning":"Boolean indicating whether the patient has ever had pain in throat (sore throat pain) in their history."}  ;; "sore throat pain"
(declare-const patient_has_finding_of_pain_in_throat_inthehistory@@temporalcontext_within6days_before_screening_period_onset Bool) ;; {"when_to_set_to_true":"Set to true if the onset of sore throat pain occurred within six days before the screening period.","when_to_set_to_false":"Set to false if the onset of sore throat pain did not occur within six days before the screening period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the onset of sore throat pain occurred within six days before the screening period.","meaning":"Boolean indicating whether the onset of sore throat pain occurred within six days before the screening period."}  ;; "onset of sore throat pain within six days of the screening period."

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Definition: The temporal context qualifier is true iff the onset interval is within 6 days
(assert
  (! (= patient_has_finding_of_pain_in_throat_inthehistory@@temporalcontext_within6days_before_screening_period_onset
        (and patient_has_finding_of_pain_in_throat_inthehistory
             (<= onset_of_sore_throat_pain_to_screening_period_start_value_in_days 6.0)))
     :named REQ2_AUXILIARY0)) ;; "onset of sore throat pain within six days of the screening period."

;; Qualifier variable implies the stem variable
(assert
  (! (=> patient_has_finding_of_pain_in_throat_inthehistory@@temporalcontext_within6days_before_screening_period_onset
         patient_has_finding_of_pain_in_throat_inthehistory)
     :named REQ2_AUXILIARY1)) ;; "onset of sore throat pain within six days of the screening period."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_finding_of_pain_in_throat_inthehistory@@temporalcontext_within6days_before_screening_period_onset
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have onset of sore throat pain within six days of the screening period."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_baseline_sore_throat_pain_intensity_value_recorded_baseline_withunit_millimeters Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's baseline sore throat pain intensity score, measured in millimeters, as recorded at baseline.","when_to_set_to_null":"Set to null if the patient's baseline sore throat pain intensity score in millimeters is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's baseline sore throat pain intensity score in millimeters, recorded at baseline."} ;; "baseline sore throat pain intensity score ≥ 60 millimeters on the sore throat pain intensity scale."
(declare-const patients_pain_intensity_is_positive_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a positive pain intensity finding in their history.","when_to_set_to_false":"Set to false if the patient has never had a positive pain intensity finding in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a positive pain intensity finding in their history.","meaning":"Boolean indicating whether the patient has ever had a positive pain intensity finding in their history."} ;; "pain intensity"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (>= patient_baseline_sore_throat_pain_intensity_value_recorded_baseline_withunit_millimeters 60.0)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "baseline sore throat pain intensity score ≥ 60 millimeters on the sore throat pain intensity scale."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const tonsillopharyngitis_assessment_score_value_recorded_now_withunit_points Real) ;; {"when_to_set_to_value":"Set to the numeric value of the tonsillopharyngitis assessment score recorded for the patient at the current time, in points.","when_to_set_to_null":"Set to null if the tonsillopharyngitis assessment score is unknown, not documented, or cannot be determined for the patient at the current time.","meaning":"Numeric value representing the tonsillopharyngitis assessment score recorded now, in points."}  ;; "To be included, the patient must have a score ≥ 5 on the tonsillopharyngitis assessment."

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (>= tonsillopharyngitis_assessment_score_value_recorded_now_withunit_points 5)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a score ≥ 5 on the tonsillopharyngitis assessment."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently capable of becoming pregnant (i.e., has childbearing potential).","when_to_set_to_false":"Set to false if the patient is currently not capable of becoming pregnant (i.e., does not have childbearing potential).","when_to_set_to_null":"Set to null if the patient's childbearing potential status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient currently has childbearing potential."}  ;; "female subject of childbearing potential"
(declare-const patient_has_finding_of_amenorrhea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently amenorrheic.","when_to_set_to_false":"Set to false if the patient is currently not amenorrheic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently amenorrheic.","meaning":"Boolean indicating whether the patient is currently amenorrheic."}  ;; "must be amenorrheic for ≥ 2 years"
(declare-const patient_has_finding_of_amenorrhea_now@@duration_value_recorded_prior_to_screening_in_years Real) ;; {"when_to_set_to_value":"Set to the number of years the patient has been amenorrheic prior to screening.","when_to_set_to_null":"Set to null if the duration of amenorrhea prior to screening is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the duration in years for which the patient has been amenorrheic prior to screening."}  ;; "must be amenorrheic for ≥ 2 years"
(declare-const patient_has_finding_of_contraception_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using a medically acceptable form of contraception.","when_to_set_to_false":"Set to false if the patient is currently not using any medically acceptable form of contraception.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using a medically acceptable form of contraception.","meaning":"Boolean indicating whether the patient is currently using a medically acceptable form of contraception."}  ;; "using a medically acceptable form of birth control"
(declare-const patient_has_finding_of_contraception_now@@used_for_at_least_1_month_prior_to_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used a medically acceptable form of contraception for at least 1 month prior to screening.","when_to_set_to_false":"Set to false if the patient has not used a medically acceptable form of contraception for at least 1 month prior to screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used a medically acceptable form of contraception for at least 1 month prior to screening.","meaning":"Boolean indicating whether the patient has used a medically acceptable form of contraception for at least 1 month prior to screening."}  ;; "using a medically acceptable form of birth control for ≥ 1 month prior to screening"
(declare-const patient_has_finding_of_depo_provera_contraception_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using Depo-Provera for contraception.","when_to_set_to_false":"Set to false if the patient is currently not using Depo-Provera for contraception.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using Depo-Provera for contraception.","meaning":"Boolean indicating whether the patient is currently using Depo-Provera for contraception."}  ;; "Depo-Provera"
(declare-const patient_has_finding_of_depo_provera_contraception_now@@used_for_at_least_1_month_prior_to_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used Depo-Provera for contraception for at least 1 month prior to screening.","when_to_set_to_false":"Set to false if the patient has not used Depo-Provera for contraception for at least 1 month prior to screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used Depo-Provera for contraception for at least 1 month prior to screening.","meaning":"Boolean indicating whether the patient has used Depo-Provera for contraception for at least 1 month prior to screening."}  ;; "Depo-Provera for ≥ 1 month prior to screening"
(declare-const patient_has_finding_of_double_barrier_contraception_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using the double-barrier method for contraception.","when_to_set_to_false":"Set to false if the patient is currently not using the double-barrier method for contraception.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using the double-barrier method for contraception.","meaning":"Boolean indicating whether the patient is currently using the double-barrier method for contraception."}  ;; "double-barrier method"
(declare-const patient_has_finding_of_double_barrier_contraception_now@@used_for_at_least_1_month_prior_to_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used the double-barrier method for contraception for at least 1 month prior to screening.","when_to_set_to_false":"Set to false if the patient has not used the double-barrier method for contraception for at least 1 month prior to screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used the double-barrier method for contraception for at least 1 month prior to screening.","meaning":"Boolean indicating whether the patient has used the double-barrier method for contraception for at least 1 month prior to screening."}  ;; "double-barrier method for ≥ 1 month prior to screening"
(declare-const patient_has_finding_of_iud_contraception_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using an intrauterine device (IUD) for contraception.","when_to_set_to_false":"Set to false if the patient is currently not using an intrauterine device (IUD) for contraception.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using an intrauterine device (IUD) for contraception.","meaning":"Boolean indicating whether the patient is currently using an intrauterine device (IUD) for contraception."}  ;; "intrauterine device"
(declare-const patient_has_finding_of_iud_contraception_now@@used_for_at_least_1_month_prior_to_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used an intrauterine device (IUD) for at least 1 month prior to screening.","when_to_set_to_false":"Set to false if the patient has not used an intrauterine device (IUD) for at least 1 month prior to screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used an intrauterine device (IUD) for at least 1 month prior to screening.","meaning":"Boolean indicating whether the patient has used an intrauterine device (IUD) for at least 1 month prior to screening."}  ;; "intrauterine device for ≥ 1 month prior to screening"
(declare-const patient_has_finding_of_nuvaring_contraception_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using Nuvaring for contraception.","when_to_set_to_false":"Set to false if the patient is currently not using Nuvaring for contraception.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using Nuvaring for contraception.","meaning":"Boolean indicating whether the patient is currently using Nuvaring for contraception."}  ;; "Nuvaring"
(declare-const patient_has_finding_of_nuvaring_contraception_now@@used_for_at_least_1_month_prior_to_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used Nuvaring for contraception for at least 1 month prior to screening.","when_to_set_to_false":"Set to false if the patient has not used Nuvaring for contraception for at least 1 month prior to screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used Nuvaring for contraception for at least 1 month prior to screening.","meaning":"Boolean indicating whether the patient has used Nuvaring for contraception for at least 1 month prior to screening."}  ;; "Nuvaring for ≥ 1 month prior to screening"
(declare-const patient_has_finding_of_oral_contraception_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using oral contraceptives.","when_to_set_to_false":"Set to false if the patient is currently not using oral contraceptives.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using oral contraceptives.","meaning":"Boolean indicating whether the patient is currently using oral contraceptives."}  ;; "oral contraceptives"
(declare-const patient_has_finding_of_oral_contraception_now@@used_for_at_least_3_months_prior_to_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used oral contraceptives for at least 3 months prior to screening.","when_to_set_to_false":"Set to false if the patient has not used oral contraceptives for at least 3 months prior to screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used oral contraceptives for at least 3 months prior to screening.","meaning":"Boolean indicating whether the patient has used oral contraceptives for at least 3 months prior to screening."}  ;; "oral contraceptives for ≥ 3 months prior to screening"
(declare-const patient_has_finding_of_transdermal_contraceptive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using transdermal (patch) contraceptives.","when_to_set_to_false":"Set to false if the patient is currently not using transdermal (patch) contraceptives.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using transdermal (patch) contraceptives.","meaning":"Boolean indicating whether the patient is currently using transdermal (patch) contraceptives."}  ;; "patch contraceptives"
(declare-const patient_has_finding_of_transdermal_contraceptive_now@@used_for_at_least_1_month_prior_to_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used transdermal (patch) contraceptives for at least 1 month prior to screening.","when_to_set_to_false":"Set to false if the patient has not used transdermal (patch) contraceptives for at least 1 month prior to screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used transdermal (patch) contraceptives for at least 1 month prior to screening.","meaning":"Boolean indicating whether the patient has used transdermal (patch) contraceptives for at least 1 month prior to screening."}  ;; "patch contraceptives for ≥ 1 month prior to screening"
(declare-const patient_has_undergone_bilateral_oophorectomy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone bilateral oophorectomy at any time in the past.","when_to_set_to_false":"Set to false if the patient has not undergone bilateral oophorectomy at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone bilateral oophorectomy at any time in the past.","meaning":"Boolean indicating whether the patient has undergone bilateral oophorectomy at any time in the past."}  ;; "bilateral oophorectomy"
(declare-const patient_has_undergone_hysterectomy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone hysterectomy at any time in the past.","when_to_set_to_false":"Set to false if the patient has not undergone hysterectomy at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone hysterectomy at any time in the past.","meaning":"Boolean indicating whether the patient has undergone hysterectomy at any time in the past."}  ;; "hysterectomy"
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as determined by a pregnancy test at screening/treatment period.","when_to_set_to_false":"Set to false if the patient is currently not pregnant as determined by a pregnancy test at screening/treatment period.","when_to_set_to_null":"Set to null if the patient's pregnancy status at screening/treatment period is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."}  ;; "must have a negative pregnancy test at screening/treatment period"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Non-exhaustive examples: each specific method implies general contraception
(assert
  (! (=> (or patient_has_finding_of_depo_provera_contraception_now
             patient_has_finding_of_double_barrier_contraception_now
             patient_has_finding_of_iud_contraception_now
             patient_has_finding_of_nuvaring_contraception_now
             patient_has_finding_of_oral_contraception_now
             patient_has_finding_of_transdermal_contraceptive_now)
         patient_has_finding_of_contraception_now)
     :named REQ5_AUXILIARY0)) ;; "medically acceptable form of birth control (with non-exhaustive examples ...)"

;; Each specific method with duration implies general contraception with duration
(assert
  (! (=> patient_has_finding_of_depo_provera_contraception_now@@used_for_at_least_1_month_prior_to_screening
         patient_has_finding_of_contraception_now@@used_for_at_least_1_month_prior_to_screening)
     :named REQ5_AUXILIARY1)) ;; "Depo-Provera for ≥ 1 month prior to screening"

(assert
  (! (=> patient_has_finding_of_double_barrier_contraception_now@@used_for_at_least_1_month_prior_to_screening
         patient_has_finding_of_contraception_now@@used_for_at_least_1_month_prior_to_screening)
     :named REQ5_AUXILIARY2)) ;; "double-barrier method for ≥ 1 month prior to screening"

(assert
  (! (=> patient_has_finding_of_iud_contraception_now@@used_for_at_least_1_month_prior_to_screening
         patient_has_finding_of_contraception_now@@used_for_at_least_1_month_prior_to_screening)
     :named REQ5_AUXILIARY3)) ;; "intrauterine device for ≥ 1 month prior to screening"

(assert
  (! (=> patient_has_finding_of_nuvaring_contraception_now@@used_for_at_least_1_month_prior_to_screening
         patient_has_finding_of_contraception_now@@used_for_at_least_1_month_prior_to_screening)
     :named REQ5_AUXILIARY4)) ;; "Nuvaring for ≥ 1 month prior to screening"

(assert
  (! (=> patient_has_finding_of_transdermal_contraceptive_now@@used_for_at_least_1_month_prior_to_screening
         patient_has_finding_of_contraception_now@@used_for_at_least_1_month_prior_to_screening)
     :named REQ5_AUXILIARY5)) ;; "patch contraceptives for ≥ 1 month prior to screening"

;; Oral contraceptives: duration is 3 months, not 1
(assert
  (! (=> patient_has_finding_of_oral_contraception_now@@used_for_at_least_3_months_prior_to_screening
         patient_has_finding_of_oral_contraception_now)
     :named REQ5_AUXILIARY6)) ;; "oral contraceptives for ≥ 3 months prior to screening"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Main inclusion logic:
;; (if female & childbearing potential & sexually active) then (contraception (with correct duration) AND negative pregnancy test)
;; OR (if female & not childbearing potential) then (amenorrhea ≥2y OR hysterectomy OR bilateral oophorectomy)

;; We need a variable for "currently sexually active" (not provided), so we must declare it:
(declare-const patient_is_sexually_active_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently sexually active.","when_to_set_to_false":"Set to false if the patient is currently not sexually active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently sexually active.","meaning":"Boolean indicating whether the patient is currently sexually active."} ;; "is currently sexually active"

;; For the contraception duration, we need to distinguish oral contraceptives (3 months) from others (1 month)
(define-fun contraception_with_required_duration () Bool
  (or
    patient_has_finding_of_contraception_now@@used_for_at_least_1_month_prior_to_screening
    patient_has_finding_of_oral_contraception_now@@used_for_at_least_3_months_prior_to_screening
  )
) ;; "using a medically acceptable form of birth control for ≥ 1 month prior to screening (≥ 3 months if using oral contraceptives)"

;; Amenorrhea for ≥2 years
(define-fun amenorrhea_for_at_least_2_years () Bool
  (and patient_has_finding_of_amenorrhea_now
       (>= patient_has_finding_of_amenorrhea_now@@duration_value_recorded_prior_to_screening_in_years 2.0))
) ;; "must be amenorrheic for ≥ 2 years"

;; The full inclusion logic:
(assert
  (! (or
        ;; Female, childbearing potential, sexually active
        (and patient_sex_is_female_now
             patient_has_childbearing_potential_now
             patient_is_sexually_active_now
             contraception_with_required_duration
             (not patient_is_pregnant_now))
        ;; Female, non-childbearing potential
        (and patient_sex_is_female_now
             (not patient_has_childbearing_potential_now)
             (or amenorrhea_for_at_least_2_years
                 patient_has_undergone_hysterectomy_inthehistory
                 patient_has_undergone_bilateral_oophorectomy_inthehistory))
     )
     :named REQ5_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, (if the patient is a female subject of childbearing potential AND is currently sexually active) THEN ((the patient must be using a medically acceptable form of birth control ..."

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_can_undergo_pain_assessment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to understand and participate in pain rating assessments.","when_to_set_to_false":"Set to false if the patient is currently unable to understand or participate in pain rating assessments.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can understand pain rating assessments.","meaning":"Boolean indicating whether the patient is currently able to understand and participate in pain rating assessments."}  ;; "To be included, the patient must understand the pain rating assessments."

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! patient_can_undergo_pain_assessment_now
     :named REQ6_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must understand the pain rating assessments."
