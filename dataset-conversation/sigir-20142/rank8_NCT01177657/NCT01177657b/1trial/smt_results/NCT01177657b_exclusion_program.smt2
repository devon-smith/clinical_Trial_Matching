;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_hospital_control Bool) ;; {"when_to_set_to_true":"Set to true if the patient is classified as a hospital control.","when_to_set_to_false":"Set to false if the patient is not classified as a hospital control.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is classified as a hospital control.","meaning":"Boolean indicating whether the patient is classified as a hospital control."} ;; "the patient is a hospital control"

(declare-const patient_has_symptoms_of_gastroenteritis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms of gastroenteritis.","when_to_set_to_false":"Set to false if the patient currently does not have symptoms of gastroenteritis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptoms of gastroenteritis.","meaning":"Boolean indicating whether the patient currently has symptoms of gastroenteritis."} ;; "the patient has symptoms of gastroenteritis"

(declare-const patient_has_symptoms_of_gastroenteritis_now@@temporalcontext_during_current_hospitalization Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms of gastroenteritis and these symptoms occurred during the current hospitalization.","when_to_set_to_false":"Set to false if the patient currently has symptoms of gastroenteritis but these symptoms did not occur during the current hospitalization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the symptoms occurred during the current hospitalization.","meaning":"Boolean indicating whether the patient's current symptoms of gastroenteritis occurred during the current hospitalization."} ;; "the patient has symptoms of gastroenteritis during the current hospitalization"

(declare-const patient_has_symptoms_of_gastroenteritis_now@@temporalcontext_on_day_of_interview_of_parent_or_guardian Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms of gastroenteritis and these symptoms occurred on the day of interview of the parent or guardian.","when_to_set_to_false":"Set to false if the patient currently has symptoms of gastroenteritis but these symptoms did not occur on the day of interview of the parent or guardian.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the symptoms occurred on the day of interview of the parent or guardian.","meaning":"Boolean indicating whether the patient's current symptoms of gastroenteritis occurred on the day of interview of the parent or guardian."} ;; "the patient has symptoms of gastroenteritis on the day of interview of the parent or guardian of the patient"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_symptoms_of_gastroenteritis_now@@temporalcontext_during_current_hospitalization
      patient_has_symptoms_of_gastroenteritis_now)
:named REQ0_AUXILIARY0)) ;; "symptoms of gastroenteritis during the current hospitalization" implies "symptoms of gastroenteritis now"

(assert
(! (=> patient_has_symptoms_of_gastroenteritis_now@@temporalcontext_on_day_of_interview_of_parent_or_guardian
      patient_has_symptoms_of_gastroenteritis_now)
:named REQ0_AUXILIARY1)) ;; "symptoms of gastroenteritis on the day of interview of parent or guardian" implies "symptoms of gastroenteritis now"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (and patient_is_hospital_control
             (or patient_has_symptoms_of_gastroenteritis_now@@temporalcontext_during_current_hospitalization
                 patient_has_symptoms_of_gastroenteritis_now@@temporalcontext_on_day_of_interview_of_parent_or_guardian)))
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient is a hospital control) AND ((the patient has symptoms of gastroenteritis during the current hospitalization) OR (the patient has symptoms of gastroenteritis on the day of interview of the parent or guardian of the patient)))."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_neighbourhood_control Bool) ;; {"when_to_set_to_true":"Set to true if the patient is classified as a neighbourhood control.","when_to_set_to_false":"Set to false if the patient is not classified as a neighbourhood control.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is classified as a neighbourhood control.","meaning":"Boolean indicating whether the patient is classified as a neighbourhood control."} ;; "the patient is a neighbourhood control"
(declare-const patient_has_symptoms_of_gastroenteritis_now@@temporalcontext_on_day_of_interview_of_parent_or_guardian Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms of gastroenteritis and these symptoms occurred on the day of interview of the parent or guardian.","when_to_set_to_false":"Set to false if the patient currently has symptoms of gastroenteritis but these symptoms did not occur on the day of interview of the parent or guardian.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the symptoms occurred on the day of interview of the parent or guardian.","meaning":"Boolean indicating whether the patient's current symptoms of gastroenteritis occurred on the day of interview of the parent or guardian."} ;; "the patient has symptoms of gastroenteritis on the day of interview of the parent or guardian of the patient"
(declare-const patient_has_symptoms_of_severe_gastroenteritis_now@@temporalcontext_on_day_of_interview_of_parent_or_guardian Bool) ;; {"when_to_set_to_true":"Set to true if the patient has symptoms of severe gastroenteritis on the day of interview of the parent or guardian.","when_to_set_to_false":"Set to false if the patient does not have symptoms of severe gastroenteritis on the day of interview of the parent or guardian.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has symptoms of severe gastroenteritis on the day of interview of the parent or guardian.","meaning":"Boolean indicating whether the patient has symptoms of severe gastroenteritis on the day of interview of the parent or guardian."} ;; "the patient has symptoms of severe gastroenteritis on the day of interview of the parent or guardian of the patient"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not (and patient_is_neighbourhood_control
             (or patient_has_symptoms_of_gastroenteritis_now@@temporalcontext_on_day_of_interview_of_parent_or_guardian
                 patient_has_symptoms_of_severe_gastroenteritis_now@@temporalcontext_on_day_of_interview_of_parent_or_guardian)))
    :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient is a neighbourhood control) AND ((the patient has symptoms of gastroenteritis on the day of interview of the parent or guardian of the patient) OR (the patient has symptoms of severe gastroenteritis on the day of interview of the parent or guardian of the patient)))."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_measles_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with measles at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with measles at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with measles.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of measles in their medical history."} ;; "measles"
