;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "the patient is a child"
(declare-const patient_body_size_is_too_small_for_standard_sensors_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current body size is too small for the current standard sensors.","when_to_set_to_false":"Set to false if the patient's current body size is not too small for the current standard sensors.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current body size is too small for the current standard sensors.","meaning":"Boolean indicating whether the patient's current body size is too small for the current standard sensors."} ;; "body size that is too small for the current standard sensors"
(declare-const patient_body_size_value_recorded_now_withunit_cm Real) ;; {"when_to_set_to_value":"Set to the patient's current body size in centimeters if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current body size in centimeters is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current body size in centimeters."} ;; "body size"
(declare-const patient_has_finding_of_size_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a body size finding documented.","when_to_set_to_false":"Set to false if the patient currently does not have a body size finding documented.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a body size finding.","meaning":"Boolean indicating whether the patient currently has a body size finding."} ;; "body size"
(declare-const patient_is_child_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently classified as a child according to clinical or study definitions.","when_to_set_to_false":"Set to false if the patient is currently not classified as a child according to clinical or study definitions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently classified as a child.","meaning":"Boolean indicating whether the patient is currently classified as a child according to clinical or study definitions."} ;; "the patient is a child"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (and patient_is_child_now
             patient_body_size_is_too_small_for_standard_sensors_now))
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is a child) AND (the patient has a body size that is too small for the current standard sensors)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_deformation_of_bone_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a bony deformity.","when_to_set_to_false":"Set to false if the patient currently does not have a bony deformity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a bony deformity.","meaning":"Boolean indicating whether the patient currently has a bony deformity."} ;; "bony deformity"
(declare-const patient_has_finding_of_deformation_of_bone_now@@located_on_chest_wall Bool) ;; {"when_to_set_to_true":"Set to true if the patient's bony deformity is located on the chest wall.","when_to_set_to_false":"Set to false if the patient's bony deformity is not located on the chest wall.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the bony deformity is located on the chest wall.","meaning":"Boolean indicating whether the patient's bony deformity is located on the chest wall."} ;; "bony deformity of the chest wall"
(declare-const patients_skin_condition_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a skin condition.","when_to_set_to_false":"Set to false if the patient currently does not have a skin condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a skin condition.","meaning":"Boolean indicating whether the patient currently has a skin condition."} ;; "skin condition"
(declare-const patients_skin_condition_is_positive_now@@is_contagious Bool) ;; {"when_to_set_to_true":"Set to true if the patient's skin condition is contagious.","when_to_set_to_false":"Set to false if the patient's skin condition is not contagious.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's skin condition is contagious.","meaning":"Boolean indicating whether the patient's skin condition is contagious."} ;; "contagious skin condition"
(declare-const placement_of_sensors_is_possible_on_back_of_patient_now Bool) ;; {"when_to_set_to_true":"Set to true if it is currently possible to place sensors on the back of the patient.","when_to_set_to_false":"Set to false if it is currently not possible to place sensors on the back of the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether it is possible to place sensors on the back of the patient.","meaning":"Boolean indicating whether it is currently possible to place sensors on the back of the patient."} ;; "condition that will prevent the placement of sensors on the back of the patient"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_deformation_of_bone_now@@located_on_chest_wall
           patients_skin_condition_is_positive_now@@is_contagious)
     (not placement_of_sensors_is_possible_on_back_of_patient_now))
:named REQ1_AUXILIARY0)) ;; "with non-exhaustive examples ((bony deformity of the chest wall) OR (contagious skin condition))."

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_deformation_of_bone_now@@located_on_chest_wall
       patient_has_finding_of_deformation_of_bone_now)
:named REQ1_AUXILIARY1)) ;; "bony deformity of the chest wall"

(assert
(! (=> patients_skin_condition_is_positive_now@@is_contagious
       patients_skin_condition_is_positive_now)
:named REQ1_AUXILIARY2)) ;; "contagious skin condition"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not (not placement_of_sensors_is_possible_on_back_of_patient_now))
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a condition that will prevent the placement of sensors on the back of the patient with non-exhaustive examples ((bony deformity of the chest wall) OR (contagious skin condition))."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_pacemaker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a pacemaker implanted.","when_to_set_to_false":"Set to false if the patient currently does not have a pacemaker implanted.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a pacemaker implanted.","meaning":"Boolean indicating whether the patient currently has a pacemaker implanted."} ;; "The patient is excluded if the patient has a pacemaker."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (not patient_has_pacemaker_now)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a pacemaker."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently known not to be pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_is_pregnant_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."
