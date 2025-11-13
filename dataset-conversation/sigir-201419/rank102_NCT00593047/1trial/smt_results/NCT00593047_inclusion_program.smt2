;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_signed_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided informed consent and the consent is signed.","when_to_set_to_false":"Set to false if the patient has not provided informed consent or the consent is not signed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided signed informed consent.","meaning":"Boolean indicating whether the patient has provided informed consent that is signed."} ;; "the patient must have signed informed consent."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_signed_informed_consent
     :named REQ0_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must have signed informed consent."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as male.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not male (e.g., female or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is male."} ;; "be male"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female (e.g., male or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is female."} ;; "be female"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "be aged ≥ 18 years AND be aged ≤ 75 years"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must ((be male) OR (be female AND be aged ≥ 18 years AND be aged ≤ 75 years)).
(assert
  (! (or patient_sex_is_male_now
         (and patient_sex_is_female_now
              (>= patient_age_value_recorded_now_in_years 18.0)
              (<= patient_age_value_recorded_now_in_years 75.0)))
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must ((be male) OR (be female AND be aged ≥ 18 years AND be aged ≤ 75 years))."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has childbearing potential (is fertile).","when_to_set_to_false":"Set to false if the patient currently does not have childbearing potential (is non-fertile).","when_to_set_to_null":"Set to null if the patient's current childbearing potential status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient currently has childbearing potential (i.e., is fertile)."} ;; "the patient must be non-fertile"

;; ===================== Constraint Assertions (REQ 2) =====================
;; If the patient is female, the patient must be non-fertile.
(assert
  (! (or (not patient_sex_is_female_now)
         (not patient_has_childbearing_potential_now))
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, if the patient is female, the patient must be non-fertile."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_is_non_fertile_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently non-fertile (does not have childbearing potential).","when_to_set_to_false":"Set to false if the patient is currently fertile (has childbearing potential).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently non-fertile.","meaning":"Boolean indicating whether the patient is currently non-fertile (does not have childbearing potential)."} ;; "the patient must be non-fertile"
(declare-const patient_has_been_non_nursing_for_months_prior_to_enrolment_value_recorded_in_months Real) ;; {"when_to_set_to_value":"Set to the number of consecutive months prior to enrolment during which the patient has been non-nursing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many consecutive months prior to enrolment the patient has been non-nursing.","meaning":"Numeric value indicating the number of consecutive months prior to enrolment during which the patient has been non-nursing."} ;; "have been non-nursing for ≥ 12 months prior to enrolment"
(declare-const patient_has_been_non_pregnant_for_months_prior_to_enrolment_value_recorded_in_months Real) ;; {"when_to_set_to_value":"Set to the number of consecutive months prior to enrolment during which the patient has been non-pregnant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many consecutive months prior to enrolment the patient has been non-pregnant.","meaning":"Numeric value indicating the number of consecutive months prior to enrolment during which the patient has been non-pregnant."} ;; "have been non-pregnant for ≥ 12 months prior to enrolment"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; patient_is_non_fertile_now is equivalent to not having childbearing potential
(assert
  (! (= patient_is_non_fertile_now (not patient_has_childbearing_potential_now))
     :named REQ3_AUXILIARY0)) ;; "the patient must be non-fertile"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: If patient is female AND non-fertile, must have been non-nursing for ≥ 12 months prior to enrolment
(assert
  (! (=> (and patient_sex_is_female_now patient_is_non_fertile_now)
         (>= patient_has_been_non_nursing_for_months_prior_to_enrolment_value_recorded_in_months 12))
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "if the patient is female AND non-fertile, the patient must have been non-nursing for ≥ 12 months prior to enrolment"

;; Component 1: If patient is female AND non-fertile, must have been non-pregnant for ≥ 12 months prior to enrolment
(assert
  (! (=> (and patient_sex_is_female_now patient_is_non_fertile_now)
         (>= patient_has_been_non_pregnant_for_months_prior_to_enrolment_value_recorded_in_months 12))
     :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "if the patient is female AND non-fertile, the patient must have been non-pregnant for ≥ 12 months prior to enrolment"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_finding_of_amenorrhea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has amenorrhea.","when_to_set_to_false":"Set to false if the patient currently does not have amenorrhea.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has amenorrhea.","meaning":"Boolean indicating whether the patient currently has amenorrhea."} ;; "amenorrhea"
(declare-const patient_has_finding_of_postmenopausal_state_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently in a postmenopausal state.","when_to_set_to_false":"Set to false if the patient is currently not in a postmenopausal state.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently in a postmenopausal state.","meaning":"Boolean indicating whether the patient is currently in a postmenopausal state."} ;; "post-menopausal"
(declare-const patient_has_undergone_bilateral_oophorectomy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a bilateral oophorectomy at any time in the past (up to now).","when_to_set_to_false":"Set to false if the patient has not undergone a bilateral oophorectomy at any time in the past (up to now).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a bilateral oophorectomy at any time in the past (up to now).","meaning":"Boolean indicating whether the patient has undergone a bilateral oophorectomy at any time in the past (up to now)."} ;; "bilateral oophorectomy"
(declare-const patient_has_undergone_bilateral_oophorectomy_inthehistory@@documented_irreversible_surgically_performed Bool) ;; {"when_to_set_to_true":"Set to true if the bilateral oophorectomy is documented, irreversible, and surgically performed.","when_to_set_to_false":"Set to false if the bilateral oophorectomy is not documented, not irreversible, or not surgically performed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the bilateral oophorectomy is documented, irreversible, and surgically performed.","meaning":"Boolean indicating whether the bilateral oophorectomy is documented, irreversible, and surgically performed."} ;; "documented irreversible surgically sterile (bilateral oophorectomy)"
(declare-const patient_has_undergone_hysterectomy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a hysterectomy at any time in the past (up to now).","when_to_set_to_false":"Set to false if the patient has not undergone a hysterectomy at any time in the past (up to now).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a hysterectomy at any time in the past (up to now).","meaning":"Boolean indicating whether the patient has undergone a hysterectomy at any time in the past (up to now)."} ;; "hysterectomy"
(declare-const patient_has_undergone_hysterectomy_inthehistory@@documented_irreversible_surgically_performed Bool) ;; {"when_to_set_to_true":"Set to true if the hysterectomy is documented, irreversible, and surgically performed.","when_to_set_to_false":"Set to false if the hysterectomy is not documented, not irreversible, or not surgically performed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the hysterectomy is documented, irreversible, and surgically performed.","meaning":"Boolean indicating whether the hysterectomy is documented, irreversible, and surgically performed."} ;; "documented irreversible surgically sterile (hysterectomy)"
(declare-const patient_has_undergone_ligation_of_fallopian_tube_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone tubal ligation at any time in the past (up to now).","when_to_set_to_false":"Set to false if the patient has not undergone tubal ligation at any time in the past (up to now).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone tubal ligation at any time in the past (up to now).","meaning":"Boolean indicating whether the patient has undergone tubal ligation at any time in the past (up to now)."} ;; "tubal ligation"
(declare-const patient_serum_follicle_stimulating_hormone_measurement_value_recorded_now_withunit_international_unit_per_liter Real) ;; {"when_to_set_to_value":"Set to the measured value if a current serum FSH level in international units per liter is available.","when_to_set_to_null":"Set to null if no current serum FSH measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current serum FSH level in international units per liter."} ;; "serum follicle-stimulating hormone level"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_undergone_bilateral_oophorectomy_inthehistory@@documented_irreversible_surgically_performed
         patient_has_undergone_bilateral_oophorectomy_inthehistory)
     :named REQ4_AUXILIARY0)) ;; "documented irreversible surgically performed bilateral oophorectomy"

(assert
  (! (=> patient_has_undergone_hysterectomy_inthehistory@@documented_irreversible_surgically_performed
         patient_has_undergone_hysterectomy_inthehistory)
     :named REQ4_AUXILIARY1)) ;; "documented irreversible surgically performed hysterectomy"

;; Exhaustive subcategories for documented irreversible surgically sterile: bilateral oophorectomy OR hysterectomy, but NOT tubal ligation
(define-fun patient_is_documented_irreversible_surgically_sterile_now () Bool
  (and
    (or patient_has_undergone_bilateral_oophorectomy_inthehistory@@documented_irreversible_surgically_performed
        patient_has_undergone_hysterectomy_inthehistory@@documented_irreversible_surgically_performed)
    (not patient_has_undergone_ligation_of_fallopian_tube_inthehistory)
  )
) ;; "documented irreversible surgically sterile (bilateral oophorectomy OR hysterectomy), NOT tubal ligation"

;; Definition of post-menopausal state per requirement
(define-fun patient_is_postmenopausal_per_protocol_now () Bool
  (or
    ;; If age > 50: FSH in post-menopausal range AND amenorrhea > 1 year
    (and
      (> patient_age_value_recorded_now_in_years 50)
      ;; FSH in post-menopausal range: threshold not specified, so we use finding variable
      (>= patient_serum_follicle_stimulating_hormone_measurement_value_recorded_now_withunit_international_unit_per_liter 40.0) ;; Comment: Use 40 IU/L as a typical threshold for post-menopausal FSH, but this should be protocol-specific.
      (and patient_has_finding_of_amenorrhea_now
           ;; Amenorrhea for > 1 year: not directly encoded, so we assume finding variable covers duration
           ;; If duration variable existed, would use: (> patient_amenorrhea_duration_in_years 1)
           )
    )
    ;; If age ≤ 50: amenorrhea > 2 years
    (and
      (<= patient_age_value_recorded_now_in_years 50)
      (and patient_has_finding_of_amenorrhea_now
           ;; Amenorrhea for > 2 years: not directly encoded, so we assume finding variable covers duration
           ;; If duration variable existed, would use: (> patient_amenorrhea_duration_in_years 2)
           )
    )
  )
) ;; "post-menopausal (defined as (serum FSH in post-menopausal range AND amenorrhea for > 1 year if aged > 50 years) OR (amenorrhea for > 2 years if aged ≤ 50 years))"

;; Protocol post-menopausal state implies finding variable
(assert
  (! (=> patient_is_postmenopausal_per_protocol_now
         patient_has_finding_of_postmenopausal_state_now)
     :named REQ4_AUXILIARY2)) ;; "post-menopausal (per protocol definition) implies postmenopausal finding"

;; ===================== Constraint Assertions (REQ 4) =====================
;; If patient is female AND non-fertile, must NOT be of childbearing potential, i.e., must be (documented irreversible surgically sterile OR post-menopausal)
(assert
  (! (=> (and patient_sex_is_female_now
              patient_is_non_fertile_now)
         (and (not patient_has_childbearing_potential_now)
              (or patient_is_documented_irreversible_surgically_sterile_now
                  patient_is_postmenopausal_per_protocol_now)))
     :named REQ4_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "If the patient is female AND non-fertile, the patient must NOT be of child bearing potential, i.e., must be (documented irreversible surgically sterile (bilateral oophorectomy OR hysterectomy), NOT tubal ligation) OR post-menopausal (per protocol definition)"

;; ===================== Declarations for the inclusion criterion (REQ 5) =====================
(declare-const patient_has_diagnosis_of_hypercholesterolemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of hypercholesterolemia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of hypercholesterolemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of hypercholesterolemia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of hypercholesterolemia."} ;; "the patient must have hypercholesterolemia."
(declare-const patient_is_exposed_to_antilipemic_agent_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to antilipemic agents (lipid lowering medication) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been exposed to antilipemic agents (lipid lowering medication) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to antilipemic agents (lipid lowering medication).","meaning":"Boolean indicating whether the patient has ever been exposed to antilipemic agents (lipid lowering medication) at any time in the past."} ;; "have been treated with lipid lowering medication"
(declare-const patient_is_exposed_to_antilipemic_agent_inthehistory@@stable_doses Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to antilipemic agents was in stable doses.","when_to_set_to_false":"Set to false if the patient's exposure to antilipemic agents was not in stable doses.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's exposure to antilipemic agents was in stable doses.","meaning":"Boolean indicating whether the patient's exposure to antilipemic agents was in stable doses."} ;; "have been treated with stable doses of lipid lowering medication"
(declare-const patient_is_exposed_to_antilipemic_agent_inthehistory@@temporalcontext_at_least_3_months_prior_to_randomization Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to antilipemic agents lasted at least 3 months prior to randomization.","when_to_set_to_false":"Set to false if the patient's exposure to antilipemic agents did not last at least 3 months prior to randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's exposure to antilipemic agents lasted at least 3 months prior to randomization.","meaning":"Boolean indicating whether the patient's exposure to antilipemic agents lasted at least 3 months prior to randomization."} ;; "for ≥ 3 months prior to randomization"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variables imply the stem variable (exposure to antilipemic agent)
(assert
  (! (=> patient_is_exposed_to_antilipemic_agent_inthehistory@@stable_doses
         patient_is_exposed_to_antilipemic_agent_inthehistory)
     :named REQ5_AUXILIARY0)) ;; "stable doses" is a qualifier of exposure to antilipemic agent

(assert
  (! (=> patient_is_exposed_to_antilipemic_agent_inthehistory@@temporalcontext_at_least_3_months_prior_to_randomization
         patient_is_exposed_to_antilipemic_agent_inthehistory)
     :named REQ5_AUXILIARY1)) ;; "at least 3 months prior to randomization" is a qualifier of exposure to antilipemic agent

;; ===================== Constraint Assertions (REQ 5) =====================
;; Component 0: The patient must have hypercholesterolemia
(assert
  (! patient_has_diagnosis_of_hypercholesterolemia_now
     :named REQ5_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must have hypercholesterolemia."

;; Component 1: The patient must have been treated with stable doses of lipid lowering medication for ≥ 3 months prior to randomization
(assert
  (! (and patient_is_exposed_to_antilipemic_agent_inthehistory@@stable_doses
          patient_is_exposed_to_antilipemic_agent_inthehistory@@temporalcontext_at_least_3_months_prior_to_randomization)
     :named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "have been treated with stable doses of lipid lowering medication for ≥ 3 months prior to randomization."

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const atorvastatin_daily_dose_value_recorded_now_withunit_mg Real) ;; {"when_to_set_to_value":"Set to the numeric value of the current daily dose of atorvastatin the patient is being treated with, in milligrams.","when_to_set_to_null":"Set to null if the current daily dose of atorvastatin is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the current daily dose of atorvastatin the patient is being treated with, in milligrams."} ;; "be treated with atorvastatin at a dose ≤ 20 milligrams per day"
(declare-const patient_is_taking_atorvastatin_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently being treated with an atorvastatin-containing product.","when_to_set_to_false":"Set to false if the patient is currently not being treated with an atorvastatin-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being treated with an atorvastatin-containing product.","meaning":"Boolean indicating whether the patient is currently being treated with an atorvastatin-containing product."} ;; "be treated with atorvastatin"
(declare-const patient_is_taking_simvastatin_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently being treated with a simvastatin-containing product.","when_to_set_to_false":"Set to false if the patient is currently not being treated with a simvastatin-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being treated with a simvastatin-containing product.","meaning":"Boolean indicating whether the patient is currently being treated with a simvastatin-containing product."} ;; "be treated with simvastatin"
(declare-const simvastatin_daily_dose_value_recorded_now_withunit_mg Real) ;; {"when_to_set_to_value":"Set to the numeric value of the current daily dose of simvastatin the patient is being treated with, in milligrams.","when_to_set_to_null":"Set to null if the current daily dose of simvastatin is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the current daily dose of simvastatin the patient is being treated with, in milligrams."} ;; "be treated with simvastatin at a dose ≤ 40 milligrams per day"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Component 0: To be included, the patient must ((be treated with atorvastatin at a dose ≤ 20 milligrams per day) OR (be treated with simvastatin at a dose ≤ 40 milligrams per day)).
(assert
  (! (or
        (and patient_is_taking_atorvastatin_containing_product_now
             (<= atorvastatin_daily_dose_value_recorded_now_withunit_mg 20.0))
        (and patient_is_taking_simvastatin_containing_product_now
             (<= simvastatin_daily_dose_value_recorded_now_withunit_mg 40.0))
     )
     :named REQ6_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must ((be treated with atorvastatin at a dose ≤ 20 milligrams per day) OR (be treated with simvastatin at a dose ≤ 40 milligrams per day))."

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_ldl_cholesterol_value_recorded_inthepast1weeks_withunit_millimoles_per_liter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's LDL cholesterol was recorded one week prior in millimoles per liter.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value of the patient's LDL cholesterol measured one week prior, in millimoles per liter."} ;; "low-density lipoprotein cholesterol > 3.0 millimoles per liter at Week -1."

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! (> patient_ldl_cholesterol_value_recorded_inthepast1weeks_withunit_millimoles_per_liter 3.0)
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have low-density lipoprotein cholesterol > 3.0 millimoles per liter at Week -1."

;; ===================== Declarations for the inclusion criterion (REQ 8) =====================
(declare-const patient_is_able_to_comply_with_all_study_requirements Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able to comply with all study requirements.","when_to_set_to_false":"Set to false if the patient is not able to comply with all study requirements.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to comply with all study requirements.","meaning":"Boolean indicating whether the patient is able to comply with all study requirements."} ;; "the patient must be able to comply with all study requirements."
(declare-const patient_is_willing_to_comply_with_all_study_requirements Bool) ;; {"when_to_set_to_true":"Set to true if the patient is willing to comply with all study requirements.","when_to_set_to_false":"Set to false if the patient is not willing to comply with all study requirements.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to comply with all study requirements.","meaning":"Boolean indicating whether the patient is willing to comply with all study requirements."} ;; "the patient must be willing to comply with all study requirements."

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
  (! patient_is_able_to_comply_with_all_study_requirements
     :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must be able to comply with all study requirements."

(assert
  (! patient_is_willing_to_comply_with_all_study_requirements
     :named REQ8_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient must be willing to comply with all study requirements."

;; ===================== Declarations for the criterion (REQ 9) =====================
(declare-const patient_has_followed_diet_as_instructed_by_investigator_during_last_4_weeks_prior_to_randomization Bool) ;; {"when_to_set_to_true":"Set to true if the patient has followed the diet as instructed by the investigator during the last 4 weeks prior to randomization.","when_to_set_to_false":"Set to false if the patient has not followed the diet as instructed by the investigator during the last 4 weeks prior to randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has followed the diet as instructed by the investigator during the last 4 weeks prior to randomization.","meaning":"Boolean indicating whether the patient has followed the diet as instructed by the investigator during the last 4 weeks prior to randomization."} ;; "have followed the diet as instructed by the investigator during the last 4 weeks prior to randomization"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
  (! patient_has_followed_diet_as_instructed_by_investigator_during_last_4_weeks_prior_to_randomization
     :named REQ9_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "have followed the diet as instructed by the investigator during the last 4 weeks prior to randomization"

(assert
  (! patient_is_willing_to_comply_with_all_study_requirements
     :named REQ9_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "be willing to follow these instructions throughout the study"
