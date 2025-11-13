;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_provided_informed_consent_prior_to_study_specific_procedures Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided informed consent before any study-specific procedures are performed.","when_to_set_to_false":"Set to false if the patient has not provided informed consent before any study-specific procedures are performed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided informed consent prior to any study-specific procedures.","meaning":"Boolean indicating whether the patient has provided informed consent prior to any study-specific procedures."}  ;; "To be included, the patient must provide informed consent prior to any study-specific procedures."
(declare-const patient_has_provided_informed_consent_prior_to_study_specific_procedures@@prior_to_any_study_specific_procedures Bool) ;; {"when_to_set_to_true":"Set to true if the patient's informed consent was provided before any study-specific procedures.","when_to_set_to_false":"Set to false if the patient's informed consent was not provided before any study-specific procedures.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's informed consent was provided before any study-specific procedures.","meaning":"Boolean indicating whether the patient's informed consent was provided before any study-specific procedures."}  ;; "To be included, the patient must provide informed consent prior to any study-specific procedures."

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies the stem variable
(assert
  (! (=> patient_has_provided_informed_consent_prior_to_study_specific_procedures@@prior_to_any_study_specific_procedures
         patient_has_provided_informed_consent_prior_to_study_specific_procedures)
     :named REQ0_AUXILIARY0)) ;; "To be included, the patient must provide informed consent prior to any study-specific procedures."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_provided_informed_consent_prior_to_study_specific_procedures@@prior_to_any_study_specific_procedures
     :named REQ0_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must provide informed consent prior to any study-specific procedures."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female (i.e., male or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is female."}  ;; "be female"
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as male.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not male (i.e., female or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is male."}  ;; "be male"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "be aged ≥ 18 years AND be aged ≤ 80 years"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must ((be female) OR (be male AND be aged ≥ 18 years AND be aged ≤ 80 years)).
(assert
  (! (or patient_sex_is_female_now
         (and patient_sex_is_male_now
              (>= patient_age_value_recorded_now_in_years 18.0)
              (<= patient_age_value_recorded_now_in_years 80.0)))
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must ((be female) OR (be male AND be aged ≥ 18 years AND be aged ≤ 80 years))."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_acute_coronary_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of acute coronary syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of acute coronary syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of acute coronary syndrome.","meaning":"Boolean indicating whether the patient currently has a diagnosis of acute coronary syndrome."}  ;; "have acute coronary syndrome"
(declare-const patient_has_diagnosis_of_st_elevation_myocardial_infarction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of ST elevation myocardial infarction.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of ST elevation myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of ST elevation myocardial infarction.","meaning":"Boolean indicating whether the patient currently has a diagnosis of ST elevation myocardial infarction."}  ;; "defined as ST elevation myocardial infarction"
(declare-const patient_has_diagnosis_of_non_st_elevation_myocardial_infarction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of non-ST elevation myocardial infarction.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of non-ST elevation myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of non-ST elevation myocardial infarction.","meaning":"Boolean indicating whether the patient currently has a diagnosis of non-ST elevation myocardial infarction."}  ;; "defined as non-ST elevation myocardial infarction"
(declare-const patient_has_undergone_percutaneous_coronary_intervention_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone percutaneous coronary intervention at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone percutaneous coronary intervention at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone percutaneous coronary intervention.","meaning":"Boolean indicating whether the patient has ever undergone percutaneous coronary intervention at any time in the past."}  ;; "have been treated with percutaneous coronary intervention"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Definition in the requirement: acute coronary syndrome ≡ (STEMI OR NSTEMI)
(assert
  (! (= patient_has_diagnosis_of_acute_coronary_syndrome_now
        (or patient_has_diagnosis_of_st_elevation_myocardial_infarction_now
            patient_has_diagnosis_of_non_st_elevation_myocardial_infarction_now))
     :named REQ2_AUXILIARY0)) ;; "acute coronary syndrome (defined as ST elevation myocardial infarction OR non-ST elevation myocardial infarction)"

;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_diagnosis_of_st_elevation_myocardial_infarction_now
         patient_has_diagnosis_of_acute_coronary_syndrome_now)
     :named REQ2_AUXILIARY1)) ;; "ST elevation myocardial infarction is a type of acute coronary syndrome"

(assert
  (! (=> patient_has_diagnosis_of_non_st_elevation_myocardial_infarction_now
         patient_has_diagnosis_of_acute_coronary_syndrome_now)
     :named REQ2_AUXILIARY2)) ;; "non-ST elevation myocardial infarction is a type of acute coronary syndrome"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: Must have acute coronary syndrome (as defined)
(assert
  (! patient_has_diagnosis_of_acute_coronary_syndrome_now
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "have acute coronary syndrome (defined as ST elevation myocardial infarction OR non-ST elevation myocardial infarction)"

;; Component 1: Must have been treated with percutaneous coronary intervention
(assert
  (! patient_has_undergone_percutaneous_coronary_intervention_inthehistory
     :named REQ2_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "have been treated with percutaneous coronary intervention"

;; ===================== Declarations for the inclusion criteria (REQ 3) =====================
(declare-const patient_has_diagnosis_of_hypertensive_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with hypertensive disorder (hypertension) at any time in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with hypertensive disorder (hypertension) in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with hypertensive disorder (hypertension).","meaning":"Boolean indicating whether the patient has ever been diagnosed with hypertensive disorder (hypertension) in their medical history."} ;; "have a medical history of treated (ongoing) hypertension"
(declare-const patient_has_diagnosis_of_hypertensive_disorder_inthehistory@@ongoing Bool) ;; {"when_to_set_to_true":"Set to true if the patient's historical diagnosis of hypertensive disorder (hypertension) is ongoing.","when_to_set_to_false":"Set to false if the patient's historical diagnosis of hypertensive disorder (hypertension) is not ongoing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's historical diagnosis of hypertensive disorder (hypertension) is ongoing.","meaning":"Boolean indicating whether the patient's historical diagnosis of hypertensive disorder (hypertension) is ongoing."} ;; "have a medical history of treated (ongoing) hypertension"
(declare-const patient_has_diagnosis_of_hypertensive_disorder_inthehistory@@treated Bool) ;; {"when_to_set_to_true":"Set to true if the patient's historical diagnosis of hypertensive disorder (hypertension) is treated.","when_to_set_to_false":"Set to false if the patient's historical diagnosis of hypertensive disorder (hypertension) is not treated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's historical diagnosis of hypertensive disorder (hypertension) is treated.","meaning":"Boolean indicating whether the patient's historical diagnosis of hypertensive disorder (hypertension) is treated."} ;; "have a medical history of treated (ongoing) hypertension"
(declare-const patient_has_diagnosis_of_hypertensive_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of hypertensive disorder (hypertension).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of hypertensive disorder (hypertension).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of hypertensive disorder (hypertension).","meaning":"Boolean indicating whether the patient currently has a diagnosis of hypertensive disorder (hypertension)."} ;; "have hypertension discovered at the time of acute coronary syndrome"
(declare-const patient_has_diagnosis_of_hypertensive_disorder_now@@discovered_at_time_of_acute_coronary_syndrome Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of hypertensive disorder (hypertension) was discovered at the time of acute coronary syndrome.","when_to_set_to_false":"Set to false if the patient's current diagnosis of hypertensive disorder (hypertension) was not discovered at the time of acute coronary syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis was discovered at the time of acute coronary syndrome.","meaning":"Boolean indicating whether the patient's current diagnosis of hypertensive disorder (hypertension) was discovered at the time of acute coronary syndrome."} ;; "have hypertension discovered at the time of acute coronary syndrome"
(declare-const patient_systolic_blood_pressure_value_recorded_now_withunit_mmhg Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's office systolic blood pressure is recorded now in mmHg.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's office systolic blood pressure recorded now in mmHg."} ;; "have office systolic blood pressure > 140 mmHg"
(declare-const patient_is_taking_hypotensive_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any hypotensive agent (antihypertensive drug).","when_to_set_to_false":"Set to false if the patient is currently not taking any hypotensive agent (antihypertensive drug).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any hypotensive agent (antihypertensive drug).","meaning":"Boolean indicating whether the patient is currently taking any hypotensive agent (antihypertensive drug)."} ;; "be receiving treatment with three antihypertensive drugs"
(declare-const patient_is_taking_hypotensive_agent_now@@receiving_treatment_with_three Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving treatment with three antihypertensive drugs.","when_to_set_to_false":"Set to false if the patient is currently receiving treatment with fewer or more than three antihypertensive drugs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many antihypertensive drugs the patient is currently receiving treatment with.","meaning":"Boolean indicating whether the patient is currently receiving treatment with three antihypertensive drugs."} ;; "be receiving treatment with three antihypertensive drugs"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply their stem variables
(assert
  (! (=> patient_has_diagnosis_of_hypertensive_disorder_inthehistory@@ongoing
         patient_has_diagnosis_of_hypertensive_disorder_inthehistory)
     :named REQ3_AUXILIARY0)) ;; "ongoing" implies history

(assert
  (! (=> patient_has_diagnosis_of_hypertensive_disorder_inthehistory@@treated
         patient_has_diagnosis_of_hypertensive_disorder_inthehistory)
     :named REQ3_AUXILIARY1)) ;; "treated" implies history

(assert
  (! (=> patient_has_diagnosis_of_hypertensive_disorder_now@@discovered_at_time_of_acute_coronary_syndrome
         patient_has_diagnosis_of_hypertensive_disorder_now)
     :named REQ3_AUXILIARY2)) ;; "discovered at time of ACS" implies current diagnosis

(assert
  (! (=> patient_is_taking_hypotensive_agent_now@@receiving_treatment_with_three
         patient_is_taking_hypotensive_agent_now)
     :named REQ3_AUXILIARY3)) ;; "receiving treatment with three" implies taking antihypertensive

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: ((history of treated ongoing hypertension) OR (hypertension discovered at ACS))
(assert
  (! (or (and patient_has_diagnosis_of_hypertensive_disorder_inthehistory@@ongoing
              patient_has_diagnosis_of_hypertensive_disorder_inthehistory@@treated)
         patient_has_diagnosis_of_hypertensive_disorder_now@@discovered_at_time_of_acute_coronary_syndrome)
     :named REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "((have a medical history of treated (ongoing) hypertension) OR (have hypertension discovered at the time of acute coronary syndrome))"

;; Component 1: office systolic blood pressure > 140 mmHg
(assert
  (! (> patient_systolic_blood_pressure_value_recorded_now_withunit_mmhg 140.0)
     :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "have office systolic blood pressure > 140 mmHg"

;; Component 2: receiving treatment with three antihypertensive drugs
(assert
  (! patient_is_taking_hypotensive_agent_now@@receiving_treatment_with_three
     :named REQ3_COMPONENT2_OTHER_REQUIREMENTS)) ;; "be receiving treatment with three antihypertensive drugs"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_cardiac_ejection_fraction_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured percentage value if a numeric measurement of the patient's cardiac ejection fraction recorded now is available.","when_to_set_to_null":"Set to null if no such percentage measurement recorded now is available or the value is indeterminate.","meaning":"Numeric percentage representing the patient's current cardiac ejection fraction."}  ;; "To be included, the patient must have ejection fraction > 40 percent."

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (> patient_cardiac_ejection_fraction_value_recorded_now_withunit_percent 40.0)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have ejection fraction > 40 percent."
