;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_undergone_whole_blood_unit_collection_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone whole blood unit collection (donated blood) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone whole blood unit collection (donated blood) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone whole blood unit collection (donated blood) in the past.","meaning":"Boolean indicating whether the patient has ever undergone whole blood unit collection (donated blood) in the past."} ;; "donated blood"

(declare-const patient_has_undergone_whole_blood_unit_collection_inthehistory@@temporalcontext_within3months_before_study_start Bool) ;; {"when_to_set_to_true":"Set to true if the patient's whole blood unit collection (donated blood) occurred within the three months prior to the study start.","when_to_set_to_false":"Set to false if the patient's whole blood unit collection (donated blood) did not occur within the three months prior to the study start.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's whole blood unit collection (donated blood) occurred within the three months prior to the study start.","meaning":"Boolean indicating whether the patient's whole blood unit collection (donated blood) occurred within the three months prior to the study start."} ;; "donated blood within three months prior to the study"

(declare-const patient_has_undergone_whole_blood_unit_collection_inthehistory@@temporalcontext_during_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient's whole blood unit collection (donated blood) occurred during the study period.","when_to_set_to_false":"Set to false if the patient's whole blood unit collection (donated blood) did not occur during the study period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's whole blood unit collection (donated blood) occurred during the study period.","meaning":"Boolean indicating whether the patient's whole blood unit collection (donated blood) occurred during the study period."} ;; "donated blood during the study"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_undergone_whole_blood_unit_collection_inthehistory@@temporalcontext_within3months_before_study_start
      patient_has_undergone_whole_blood_unit_collection_inthehistory)
:named REQ0_AUXILIARY0)) ;; "donated blood within three months prior to the study"

(assert
(! (=> patient_has_undergone_whole_blood_unit_collection_inthehistory@@temporalcontext_during_study
      patient_has_undergone_whole_blood_unit_collection_inthehistory)
:named REQ0_AUXILIARY1)) ;; "donated blood during the study"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (or patient_has_undergone_whole_blood_unit_collection_inthehistory@@temporalcontext_within3months_before_study_start
            patient_has_undergone_whole_blood_unit_collection_inthehistory@@temporalcontext_during_study))
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has donated blood within three months prior to the study) OR (the patient has donated blood during the study)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_disorder_of_gastrointestinal_tract_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder of the gastrointestinal tract.","when_to_set_to_false":"Set to false if the patient currently does not have a disorder of the gastrointestinal tract.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder of the gastrointestinal tract.","meaning":"Boolean indicating whether the patient currently has a disorder of the gastrointestinal tract."} ;; "gastrointestinal disorder"
(declare-const patient_has_finding_of_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has diabetes mellitus."} ;; "diabetes mellitus"
(declare-const patient_has_finding_of_hypertensive_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a hypertensive disorder (hypertension).","when_to_set_to_false":"Set to false if the patient currently does not have a hypertensive disorder (hypertension).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a hypertensive disorder (hypertension).","meaning":"Boolean indicating whether the patient currently has a hypertensive disorder (hypertension)."} ;; "hypertension"
(declare-const patient_has_finding_of_hyperlipidemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hyperlipidemia.","when_to_set_to_false":"Set to false if the patient currently does not have hyperlipidemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hyperlipidemia.","meaning":"Boolean indicating whether the patient currently has hyperlipidemia."} ;; "hyperlipidemia"
(declare-const patient_has_finding_of_chronic_infectious_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a chronic infectious disease.","when_to_set_to_false":"Set to false if the patient currently does not have a chronic infectious disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a chronic infectious disease.","meaning":"Boolean indicating whether the patient currently has a chronic infectious disease."} ;; "chronic infectious disease"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_disorder_of_gastrointestinal_tract_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a gastrointestinal disorder."

(assert
(! (not patient_has_finding_of_diabetes_mellitus_now)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has diabetes mellitus."

(assert
(! (not patient_has_finding_of_hypertensive_disorder_now)
:named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hypertension."

(assert
(! (not patient_has_finding_of_hyperlipidemia_now)
:named REQ1_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hyperlipidemia."

(assert
(! (not patient_has_finding_of_chronic_infectious_disease_now)
:named REQ1_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a chronic infectious disease."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_tobacco_smoking_behavior_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently smoking (i.e., has a positive tobacco smoking behavior finding now).","when_to_set_to_false":"Set to false if the patient is currently not smoking (i.e., does not have a tobacco smoking behavior finding now).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently smoking.","meaning":"Boolean indicating whether the patient is currently smoking (tobacco smoking behavior finding present now)."} ;; "smoking"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_tobacco_smoking_behavior_finding_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is smoking."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_alcoholic_beverage_value_recorded_inthehistory_withunit_drinks_per_week Real) ;; {"when_to_set_to_value":"Set to the recorded number of alcoholic drinks consumed per week if such a measurement or documentation exists in the patient's history.","when_to_set_to_null":"Set to null if no such measurement or documentation exists or the value is indeterminate.","meaning":"Numeric value representing the number of alcoholic drinks the patient consumes per week, as recorded in their history."} ;; "alcoholic drinks per week"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not (> patient_alcoholic_beverage_value_recorded_inthehistory_withunit_drinks_per_week 21))
:named REQ3_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient consumes more than twenty-one alcoholic drinks per week."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_is_elite_athlete_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently an elite athlete.","when_to_set_to_false":"Set to false if the patient is currently not an elite athlete.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently an elite athlete.","meaning":"Boolean indicating whether the patient is currently an elite athlete."} ;; "the patient is an elite athlete"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (not patient_is_elite_athlete_now)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is an elite athlete."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_is_taking_drug_or_medicament_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any drug or medicament.","when_to_set_to_false":"Set to false if the patient is currently not taking any drug or medicament.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any drug or medicament.","meaning":"Boolean indicating whether the patient is currently taking any drug or medicament."} ;; "the patient is taking medication"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_is_taking_drug_or_medicament_now)
:named REQ5_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is taking medication."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_is_taking_nutritional_supplement_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking nutritional supplements.","when_to_set_to_false":"Set to false if the patient is currently not taking nutritional supplements.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking nutritional supplements.","meaning":"Boolean indicating whether the patient is currently taking nutritional supplements."} ;; "diet supplements"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_is_taking_nutritional_supplement_now)
:named REQ6_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is taking diet supplements."
