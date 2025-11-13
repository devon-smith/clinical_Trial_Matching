;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_type_1_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently diagnosed with type 1 diabetes mellitus.","when_to_set_to_false":"Set to false if the patient is currently not diagnosed with type 1 diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently diagnosed with type 1 diabetes mellitus.","meaning":"Boolean indicating whether the patient is currently diagnosed with type 1 diabetes mellitus."} ;; "type 1 diabetes mellitus"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_diagnosis_of_type_1_diabetes_mellitus_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is diagnosed with type 1 diabetes mellitus."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_type_2_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of type 2 diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of type 2 diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of type 2 diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has a diagnosis of type 2 diabetes mellitus."} ;; "type 2 diabetes mellitus"
(declare-const patient_requires_insulin_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently requires insulin therapy.","when_to_set_to_false":"Set to false if the patient currently does not require insulin therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently requires insulin therapy.","meaning":"Boolean indicating whether the patient currently requires insulin therapy."} ;; "requires insulin therapy"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not (and patient_has_diagnosis_of_type_2_diabetes_mellitus_now
             patient_requires_insulin_therapy_now))
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is diagnosed with type 2 diabetes mellitus and the patient requires insulin therapy."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_weight_loss_value_recorded_inthepast6months_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured percentage value if a numeric measurement of the patient's weight loss in the past 6 months is available.","when_to_set_to_null":"Set to null if no such percentage measurement in the past 6 months is available or the value is indeterminate.","meaning":"Numeric percentage representing the patient's weight loss in the past 6 months."} ;; "weight loss with percentage ≥ 10 % in the last six months."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (not (>= patient_weight_loss_value_recorded_inthepast6months_withunit_percent 10))
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has experienced weight loss with percentage ≥ 10 % in the last six months."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_enrolled_in_weight_loss_management_program_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently enrolled in a weight loss management program.","when_to_set_to_false":"Set to false if the patient is currently not enrolled in a weight loss management program.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently enrolled in a weight loss management program.","meaning":"Boolean indicating whether the patient is currently enrolled in a weight loss management program."} ;; "enrolled in a weight loss management program"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_is_enrolled_in_weight_loss_management_program_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is enrolled in a weight loss management program."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_is_enrolled_in_formal_cardiac_rehabilitation_program_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently enrolled in a formal cardiac rehabilitation program.","when_to_set_to_false":"Set to false if the patient is currently not enrolled in a formal cardiac rehabilitation program.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently enrolled in a formal cardiac rehabilitation program.","meaning":"Boolean indicating whether the patient is currently enrolled in a formal cardiac rehabilitation program."} ;; "the patient is enrolled in a formal cardiac rehabilitation program"
(declare-const patient_is_undergoing_physical_rehabilitation_program_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing a physical rehabilitation program.","when_to_set_to_false":"Set to false if the patient is currently not undergoing a physical rehabilitation program.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing a physical rehabilitation program.","meaning":"Boolean indicating whether the patient is currently undergoing a physical rehabilitation program."} ;; "the patient is undergoing a physical rehabilitation program"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not (or patient_is_enrolled_in_formal_cardiac_rehabilitation_program_now
            patient_is_undergoing_physical_rehabilitation_program_now))
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is enrolled in a formal cardiac rehabilitation program) OR (the patient is undergoing a physical rehabilitation program)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_is_taking_drug_or_medicament_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any drug or medicament.","when_to_set_to_false":"Set to false if the patient is currently not taking any drug or medicament.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any drug or medicament.","meaning":"Boolean indicating whether the patient is currently taking any drug or medicament."} ;; "medications"

(declare-const patient_is_taking_drug_or_medicament_now@@affects_weight_loss Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament the patient is currently taking affects weight loss.","when_to_set_to_false":"Set to false if the drug or medicament the patient is currently taking does not affect weight loss.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament the patient is currently taking affects weight loss.","meaning":"Boolean indicating whether the drug or medicament the patient is currently taking affects weight loss."} ;; "medications that affect weight loss"

(declare-const patient_is_taking_drug_or_medicament_now@@affects_weight_gain Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament the patient is currently taking affects weight gain.","when_to_set_to_false":"Set to false if the drug or medicament the patient is currently taking does not affect weight gain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament the patient is currently taking affects weight gain.","meaning":"Boolean indicating whether the drug or medicament the patient is currently taking affects weight gain."} ;; "medications that affect weight gain"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_is_taking_drug_or_medicament_now@@affects_weight_loss
      patient_is_taking_drug_or_medicament_now)
:named REQ5_AUXILIARY0)) ;; "the patient is taking medications that affect weight loss"

(assert
(! (=> patient_is_taking_drug_or_medicament_now@@affects_weight_gain
      patient_is_taking_drug_or_medicament_now)
:named REQ5_AUXILIARY1)) ;; "the patient is taking medications that affect weight gain"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_is_taking_drug_or_medicament_now@@affects_weight_loss)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is taking medications that affect weight loss."

(assert
(! (not patient_is_taking_drug_or_medicament_now@@affects_weight_gain)
:named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is taking medications that affect weight gain."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_healthy_diet_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently meets the minimum recommendations for healthy eating.","when_to_set_to_false":"Set to false if the patient currently does not meet the minimum recommendations for healthy eating.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently meets the minimum recommendations for healthy eating.","meaning":"Boolean indicating whether the patient currently meets the minimum recommendations for healthy eating."} ;; "healthy eating"
(declare-const patient_has_finding_of_physical_activity_target_moderate_exercise_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently meets the minimum recommendations for moderate physical activity.","when_to_set_to_false":"Set to false if the patient currently does not meet the minimum recommendations for moderate physical activity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently meets the minimum recommendations for moderate physical activity.","meaning":"Boolean indicating whether the patient currently meets the minimum recommendations for moderate physical activity."} ;; "moderate physical activity"
(declare-const patient_has_other_medical_restrictions_precluding_minimum_recommendations_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has other medical restrictions that would preclude following the minimum recommendations for moderate physical activity and for healthy eating.","when_to_set_to_false":"Set to false if the patient currently does not have other medical restrictions that would preclude following the minimum recommendations for moderate physical activity and for healthy eating.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has other medical restrictions that would preclude following the minimum recommendations for moderate physical activity and for healthy eating.","meaning":"Boolean indicating whether the patient currently has other medical restrictions that would preclude following the minimum recommendations for moderate physical activity and for healthy eating."} ;; "other medical restrictions that would preclude following the minimum recommendations for moderate physical activity and for healthy eating"
(declare-const patient_has_other_physical_restrictions_precluding_minimum_recommendations_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has other physical restrictions that would preclude following the minimum recommendations for moderate physical activity and for healthy eating.","when_to_set_to_false":"Set to false if the patient currently does not have other physical restrictions that would preclude following the minimum recommendations for moderate physical activity and for healthy eating.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has other physical restrictions that would preclude following the minimum recommendations for moderate physical activity and for healthy eating.","meaning":"Boolean indicating whether the patient currently has other physical restrictions that would preclude following the minimum recommendations for moderate physical activity and for healthy eating."} ;; "other physical restrictions that would preclude following the minimum recommendations for moderate physical activity and for healthy eating"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_other_physical_restrictions_precluding_minimum_recommendations_now)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has other physical restrictions that would preclude following the minimum recommendations for moderate physical activity and for healthy eating."

(assert
(! (not patient_has_other_medical_restrictions_precluding_minimum_recommendations_now)
:named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has other medical restrictions that would preclude following the minimum recommendations for moderate physical activity and for healthy eating."
