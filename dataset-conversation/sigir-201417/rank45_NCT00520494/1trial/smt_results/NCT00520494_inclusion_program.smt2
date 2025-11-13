;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_provided_written_informed_consent_with_age_adapted_procedures Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided written informed consent and the consent was obtained using age-adapted procedures.","when_to_set_to_false":"Set to false if the patient has not provided written informed consent or the consent was not obtained using age-adapted procedures.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided written informed consent with age-adapted procedures.","meaning":"Boolean indicating whether the patient has provided written informed consent with age-adapted procedures."} ;; "To be included, the patient must have provided written informed consent (with age-adapted procedures)."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_provided_written_informed_consent_with_age_adapted_procedures
     :named REQ0_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have provided written informed consent (with age-adapted procedures)."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "aged 1 to 70 years"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female.","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is female."} ;; "female"
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as male.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not male.","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is male."} ;; "male"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must be male or female aged 1 to 70 years.
(assert
  (! (and (or patient_sex_is_male_now patient_sex_is_female_now)
          (>= patient_age_value_recorded_now_in_years 1)
          (<= patient_age_value_recorded_now_in_years 70))
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be male or female aged 1 to 70 years."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_humoral_immune_defect_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of humoral immune defect.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of humoral immune defect.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of humoral immune defect.","meaning":"Boolean indicating whether the patient currently has a diagnosis of humoral immune defect."} ;; "diagnosis of primary humoral immunodeficiency"
(declare-const patient_has_diagnosis_of_humoral_immune_defect_now@@primary Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of humoral immune defect is primary.","when_to_set_to_false":"Set to false if the patient's diagnosis of humoral immune defect is not primary (i.e., secondary or acquired).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the humoral immune defect is primary.","meaning":"Boolean indicating whether the patient's diagnosis of humoral immune defect is primary."} ;; "primary humoral immunodeficiency"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_diagnosis_of_humoral_immune_defect_now@@primary
         patient_has_diagnosis_of_humoral_immune_defect_now)
     :named REQ2_AUXILIARY0)) ;; "primary humoral immunodeficiency" means "humoral immune defect" that is primary

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_diagnosis_of_humoral_immune_defect_now@@primary
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have a diagnosis of primary humoral immunodeficiency."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_is_exposed_to_immunoglobulin_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to immunoglobulin at any time in their medical history, prior to the present or study inclusion.","when_to_set_to_false":"Set to false if it is confirmed that the patient has never been exposed to immunoglobulin at any time in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to immunoglobulin.","meaning":"Boolean indicating whether the patient has ever been exposed to immunoglobulin at any time in their medical history."} ;; "To be included, the patient must NOT have had prior immunoglobulin substitution therapy."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (not patient_is_exposed_to_immunoglobulin_inthehistory)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT have had prior immunoglobulin substitution therapy."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_immunoglobulin_g_measurement_value_recorded_now_withunit_grams_per_liter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's immunoglobulin G level is recorded at screening in grams per liter.","when_to_set_to_null":"Set to null if no such measurement is available at screening or the value is indeterminate.","meaning":"Numeric value representing the patient's immunoglobulin G level measured at screening in grams per liter."} ;; "immunoglobulin G level < 5 grams per liter at screening"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (< patient_immunoglobulin_g_measurement_value_recorded_now_withunit_grams_per_liter 5.0)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have an immunoglobulin G level < 5 grams per liter at screening."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently capable of becoming pregnant (i.e., has childbearing potential).","when_to_set_to_false":"Set to false if the patient is currently not capable of becoming pregnant (e.g., postmenopausal, surgically sterile, or other medical reasons).","when_to_set_to_null":"Set to null if the patient's childbearing potential status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient currently has childbearing potential."} ;; "woman of childbearing potential"
(declare-const patient_has_finding_of_contraception_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using contraception.","when_to_set_to_false":"Set to false if the patient is currently not using contraception.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using contraception.","meaning":"Boolean indicating whether the patient is currently using contraception."} ;; "contraception"
(declare-const patient_has_finding_of_contraception_now@@medically_approved Bool) ;; {"when_to_set_to_true":"Set to true if the contraception used by the patient is medically approved.","when_to_set_to_false":"Set to false if the contraception used by the patient is not medically approved.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the contraception used by the patient is medically approved.","meaning":"Boolean indicating whether the contraception used by the patient is medically approved."} ;; "medically approved contraception"
(declare-const patient_has_undergone_urine_pregnancy_test_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a urine pregnancy test now.","when_to_set_to_false":"Set to false if the patient has not undergone a urine pregnancy test now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a urine pregnancy test now.","meaning":"Boolean indicating whether the patient has undergone a urine pregnancy test now."} ;; "urine pregnancy test"
(declare-const patient_has_undergone_urine_pregnancy_test_now@@performed_at_screening Bool) ;; {"when_to_set_to_true":"Set to true if the urine pregnancy test was performed at screening.","when_to_set_to_false":"Set to false if the urine pregnancy test was not performed at screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the urine pregnancy test was performed at screening.","meaning":"Boolean indicating whether the urine pregnancy test was performed at screening."} ;; "urine pregnancy test at screening"
(declare-const patient_has_undergone_urine_pregnancy_test_now@@outcome_is_negative Bool) ;; {"when_to_set_to_true":"Set to true if the result of the urine pregnancy test is negative.","when_to_set_to_false":"Set to false if the result of the urine pregnancy test is not negative.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the result of the urine pregnancy test is negative.","meaning":"Boolean indicating whether the result of the urine pregnancy test is negative."} ;; "negative urine pregnancy test"
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as determined by a urine pregnancy test at screening.","when_to_set_to_false":"Set to false if the patient is currently not pregnant as determined by a urine pregnancy test at screening.","when_to_set_to_null":"Set to null if the patient's pregnancy status at screening is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "negative urine pregnancy test at screening"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable for contraception implies stem variable
(assert
  (! (=> patient_has_finding_of_contraception_now@@medically_approved
         patient_has_finding_of_contraception_now)
     :named REQ5_AUXILIARY0)) ;; "medically approved contraception" implies "contraception"

;; Qualifier variable for urine pregnancy test performed at screening implies stem variable
(assert
  (! (=> patient_has_undergone_urine_pregnancy_test_now@@performed_at_screening
         patient_has_undergone_urine_pregnancy_test_now)
     :named REQ5_AUXILIARY1)) ;; "urine pregnancy test at screening" implies "urine pregnancy test"

;; Qualifier variable for urine pregnancy test outcome negative implies stem variable
(assert
  (! (=> patient_has_undergone_urine_pregnancy_test_now@@outcome_is_negative
         patient_has_undergone_urine_pregnancy_test_now)
     :named REQ5_AUXILIARY2)) ;; "negative urine pregnancy test" implies "urine pregnancy test"

;; Negative urine pregnancy test at screening is defined as both performed at screening and outcome negative
(assert
  (! (= patient_is_pregnant_now
        (not (and patient_has_undergone_urine_pregnancy_test_now@@performed_at_screening
                  patient_has_undergone_urine_pregnancy_test_now@@outcome_is_negative)))
     :named REQ5_AUXILIARY3)) ;; "negative urine pregnancy test at screening" definition

;; ===================== Constraint Assertions (REQ 5) =====================
;; Component 0: If the patient is a woman of childbearing potential, she must use medically approved contraception
(assert
  (! (or (not (and patient_sex_is_female_now patient_has_childbearing_potential_now))
         patient_has_finding_of_contraception_now@@medically_approved)
     :named REQ5_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "if the patient is a woman of childbearing potential, the patient must use medically approved contraception"

;; Component 1: If the patient is a woman of childbearing potential, she must have a negative urine pregnancy test at screening
(assert
  (! (or (not (and patient_sex_is_female_now patient_has_childbearing_potential_now))
         (and patient_has_undergone_urine_pregnancy_test_now@@performed_at_screening
              patient_has_undergone_urine_pregnancy_test_now@@outcome_is_negative))
     :named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "if the patient is a woman of childbearing potential, the patient must have a negative urine pregnancy test at screening"
