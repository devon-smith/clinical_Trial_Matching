;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as male.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not male (e.g., female or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is male."}  ;; "the patient must be a man"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female (e.g., male or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is female."}  ;; "the patient must be a woman"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "18 to 65 years old"
(declare-const patient_body_mass_index_value_recorded_now_withunit_kg_m2 Real) ;; {"when_to_set_to_value":"Set to the measured BMI value if a numeric measurement of the patient's body mass index (kg/m2) recorded now is available.","when_to_set_to_null":"Set to null if no such BMI measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current body mass index (BMI) in kg/m2."}  ;; "body mass index of 35 kg/m2 or greater"
(declare-const patient_is_undergoing_bariatric_surgery_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing bariatric surgery.","when_to_set_to_false":"Set to false if the patient is not currently undergoing bariatric surgery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing bariatric surgery.","meaning":"Boolean indicating whether the patient is currently undergoing bariatric surgery."}  ;; "who will be undergoing bariatric surgery"
(declare-const patient_is_undergoing_bariatric_surgery_now@@surgery_type_is_vertical_sleeve_gastrectomy_or_roux_en_y_gastric_bypass Bool) ;; {"when_to_set_to_true":"Set to true if the bariatric surgery the patient is currently undergoing is either vertical sleeve gastrectomy or Roux-en-Y gastric bypass.","when_to_set_to_false":"Set to false if the bariatric surgery the patient is currently undergoing is not vertical sleeve gastrectomy or Roux-en-Y gastric bypass.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the bariatric surgery is vertical sleeve gastrectomy or Roux-en-Y gastric bypass.","meaning":"Boolean indicating whether the bariatric surgery is either vertical sleeve gastrectomy or Roux-en-Y gastric bypass."}  ;; "vertical sleeve gastrectomy or Roux-en-Y gastric bypass"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable for bariatric surgery type implies stem variable
(assert
  (! (=> patient_is_undergoing_bariatric_surgery_now@@surgery_type_is_vertical_sleeve_gastrectomy_or_roux_en_y_gastric_bypass
         patient_is_undergoing_bariatric_surgery_now)
     :named REQ0_AUXILIARY0)) ;; "vertical sleeve gastrectomy or Roux-en-Y gastric bypass" implies "bariatric surgery"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: The patient must be a man or the patient must be a woman.
(assert
  (! (or patient_sex_is_male_now patient_sex_is_female_now)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must be a man or the patient must be a woman"

;; Component 1: The patient must be 18 to 65 years old.
(assert
  (! (and (>= patient_age_value_recorded_now_in_years 18)
          (<= patient_age_value_recorded_now_in_years 65))
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "18 to 65 years old"

;; Component 2: The patient must have a body mass index of 35 kg/m2 or greater.
(assert
  (! (>= patient_body_mass_index_value_recorded_now_withunit_kg_m2 35)
     :named REQ0_COMPONENT2_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "body mass index of 35 kg/m2 or greater"

;; Component 3: The patient must be undergoing bariatric surgery (vertical sleeve gastrectomy or Roux-en-Y gastric bypass).
(assert
  (! patient_is_undergoing_bariatric_surgery_now@@surgery_type_is_vertical_sleeve_gastrectomy_or_roux_en_y_gastric_bypass
     :named REQ0_COMPONENT3_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "undergoing bariatric surgery (vertical sleeve gastrectomy or Roux-en-Y gastric bypass)"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_signed_written_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has signed written informed consent.","when_to_set_to_false":"Set to false if the patient has not signed written informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has signed written informed consent.","meaning":"Boolean indicating whether the patient has signed written informed consent."}  ;; "the patient must have signed written informed consent"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_signed_written_informed_consent
     :named REQ1_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must have signed written informed consent"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently biologically capable of becoming pregnant (i.e., has not undergone menopause, hysterectomy, or other sterilizing procedures and is of reproductive age).","when_to_set_to_false":"Set to false if the patient is currently not biologically capable of becoming pregnant (e.g., postmenopausal, has had a hysterectomy, or other permanent sterilization).","when_to_set_to_null":"Set to null if the patient's childbearing potential status is unknown, not documented, or cannot be determined.","meaning":"Boolean indicating whether the patient currently has the biological potential to become pregnant."} ;; "woman of childbearing potential"
(declare-const patient_is_pregnant_inthepast24hours Bool) ;; {"when_to_set_to_true":"Set to true if a pregnancy test within the past 24 hours prior to the start of study drug was positive, indicating the patient was pregnant.","when_to_set_to_false":"Set to false if a pregnancy test within the past 24 hours prior to the start of study drug was negative, indicating the patient was not pregnant.","when_to_set_to_null":"Set to null if no pregnancy test was performed within the past 24 hours prior to the start of study drug, or if the result is unknown or indeterminate.","meaning":"Boolean indicating whether the patient was pregnant at any time within the 24 hours prior to the start of study drug, as determined by a pregnancy test."} ;; "negative serum pregnancy test (minimum sensitivity 25 international units per liter of human chorionic gonadotropin) within 24 hours prior to the start of study drug"
(declare-const serum_pregnancy_test_result_recorded_within_24_hours_prior_to_study_drug_is_negative Bool) ;; {"when_to_set_to_true":"Set to true if a serum pregnancy test was performed within 24 hours prior to the start of study drug and the result is negative.","when_to_set_to_false":"Set to false if a serum pregnancy test was performed within 24 hours prior to the start of study drug and the result is positive.","when_to_set_to_null":"Set to null if no serum pregnancy test was performed within 24 hours prior to the start of study drug, or if the result is unknown or indeterminate.","meaning":"Boolean indicating whether a serum pregnancy test result recorded within 24 hours prior to the start of study drug is negative."} ;; "negative serum pregnancy test (minimum sensitivity 25 international units per liter of human chorionic gonadotropin) within 24 hours prior to the start of study drug"
(declare-const serum_pregnancy_test_sensitivity_value_recorded_within_24_hours_prior_to_study_drug_in_international_units_per_liter_hcg Real) ;; {"when_to_set_to_value":"Set to the numeric sensitivity value (in IU/L hCG) of the serum pregnancy test performed within 24 hours prior to the start of study drug.","when_to_set_to_null":"Set to null if no serum pregnancy test was performed within 24 hours prior to the start of study drug, or if the sensitivity value is unknown or not documented.","meaning":"Numeric value indicating the sensitivity of the serum pregnancy test performed within 24 hours prior to the start of study drug, measured in international units per liter of hCG."} ;; "minimum sensitivity 25 international units per liter of human chorionic gonadotropin"
(declare-const urine_pregnancy_test_result_recorded_within_24_hours_prior_to_study_drug_is_negative Bool) ;; {"when_to_set_to_true":"Set to true if a urine pregnancy test was performed within 24 hours prior to the start of study drug and the result is negative.","when_to_set_to_false":"Set to false if a urine pregnancy test was performed within 24 hours prior to the start of study drug and the result is positive.","when_to_set_to_null":"Set to null if no urine pregnancy test was performed within 24 hours prior to the start of study drug, or if the result is unknown or indeterminate.","meaning":"Boolean indicating whether a urine pregnancy test result recorded within 24 hours prior to the start of study drug is negative."} ;; "negative urine pregnancy test (minimum sensitivity 25 international units per liter of human chorionic gonadotropin) within 24 hours prior to the start of study drug"
(declare-const urine_pregnancy_test_sensitivity_value_recorded_within_24_hours_prior_to_study_drug_in_international_units_per_liter_hcg Real) ;; {"when_to_set_to_value":"Set to the numeric sensitivity value (in IU/L hCG) of the urine pregnancy test performed within 24 hours prior to the start of study drug.","when_to_set_to_null":"Set to null if no urine pregnancy test was performed within 24 hours prior to the start of study drug, or if the sensitivity value is unknown or not documented.","meaning":"Numeric value indicating the sensitivity of the urine pregnancy test performed within 24 hours prior to the start of study drug, measured in international units per liter of hCG."} ;; "minimum sensitivity 25 international units per liter of human chorionic gonadotropin"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; If a negative serum pregnancy test is present, then the patient is not pregnant in the past 24 hours
(assert
  (! (=> (and serum_pregnancy_test_result_recorded_within_24_hours_prior_to_study_drug_is_negative
              (>= serum_pregnancy_test_sensitivity_value_recorded_within_24_hours_prior_to_study_drug_in_international_units_per_liter_hcg 25.0))
         (not patient_is_pregnant_inthepast24hours))
     :named REQ2_AUXILIARY0)) ;; "a negative serum pregnancy test (minimum sensitivity 25 international units per liter of human chorionic gonadotropin) within 24 hours prior to the start of study drug"

;; If a negative urine pregnancy test is present, then the patient is not pregnant in the past 24 hours
(assert
  (! (=> (and urine_pregnancy_test_result_recorded_within_24_hours_prior_to_study_drug_is_negative
              (>= urine_pregnancy_test_sensitivity_value_recorded_within_24_hours_prior_to_study_drug_in_international_units_per_liter_hcg 25.0))
         (not patient_is_pregnant_inthepast24hours))
     :named REQ2_AUXILIARY1)) ;; "a negative urine pregnancy test (minimum sensitivity 25 international units per liter of human chorionic gonadotropin) within 24 hours prior to the start of study drug"

;; ===================== Constraint Assertions (REQ 2) =====================
;; If the patient is a woman of childbearing potential, then must have a negative serum or urine pregnancy test (with minimum sensitivity) within 24 hours prior to study drug
(assert
  (! (or (not (and patient_sex_is_female_now patient_has_childbearing_potential_now))
         (or (and serum_pregnancy_test_result_recorded_within_24_hours_prior_to_study_drug_is_negative
                  (>= serum_pregnancy_test_sensitivity_value_recorded_within_24_hours_prior_to_study_drug_in_international_units_per_liter_hcg 25.0))
             (and urine_pregnancy_test_result_recorded_within_24_hours_prior_to_study_drug_is_negative
                  (>= urine_pregnancy_test_sensitivity_value_recorded_within_24_hours_prior_to_study_drug_in_international_units_per_liter_hcg 25.0))))
     :named REQ2_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "if the patient is a woman of childbearing potential, the patient must have (a negative serum pregnancy test (minimum sensitivity 25 international units per liter of human chorionic gonadotropin) within 24 hours prior to the start of study drug OR a negative urine pregnancy test (minimum sensitivity 25 international units per liter of human chorionic gonadotropin) within 24 hours prior to the start of study drug)"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breastfeeding.","when_to_set_to_false":"Set to false if the patient is currently not breastfeeding.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the patient is currently breastfeeding.","meaning":"Boolean value indicating whether the patient is currently breastfeeding."}  ;; "the patient must NOT be breastfeeding"
(declare-const patients_breastfeeding_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breastfeeding.","when_to_set_to_false":"Set to false if the patient is currently not breastfeeding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently breastfeeding.","meaning":"Boolean indicating whether the patient is currently breastfeeding."}  ;; "breastfeeding"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Observable entity implies the clinical status variable
(assert
  (! (=> patients_breastfeeding_is_positive_now
         patient_is_breastfeeding_now)
     :named REQ3_AUXILIARY0)) ;; "breastfeeding" observable entity implies patient_is_breastfeeding_now

;; ===================== Constraint Assertions (REQ 3) =====================
;; If the patient is a woman, she must NOT be breastfeeding
(assert
  (! (or (not patient_sex_is_female_now)
         (not patient_is_breastfeeding_now))
     :named REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "if the patient is a woman, the patient must NOT be breastfeeding"
