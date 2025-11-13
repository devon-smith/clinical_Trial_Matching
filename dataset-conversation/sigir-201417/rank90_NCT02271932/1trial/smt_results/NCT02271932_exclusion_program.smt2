;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_abdominal_pain_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had abdominal pain at any point in their medical history, regardless of current status.","when_to_set_to_false":"Set to false if the patient has never had abdominal pain documented in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had abdominal pain in their history.","meaning":"Boolean indicating whether the patient has ever had abdominal pain in their medical history."} ;; "abdominal pain"
(declare-const patient_has_finding_of_chronic_intermittent_abdominal_pain_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had chronic intermittent abdominal pain documented in their medical history, regardless of current status.","when_to_set_to_false":"Set to false if the patient has never had chronic intermittent abdominal pain documented in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had chronic intermittent abdominal pain in their history.","meaning":"Boolean indicating whether the patient has ever had chronic intermittent abdominal pain in their medical history."} ;; "chronic intermittent abdominal pain"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_chronic_intermittent_abdominal_pain_inthehistory)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of chronic intermittent abdominal pain."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const duration_of_abdominal_pain_prior_to_first_antibiotic_dose_in_hours Real) ;; {"when_to_set_to_value":"Set to the total number of hours the patient experienced abdominal pain prior to the first antibiotic dose, if known.","when_to_set_to_null":"Set to null if the duration of abdominal pain prior to the first antibiotic dose is unknown, not documented, or cannot be determined.","meaning":"Numeric variable indicating the total duration, in hours, that the patient experienced abdominal pain prior to receiving the first antibiotic dose."} ;; "abdominal pain for greater than forty-eight hours prior to the first antibiotic dose"

(declare-const patient_has_finding_of_abdominal_pain_inthehistory@@duration_greater_than_48_hours_prior_to_first_antibiotic_dose Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding of abdominal pain in the past, and that episode lasted for more than forty-eight hours prior to the first antibiotic dose.","when_to_set_to_false":"Set to false if the patient has had abdominal pain in the past, but the episode did not last more than forty-eight hours prior to the first antibiotic dose.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the episode of abdominal pain lasted more than forty-eight hours prior to the first antibiotic dose.","meaning":"Boolean indicating whether the patient has ever had abdominal pain in the past, and that episode lasted for more than forty-eight hours prior to the first antibiotic dose."} ;; "abdominal pain for greater than forty-eight hours prior to the first antibiotic dose"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Definition: duration qualifier is true iff duration > 48 hours prior to first antibiotic dose
(assert
(! (= patient_has_finding_of_abdominal_pain_inthehistory@@duration_greater_than_48_hours_prior_to_first_antibiotic_dose
     (> duration_of_abdominal_pain_prior_to_first_antibiotic_dose_in_hours 48))
:named REQ1_AUXILIARY0)) ;; "abdominal pain for greater than forty-eight hours prior to the first antibiotic dose"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_abdominal_pain_inthehistory@@duration_greater_than_48_hours_prior_to_first_antibiotic_dose
       patient_has_finding_of_abdominal_pain_inthehistory)
