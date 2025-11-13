;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_participating_in_randomized_controlled_trial_run_by_cardiology_department_of_university_hospital_of_bern_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently participating in any randomized-controlled trial that is run by the Cardiology Department of the University Hospital of Bern.","when_to_set_to_false":"Set to false if the patient is currently not participating in any randomized-controlled trial that is run by the Cardiology Department of the University Hospital of Bern.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently participating in any randomized-controlled trial that is run by the Cardiology Department of the University Hospital of Bern.","meaning":"Boolean indicating whether the patient is currently participating in any randomized-controlled trial that is run by the Cardiology Department of the University Hospital of Bern."} ;; "The patient is excluded if the patient is participating in any other randomized-controlled trial run by the Cardiology Department of the University Hospital of Bern."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_is_participating_in_randomized_controlled_trial_run_by_cardiology_department_of_university_hospital_of_bern_now)
:named REQ0_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is participating in any other randomized-controlled trial run by the Cardiology Department of the University Hospital of Bern."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_undergone_emergency_cabg_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone an emergency coronary artery bypass graft surgery at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never undergone an emergency coronary artery bypass graft surgery at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone an emergency coronary artery bypass graft surgery.","meaning":"Boolean indicating whether the patient has ever undergone an emergency coronary artery bypass graft surgery in their history."} ;; "emergency coronary artery bypass graft surgery"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_undergone_emergency_cabg_inthehistory)
    :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has undergone emergency coronary artery bypass graft surgery."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a comorbid serious disease.","when_to_set_to_false":"Set to false if the patient currently does not have a comorbid serious disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a comorbid serious disease.","meaning":"Boolean indicating whether the patient currently has a comorbid serious disease."} ;; "the patient has a comorbid serious disease"
(declare-const patient_has_finding_of_disease_now@@likely_to_cause_death_within_1_year Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a comorbid serious disease and that disease is likely to cause death within 1 year.","when_to_set_to_false":"Set to false if the patient currently has a comorbid serious disease but it is not likely to cause death within 1 year.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the comorbid serious disease is likely to cause death within 1 year.","meaning":"Boolean indicating whether the patient's comorbid serious disease is likely to cause death within 1 year."} ;; "the comorbid serious disease is likely to cause death within 1 year"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_disease_now@@likely_to_cause_death_within_1_year
      patient_has_finding_of_disease_now)
:named REQ2_AUXILIARY0)) ;; "the comorbid serious disease is likely to cause death within 1 year" implies "the patient has a comorbid serious disease"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_disease_now@@likely_to_cause_death_within_1_year)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a comorbid serious disease) AND (the comorbid serious disease is likely to cause death within 1 year)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_depressive_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a depressive disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a depressive disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a depressive disorder.","meaning":"Boolean indicating whether the patient currently has a depressive disorder."} ;; "depressive disorder"
(declare-const patient_has_finding_of_depressive_disorder_now@@clinically_severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a depressive disorder and it is clinically severe.","when_to_set_to_false":"Set to false if the patient currently has a depressive disorder but it is not clinically severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the depressive disorder is clinically severe.","meaning":"Boolean indicating whether the patient's current depressive disorder is clinically severe."} ;; "clinically severe depressive disorder"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_depressive_disorder_now@@clinically_severe
      patient_has_finding_of_depressive_disorder_now)
