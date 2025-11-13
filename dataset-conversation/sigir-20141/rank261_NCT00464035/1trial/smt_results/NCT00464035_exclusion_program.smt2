;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_undergone_whole_blood_unit_collection_inthehistory@@temporalcontext_within_6_months_before_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone whole blood unit collection within the 6 months before the study start.","when_to_set_to_false":"Set to false if the patient has not undergone whole blood unit collection within the 6 months before the study start.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone whole blood unit collection within the 6 months before the study start.","meaning":"Boolean indicating whether the patient has undergone whole blood unit collection within the 6 months before the study start."} ;; "the patient has donated blood within 6 months before the study"
(declare-const patient_has_undergone_whole_blood_unit_collection_inthehistory@@temporalcontext_during_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone whole blood unit collection during the study period.","when_to_set_to_false":"Set to false if the patient has not undergone whole blood unit collection during the study period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone whole blood unit collection during the study period.","meaning":"Boolean indicating whether the patient has undergone whole blood unit collection during the study period."} ;; "the patient has donated blood during the study"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (and patient_has_undergone_whole_blood_unit_collection_inthehistory@@temporalcontext_within_6_months_before_study
             patient_has_undergone_whole_blood_unit_collection_inthehistory@@temporalcontext_during_study))
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has donated blood within 6 months before the study) AND (the patient has donated blood during the study)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_milk_allergy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of milk allergy.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of milk allergy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of milk allergy.","meaning":"Boolean indicating whether the patient currently has a diagnosis of milk allergy."} ;; "milk allergy"
(declare-const patient_has_diagnosis_of_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has a diagnosis of diabetes mellitus."} ;; "diabetes mellitus"
(declare-const patient_has_diagnosis_of_hypertensive_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of hypertensive disorder (hypertension).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of hypertensive disorder (hypertension).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of hypertensive disorder (hypertension).","meaning":"Boolean indicating whether the patient currently has a diagnosis of hypertensive disorder (hypertension)."} ;; "hypertension"
(declare-const patient_has_diagnosis_of_hyperlipidemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of hyperlipidemia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of hyperlipidemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of hyperlipidemia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of hyperlipidemia."} ;; "hyperlipidemia"
(declare-const patient_has_diagnosis_of_chronic_infectious_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of chronic infectious disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of chronic infectious disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of chronic infectious disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of chronic infectious disease."} ;; "chronic infectious disease"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (not (or patient_has_diagnosis_of_milk_allergy_now
              patient_has_diagnosis_of_diabetes_mellitus_now
              patient_has_diagnosis_of_hypertensive_disorder_now
              patient_has_diagnosis_of_hyperlipidemia_now
              patient_has_diagnosis_of_chronic_infectious_disease_now))
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has at least one of the following conditions with non-exhaustive examples (milk allergy OR diabetes mellitus OR hypertension OR hyperlipidemia OR chronic infectious disease)."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_exposed_to_nutritional_supplement_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient was exposed to nutritional supplements within the past 3 months before the study.","when_to_set_to_false":"Set to false if the patient was not exposed to nutritional supplements within the past 3 months before the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was exposed to nutritional supplements within the past 3 months before the study.","meaning":"Boolean indicating whether the patient was exposed to nutritional supplements within the past 3 months before the study."} ;; "the patient has used dietary supplements within 3 months before the study"
(declare-const patient_is_exposed_to_nutritional_supplement_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is exposed to nutritional supplements during the study period.","when_to_set_to_false":"Set to false if the patient is not exposed to nutritional supplements during the study period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is exposed to nutritional supplements during the study period.","meaning":"Boolean indicating whether the patient is exposed to nutritional supplements during the study period."} ;; "the patient has used dietary supplements during the study"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Exclusion: patient must NOT have BOTH (used dietary supplements within 3 months before the study) AND (used dietary supplements during the study)
(assert
(! (not (and patient_is_exposed_to_nutritional_supplement_inthepast3months
             patient_is_exposed_to_nutritional_supplement_now))
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has used dietary supplements within 3 months before the study) AND (the patient has used dietary supplements during the study)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_smoker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a smoker.","when_to_set_to_false":"Set to false if the patient is currently not a smoker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a smoker.","meaning":"Boolean indicating whether the patient is currently a smoker."} ;; "smoker"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_smoker_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a smoker."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_is_elite_athlete Bool) ;; {"when_to_set_to_true":"Set to true if the patient is considered an elite athlete.","when_to_set_to_false":"Set to false if the patient is not considered an elite athlete.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is considered an elite athlete.","meaning":"Boolean indicating whether the patient is considered an elite athlete."} ;; "The patient is excluded if the patient is an elite athlete."

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_is_elite_athlete)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is an elite athlete."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_uses_medication_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using any medication.","when_to_set_to_false":"Set to false if the patient is currently not using any medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using any medication.","meaning":"Boolean indicating whether the patient is currently using any medication."} ;; "The patient is excluded if the patient uses medication."

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_uses_medication_now)
    :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient uses medication."
