;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_sleep_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a sleep disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a sleep disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a sleep disorder.","meaning":"Boolean indicating whether the patient currently has a sleep disorder."} ;; "sleep disorder"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_sleep_disorder_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a sleep disorder."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_overweight_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently overweight.","when_to_set_to_false":"Set to false if the patient is currently not overweight.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently overweight.","meaning":"Boolean indicating whether the patient is currently overweight."} ;; "overweight"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_overweight_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is overweight."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has a diagnosis of diabetes mellitus."} ;; "diabetes"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_diagnosis_of_diabetes_mellitus_now)
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has diabetes."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_disease_condition_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disease, condition, or clinical finding (i.e., any health condition).","when_to_set_to_false":"Set to false if the patient currently does not have any disease, condition, or clinical finding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any disease, condition, or clinical finding.","meaning":"Boolean indicating whether the patient currently has any disease, condition, or clinical finding."} ;; "health condition"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_disease_condition_finding_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has another health condition."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_excessive_caffeine_intake_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has excessive caffeine intake as a clinical finding.","when_to_set_to_false":"Set to false if the patient currently does not have excessive caffeine intake as a clinical finding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has excessive caffeine intake.","meaning":"Boolean indicating whether the patient currently has excessive caffeine intake."} ;; "excessive caffeine intake"
(declare-const patient_has_finding_of_alcohol_intake_above_recommended_sensible_limits_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has alcohol intake above recommended sensible limits as a clinical finding.","when_to_set_to_false":"Set to false if the patient currently does not have alcohol intake above recommended sensible limits as a clinical finding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has alcohol intake above recommended sensible limits.","meaning":"Boolean indicating whether the patient currently has alcohol intake above recommended sensible limits."} ;; "excessive alcohol intake"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not (and patient_has_finding_of_excessive_caffeine_intake_now
             patient_has_finding_of_alcohol_intake_above_recommended_sensible_limits_now))
   :named REQ4_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if (the patient has excessive caffeine intake) AND (the patient has excessive alcohol intake)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_tobacco_smoking_behavior_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exhibiting tobacco smoking behavior (i.e., is smoking now).","when_to_set_to_false":"Set to false if the patient is currently not exhibiting tobacco smoking behavior (i.e., is not smoking now).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently smoking.","meaning":"Boolean indicating whether the patient is currently smoking (tobacco smoking behavior present now)."} ;; "smoking"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! (not patient_has_finding_of_tobacco_smoking_behavior_finding_now)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is smoking."