:named REQ3_AUXILIARY0)) ;; "clinically severe depressive disorder" implies "depressive disorder"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_depressive_disorder_now@@clinically_severe)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has current clinically severe depressive disorder."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_disorientated_in_place_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently disoriented with respect to place (not fully oriented to place).","when_to_set_to_false":"Set to false if the patient is currently fully oriented to place.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently disoriented with respect to place.","meaning":"Boolean indicating whether the patient is currently disoriented with respect to place."} ;; "NOT fully oriented to the place"
(declare-const patient_has_finding_of_disorientated_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently disoriented (not fully oriented to situation, person, or place).","when_to_set_to_false":"Set to false if the patient is currently fully oriented (to situation, person, and place).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently disoriented.","meaning":"Boolean indicating whether the patient is currently disoriented (not fully oriented to situation, person, or place)."} ;; "NOT fully oriented"
(declare-const patient_has_finding_of_disorientation_for_person_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently disoriented with respect to person (not fully oriented to person).","when_to_set_to_false":"Set to false if the patient is currently fully oriented to person.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently disoriented with respect to person.","meaning":"Boolean indicating whether the patient is currently disoriented with respect to person."} ;; "NOT fully oriented to the person"
(declare-const patient_has_finding_of_disorientation_for_situation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently disoriented with respect to situation (not fully oriented to situation).","when_to_set_to_false":"Set to false if the patient is currently fully oriented to situation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently disoriented with respect to situation.","meaning":"Boolean indicating whether the patient is currently disoriented with respect to situation."} ;; "NOT fully oriented to the situation"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Definition: patient is disoriented if disoriented in any domain (situation, person, place)
(assert
(! (= patient_has_finding_of_disorientated_now
(or patient_has_finding_of_disorientation_for_situation_now
    patient_has_finding_of_disorientation_for_person_now
    patient_has_finding_of_disorientated_in_place_now))
:named REQ4_AUXILIARY0)) ;; "NOT fully oriented to the situation, person, or place"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Exclusion: patient must NOT be disoriented in all three domains (situation AND person AND place)
(assert
(! (not (and patient_has_finding_of_disorientation_for_situation_now
             patient_has_finding_of_disorientation_for_person_now
             patient_has_finding_of_disorientated_in_place_now))
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is NOT fully oriented to the situation) AND (the patient is NOT fully oriented to the person) AND (the patient is NOT fully oriented to the place)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_impaired_cognition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of cognitive impairment.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of cognitive impairment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of cognitive impairment.","meaning":"Boolean indicating whether the patient currently has cognitive impairment."} ;; "cognitive impairment"
(declare-const patient_has_finding_of_impaired_cognition_now@@according_to_adapted_short_version_of_mini_mental_state_examination Bool) ;; {"when_to_set_to_true":"Set to true if the patient's cognitive impairment is determined according to an adapted short version of the Mini-Mental State Examination.","when_to_set_to_false":"Set to false if the patient's cognitive impairment is not determined according to an adapted short version of the Mini-Mental State Examination.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the cognitive impairment finding is according to an adapted short version of the Mini-Mental State Examination.","meaning":"Boolean indicating whether the patient's cognitive impairment finding is according to an adapted short version of the Mini-Mental State Examination."} ;; "according to an adapted short version of the Mini-Mental State Examination"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_impaired_cognition_now@@according_to_adapted_short_version_of_mini_mental_state_examination
      patient_has_finding_of_impaired_cognition_now)
   :named REQ5_AUXILIARY0)) ;; "according to an adapted short version of the Mini-Mental State Examination"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_impaired_cognition_now@@according_to_adapted_short_version_of_mini_mental_state_examination)
   :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has cognitive impairment according to an adapted short version of the Mini-Mental State Examination."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patients_reading_is_negative_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has insufficient knowledge of German language in reading.","when_to_set_to_false":"Set to false if the patient currently has sufficient knowledge of German language in reading.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has insufficient knowledge of German language in reading.","meaning":"Boolean indicating whether the patient currently has insufficient knowledge of German language in reading."} ;; "the patient has insufficient knowledge of German language in reading"
(declare-const patients_understanding_is_negative_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has insufficient knowledge of German language in understanding.","when_to_set_to_false":"Set to false if the patient currently has sufficient knowledge of German language in understanding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has insufficient knowledge of German language in understanding.","meaning":"Boolean indicating whether the patient currently has insufficient knowledge of German language in understanding."} ;; "the patient has insufficient knowledge of German language in understanding"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not (and patients_reading_is_negative_now patients_understanding_is_negative_now))
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has insufficient knowledge of German language in reading) AND (the patient has insufficient knowledge of German language in understanding)."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_suicidal_thoughts_inthepast2weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had suicidal thoughts at any time in the past two weeks.","when_to_set_to_false":"Set to false if the patient has not had suicidal thoughts at any time in the past two weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had suicidal thoughts in the past two weeks.","meaning":"Boolean indicating whether the patient has had suicidal thoughts in the past two weeks."} ;; "suicidal ideation in the last two weeks"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_finding_of_suicidal_thoughts_inthepast2weeks)
    :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has affirmation of suicidal ideation in the last two weeks."