:named REQ1_AUXILIARY1)) ;; "abdominal pain in the history"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_abdominal_pain_inthehistory@@duration_greater_than_48_hours_prior_to_first_antibiotic_dose)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has abdominal pain for greater than forty-eight hours prior to the first antibiotic dose."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_diffuse_peritonitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has diffuse peritonitis.","when_to_set_to_false":"Set to false if the patient currently does not have diffuse peritonitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has diffuse peritonitis.","meaning":"Boolean indicating whether the patient currently has diffuse peritonitis."} ;; "diffuse peritonitis"
(declare-const patient_has_finding_of_peritonitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of peritonitis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of peritonitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of peritonitis.","meaning":"Boolean indicating whether the patient currently has peritonitis."} ;; "peritonitis"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable for "diffuse" implies the stem variable "peritonitis"
(assert
(! (=> patient_has_finding_of_diffuse_peritonitis_now
      patient_has_finding_of_peritonitis_now)
:named REQ2_AUXILIARY0)) ;; "diffuse peritonitis" implies "peritonitis"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_diffuse_peritonitis_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has diffuse peritonitis."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant, as confirmed by a positive urine pregnancy test.","when_to_set_to_false":"Set to false if the patient is currently not pregnant, as confirmed by a negative urine pregnancy test or other reliable evidence.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "positive urine pregnancy test"
(declare-const urine_pregnancy_test_result_value_recorded_now_withunit_binary Real) ;; {"when_to_set_to_value":"Set to 1 if the urine pregnancy test result recorded now is positive; set to 0 if the result is negative.","when_to_set_to_null":"Set to null if the urine pregnancy test result recorded now is unknown, not documented, or cannot be determined.","meaning":"Numeric value (binary) indicating the result of the urine pregnancy test recorded now."} ;; "positive urine pregnancy test"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Definition: pregnancy status is determined by urine pregnancy test result
(assert
(! (= patient_is_pregnant_now
     (= urine_pregnancy_test_result_value_recorded_now_withunit_binary 1))
   :named REQ3_AUXILIARY0)) ;; "positive urine pregnancy test"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_is_pregnant_now)
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a positive urine pregnancy test."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_white_blood_cell_count_value_recorded_now_withunit_cells_per_microliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current white blood cell count in cells per microliter is available.","when_to_set_to_null":"Set to null if no current measurement of white blood cell count in cells per microliter is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current white blood cell count in cells per microliter."} ;; "white blood cell count"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not (<= patient_white_blood_cell_count_value_recorded_now_withunit_cells_per_microliter 5000))
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a white blood cell count less than or equal to five thousand per microliter."

(assert
(! (not (>= patient_white_blood_cell_count_value_recorded_now_withunit_cells_per_microliter 18000))
:named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a white blood cell count greater than or equal to eighteen thousand per microliter."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_fecalith_on_imaging_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a fecalith detected on imaging.","when_to_set_to_false":"Set to false if the patient currently does not have a fecalith detected on imaging.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a fecalith detected on imaging.","meaning":"Boolean indicating whether the patient currently has a fecalith detected on imaging."} ;; "presence of a fecalith on imaging"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_fecalith_on_imaging_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has presence of a fecalith on imaging."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_acute_perforated_appendicitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of acute perforated appendicitis.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of acute perforated appendicitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of acute perforated appendicitis.","meaning":"Boolean indicating whether the patient currently has a finding of acute perforated appendicitis."} ;; "perforated appendicitis"
(declare-const patient_has_finding_of_abscess_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of abscess.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of abscess.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of abscess.","meaning":"Boolean indicating whether the patient currently has a finding of abscess."} ;; "abscess"
(declare-const patient_has_finding_of_phlegmon_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of phlegmon.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of phlegmon.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of phlegmon.","meaning":"Boolean indicating whether the patient currently has a finding of phlegmon."} ;; "phlegmon"
(declare-const patient_has_undergone_imaging_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone imaging studies now.","when_to_set_to_false":"Set to false if the patient has not undergone imaging studies now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone imaging studies now.","meaning":"Boolean indicating whether the patient has undergone imaging studies now."} ;; "imaging"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_abscess_now
           patient_has_finding_of_phlegmon_now)
       patient_has_finding_of_acute_perforated_appendicitis_now)
   :named REQ6_AUXILIARY0)) ;; "with non-exhaustive examples (abscess, phlegmon)"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Exclusion: patient must NOT have evidence on imaging studies concerning for evolving perforated appendicitis
(assert
(! (not (and patient_has_undergone_imaging_now
             patient_has_finding_of_acute_perforated_appendicitis_now))
   :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has evidence on imaging studies concerning for evolving perforated appendicitis with non-exhaustive examples (abscess, phlegmon)."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_difficulty_communicating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any communication difficulties, regardless of cause or severity.","when_to_set_to_false":"Set to false if the patient currently does not have any communication difficulties.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has communication difficulties.","meaning":"Boolean indicating whether the patient currently has communication difficulties."} ;; "communication difficulties"
(declare-const patient_has_finding_of_developmental_delay_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has developmental delay.","when_to_set_to_false":"Set to false if the patient currently does not have developmental delay.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has developmental delay.","meaning":"Boolean indicating whether the patient currently has developmental delay."} ;; "developmental delay"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> patient_has_finding_of_developmental_delay_now
      patient_has_finding_of_difficulty_communicating_now)
   :named REQ7_AUXILIARY0)) ;; "with non-exhaustive examples (severe developmental delay)."

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_finding_of_difficulty_communicating_now)
   :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has communication difficulties with non-exhaustive examples (severe developmental delay)."