(declare-const patient_has_diagnosis_of_mumps_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with mumps at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with mumps at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with mumps.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of mumps in their medical history."} ;; "mumps"
(declare-const patient_has_diagnosis_of_rubella_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with rubella at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with rubella at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with rubella.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of rubella in their medical history."} ;; "rubella"
(declare-const patient_has_diagnosis_of_diphtheria_due_to_corynebacterium_diphtheriae_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with diphtheria due to Corynebacterium diphtheriae at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with diphtheria due to Corynebacterium diphtheriae at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with diphtheria due to Corynebacterium diphtheriae.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of diphtheria due to Corynebacterium diphtheriae in their medical history."} ;; "diphtheria"
(declare-const patient_has_diagnosis_of_pertussis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with pertussis at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with pertussis at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with pertussis.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of pertussis in their medical history."} ;; "pertussis"
(declare-const patient_has_diagnosis_of_tetanus_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with tetanus at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with tetanus at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with tetanus.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of tetanus in their medical history."} ;; "tetanus"
(declare-const patient_has_diagnosis_of_tuberculosis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with tuberculosis at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with tuberculosis at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with tuberculosis.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of tuberculosis in their medical history."} ;; "tuberculosis"
(declare-const patient_has_diagnosis_of_haemophilus_influenzae_type_b_invasive_infection_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with invasive Haemophilus influenzae type B infection or any of its exhaustive subcategories (meningitis, bacteraemia, septic arthritis, cellulitis, epiglottitis) at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with invasive Haemophilus influenzae type B infection or any of its exhaustive subcategories at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with invasive Haemophilus influenzae type B infection or any of its exhaustive subcategories.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of invasive Haemophilus influenzae type B infection or any of its exhaustive subcategories in their medical history."} ;; "invasive Haemophilus influenzae type B infection (meningitis, bacteraemia, septic arthritis, cellulitis, and epiglottitis)"
(declare-const patient_has_diagnosis_of_type_b_viral_hepatitis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with hepatitis B at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with hepatitis B at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with hepatitis B.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of hepatitis B in their medical history."} ;; "hepatitis B"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_diagnosis_of_measles_inthehistory)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has measles."

(assert
(! (not patient_has_diagnosis_of_mumps_inthehistory)
:named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has mumps."

(assert
(! (not patient_has_diagnosis_of_rubella_inthehistory)
:named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has rubella."

(assert
(! (not patient_has_diagnosis_of_diphtheria_due_to_corynebacterium_diphtheriae_inthehistory)
:named REQ2_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has diphtheria."

(assert
(! (not patient_has_diagnosis_of_pertussis_inthehistory)
:named REQ2_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has pertussis."

(assert
(! (not patient_has_diagnosis_of_tetanus_inthehistory)
:named REQ2_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has tetanus."

(assert
(! (not patient_has_diagnosis_of_tuberculosis_inthehistory)
:named REQ2_COMPONENT6_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has tuberculosis."

(assert
(! (not patient_has_diagnosis_of_haemophilus_influenzae_type_b_invasive_infection_inthehistory)
:named REQ2_COMPONENT7_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has invasive Haemophilus influenzae type B infection (meningitis, bacteraemia, septic arthritis, cellulitis, and epiglottitis)."

(assert
(! (not patient_has_diagnosis_of_type_b_viral_hepatitis_inthehistory)
:named REQ2_COMPONENT8_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hepatitis B."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_participated_in_this_study_as_case_in_the_past Bool) ;; {"when_to_set_to_true":"Set to true if the patient has previously participated in this study as a case.","when_to_set_to_false":"Set to false if the patient has not previously participated in this study as a case.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has previously participated in this study as a case.","meaning":"Boolean indicating whether the patient has previously participated in this study as a case."} ;; "has participated in the past as a case in this study"
(declare-const patient_has_participated_in_this_study_as_control_in_the_past Bool) ;; {"when_to_set_to_true":"Set to true if the patient has previously participated in this study as a control.","when_to_set_to_false":"Set to false if the patient has not previously participated in this study as a control.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has previously participated in this study as a control.","meaning":"Boolean indicating whether the patient has previously participated in this study as a control."} ;; "has participated in the past as a control in this study"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_participated_in_this_study_as_case_in_the_past)
    :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has participated in the past as a case in this study."

(assert
(! (not patient_has_participated_in_this_study_as_control_in_the_past)
    :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has participated in the past as a control in this study."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_lives_in_same_house_as_case_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently lives in the same house as the case.","when_to_set_to_false":"Set to false if the patient currently does not live in the same house as the case.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently lives in the same house as the case.","meaning":"Boolean indicating whether the patient currently lives in the same house as the case."} ;; "The patient lives in the same house as the case."

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_lives_in_same_house_as_case_now)
    :named REQ4_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient lives in the same house as the case."
