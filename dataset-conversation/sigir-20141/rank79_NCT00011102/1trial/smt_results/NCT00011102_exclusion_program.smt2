;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_chronic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a chronic disease.","when_to_set_to_false":"Set to false if the patient does not currently have a chronic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a chronic disease.","meaning":"auto-synthesized variable for chronic_disease (Clinical finding) with timeframe now"} ;; "chronic disease"

(declare-const patient_has_limitation_of_changes_in_dietary_intake_due_to_chronic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a chronic disease that precludes (prevents or makes impossible) changes in dietary intake.","when_to_set_to_false":"Set to false if the patient currently has a chronic disease but it does not preclude changes in dietary intake, or if the patient does not have a chronic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a chronic disease that precludes changes in dietary intake.","meaning":"Boolean indicating whether the patient currently has a chronic disease that precludes changes in dietary intake."} ;; "chronic disease that precludes changes in dietary intake"

(declare-const patient_has_limitation_of_regular_physical_activity_due_to_chronic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a chronic disease that precludes (prevents or makes impossible) regular physical activity.","when_to_set_to_false":"Set to false if the patient currently has a chronic disease but it does not preclude regular physical activity, or if the patient does not have a chronic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a chronic disease that precludes regular physical activity.","meaning":"Boolean indicating whether the patient currently has a chronic disease that precludes regular physical activity."} ;; "chronic disease that precludes regular physical activity"

(declare-const patients_dietary_intake_is_positive_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient's dietary intake has been positive at any time in the history.","when_to_set_to_false":"Set to false if the patient's dietary intake has never been positive in the history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's dietary intake has ever been positive in the history.","meaning":"auto-synthesized variable for dietary_intake (Observable entity) with timeframe inthehistory"} ;; "dietary intake"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_limitation_of_regular_physical_activity_due_to_chronic_disease_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a chronic disease that precludes regular physical activity."

(assert
(! (not patient_has_limitation_of_changes_in_dietary_intake_due_to_chronic_disease_now)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a chronic disease that precludes changes in dietary intake."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_mental_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of mental disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of mental disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of mental disorder.","meaning":"Boolean indicating whether the patient currently has a mental disorder."} ;; "psychological disorder"
(declare-const patient_has_finding_of_mental_disorder_now@@currently_receiving_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving treatment for a mental disorder.","when_to_set_to_false":"Set to false if the patient is not currently receiving treatment for a mental disorder, even if the disorder is present.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving treatment for a mental disorder.","meaning":"Boolean indicating whether the patient is currently receiving treatment for a mental disorder."} ;; "currently receiving treatment for a psychological disorder"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies the stem variable
(assert
(! (=> patient_has_finding_of_mental_disorder_now@@currently_receiving_treatment
       patient_has_finding_of_mental_disorder_now)
   :named REQ1_AUXILIARY0)) ;; "currently receiving treatment for a psychological disorder" implies "psychological disorder"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_mental_disorder_now@@currently_receiving_treatment)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is currently receiving treatment for a psychological disorder."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is confirmed to be pregnant at the current time.","when_to_set_to_false":"Set to false if the patient is confirmed not to be pregnant at the current time.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is currently pregnant"
(declare-const patient_is_pregnant_inthepast12months Bool) ;; {"when_to_set_to_true":"Set to true if the patient was pregnant at any time within the past 12 months (i.e., has given birth within the last 12 months).","when_to_set_to_false":"Set to false if the patient was not pregnant at any time within the past 12 months.","when_to_set_to_null":"Set to null if the patient's pregnancy status within the past 12 months is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient was pregnant at any time within the past 12 months."} ;; "the patient has given birth within the last twelve months"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (not (or patient_is_pregnant_now patient_is_pregnant_inthepast12months))
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is currently pregnant) OR (the patient has given birth within the last twelve months)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_used_weight_loss_medication_in_the_past_3_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used any weight loss medication within the past three months.","when_to_set_to_false":"Set to false if the patient has not used any weight loss medication within the past three months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used any weight loss medication within the past three months.","meaning":"Boolean indicating whether the patient has used any weight loss medication within the past three months."} ;; "the patient has used weight loss medication within the last three months"

(declare-const patient_is_exposed_to_drug_or_medicament_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to any drug or medicament within the past three months.","when_to_set_to_false":"Set to false if the patient has not been exposed to any drug or medicament within the past three months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to any drug or medicament within the past three months.","meaning":"Boolean indicating whether the patient has been exposed to any drug or medicament within the past three months."} ;; "drug"

(declare-const patient_is_exposed_to_drug_or_medicament_inthepast3months@@affects_body_weight Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament the patient was exposed to within the past three months affects body weight.","when_to_set_to_false":"Set to false if the drug or medicament the patient was exposed to within the past three months does not affect body weight.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament the patient was exposed to within the past three months affects body weight.","meaning":"Boolean indicating whether the drug or medicament the patient was exposed to within the past three months affects body weight."} ;; "other drug that affects body weight within the last three months"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_exposed_to_drug_or_medicament_inthepast3months@@affects_body_weight
       patient_is_exposed_to_drug_or_medicament_inthepast3months)
   :named REQ3_AUXILIARY0)) ;; "drug that affects body weight" is a type of drug

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not (or patient_has_used_weight_loss_medication_in_the_past_3_months
            patient_is_exposed_to_drug_or_medicament_inthepast3months@@affects_body_weight))
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has used weight loss medication within the last three months) OR (the patient has used other drug that affects body weight within the last three months)."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_participated_in_weight_loss_program_within_last_12_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has participated in any weight loss program within the last twelve months.","when_to_set_to_false":"Set to false if the patient has not participated in any weight loss program within the last twelve months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has participated in a weight loss program within the last twelve months.","meaning":"Boolean indicating whether the patient has participated in a weight loss program within the last twelve months."} ;; "The patient is excluded if the patient has participated in a weight loss program within the last twelve months."

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_participated_in_weight_loss_program_within_last_12_months)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has participated in a weight loss program within the last twelve months."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_is_planning_to_relocate_outside_study_area_within_next_3_years Bool) ;; {"when_to_set_to_true":"Set to true if the patient is planning to relocate outside the study area within the next three years.","when_to_set_to_false":"Set to false if the patient is not planning to relocate outside the study area within the next three years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is planning to relocate outside the study area within the next three years.","meaning":"Boolean indicating whether the patient is planning to relocate outside the study area within the next three years."} ;; "The patient is excluded if the patient is planning to relocate outside the study area within the next three years."

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_is_planning_to_relocate_outside_study_area_within_next_3_years)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is planning to relocate outside the study area within the next three years."
