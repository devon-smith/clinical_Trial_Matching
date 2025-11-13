;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "pediatric patient"
(declare-const patient_is_pediatric_patient_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently classified as a pediatric patient.","when_to_set_to_false":"Set to false if the patient is currently not classified as a pediatric patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently classified as a pediatric patient.","meaning":"Boolean indicating whether the patient is currently classified as a pediatric patient."} ;; "pediatric patient"
(declare-const patient_is_non_verbal_adult_patient_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently classified as a non-verbal adult patient.","when_to_set_to_false":"Set to false if the patient is currently not classified as a non-verbal adult patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently classified as a non-verbal adult patient.","meaning":"Boolean indicating whether the patient is currently classified as a non-verbal adult patient."} ;; "non-verbal adult patient"
(declare-const patient_is_accompanied_by_caregiver_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently accompanied by a caregiver.","when_to_set_to_false":"Set to false if the patient is currently not accompanied by a caregiver.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently accompanied by a caregiver.","meaning":"Boolean indicating whether the patient is currently accompanied by a caregiver."} ;; "accompanied by a caregiver"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion: (the patient is a pediatric patient) OR (the patient is a non-verbal adult patient AND the patient is NOT accompanied by a caregiver)
(assert
(! (not (or patient_is_pediatric_patient_now
            (and patient_is_non_verbal_adult_patient_now
                 (not patient_is_accompanied_by_caregiver_now))))
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is a pediatric patient) OR (the patient is a non-verbal adult patient AND the patient is NOT accompanied by a caregiver)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_cannot_be_reached_by_phone_in_7_to_10_days Bool) ;; {"when_to_set_to_true":"Set to true if the patient cannot be reached by phone within seven to ten days.","when_to_set_to_false":"Set to false if the patient can be reached by phone within seven to ten days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can be reached by phone within seven to ten days.","meaning":"Boolean indicating whether the patient cannot be reached by phone within a timeframe of seven to ten days."} ;; "the patient cannot be reached by phone in seven to ten days"
(declare-const caregiver_cannot_be_reached_by_phone_in_7_to_10_days Bool) ;; {"when_to_set_to_true":"Set to true if the caregiver of the patient cannot be reached by phone within seven to ten days.","when_to_set_to_false":"Set to false if the caregiver of the patient can be reached by phone within seven to ten days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the caregiver of the patient can be reached by phone within seven to ten days.","meaning":"Boolean indicating whether the caregiver of the patient cannot be reached by phone within a timeframe of seven to ten days."} ;; "the caregiver of the patient cannot be reached by phone in seven to ten days"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_cannot_be_reached_by_phone_in_7_to_10_days)
:named REQ1_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient cannot be reached by phone in seven to ten days."

(assert
(! (not caregiver_cannot_be_reached_by_phone_in_7_to_10_days)
:named REQ1_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the caregiver of the patient cannot be reached by phone in seven to ten days."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_condition_that_can_compromise_respiratory_function_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a condition that can compromise respiratory function.","when_to_set_to_false":"Set to false if the patient currently does not have a condition that can compromise respiratory function.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a condition that can compromise respiratory function.","meaning":"Boolean indicating whether the patient currently has a condition that can compromise respiratory function."} ;; "condition that can compromise respiratory function"
(declare-const patient_has_finding_of_condition_that_can_compromise_handling_of_respiratory_secretions_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a condition that can compromise the handling of respiratory secretions.","when_to_set_to_false":"Set to false if the patient currently does not have a condition that can compromise the handling of respiratory secretions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a condition that can compromise the handling of respiratory secretions.","meaning":"Boolean indicating whether the patient currently has a condition that can compromise the handling of respiratory secretions."} ;; "condition that can compromise the handling of respiratory secretions"
(declare-const patient_has_finding_of_severe_cognitive_dysfunction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has severe cognitive dysfunction.","when_to_set_to_false":"Set to false if the patient currently does not have severe cognitive dysfunction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has severe cognitive dysfunction.","meaning":"Boolean indicating whether the patient currently has severe cognitive dysfunction."} ;; "severe cognitive dysfunction"
(declare-const patient_has_finding_of_spinal_cord_injury_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has spinal cord injury.","when_to_set_to_false":"Set to false if the patient currently does not have spinal cord injury.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has spinal cord injury.","meaning":"Boolean indicating whether the patient currently has spinal cord injury."} ;; "spinal cord injury"
(declare-const patient_has_finding_of_neuromuscular_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a neuromuscular disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a neuromuscular disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a neuromuscular disorder.","meaning":"Boolean indicating whether the patient currently has a neuromuscular disorder."} ;; "neuromuscular disorder"
(declare-const patients_respiratory_function_is_abnormal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's respiratory function is currently abnormal.","when_to_set_to_false":"Set to false if the patient's respiratory function is currently normal.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's respiratory function is currently abnormal.","meaning":"Boolean indicating whether the patient's respiratory function is currently abnormal."} ;; "respiratory function"
(declare-const patients_respiratory_function_is_abnormal_now@@compromised_by_condition Bool) ;; {"when_to_set_to_true":"Set to true if the patient's respiratory function is currently abnormal and the abnormality is due to a condition that can compromise respiratory function.","when_to_set_to_false":"Set to false if the patient's respiratory function is currently abnormal but not due to a compromising condition, or if the abnormality is not present.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the abnormality is due to a compromising condition.","meaning":"Boolean indicating whether the patient's abnormal respiratory function is due to a compromising condition."} ;; "respiratory function compromised by condition"
(declare-const patients_respiratory_secretion_is_abnormal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's handling of respiratory secretions is currently abnormal.","when_to_set_to_false":"Set to false if the patient's handling of respiratory secretions is currently normal.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's handling of respiratory secretions is currently abnormal.","meaning":"Boolean indicating whether the patient's handling of respiratory secretions is currently abnormal."} ;; "respiratory secretions"
(declare-const patients_respiratory_secretion_is_abnormal_now@@compromised_by_condition Bool) ;; {"when_to_set_to_true":"Set to true if the patient's handling of respiratory secretions is currently abnormal and the abnormality is due to a condition that can compromise handling.","when_to_set_to_false":"Set to false if the patient's handling of respiratory secretions is currently abnormal but not due to a compromising condition, or if the abnormality is not present.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the abnormality is due to a compromising condition.","meaning":"Boolean indicating whether the patient's abnormal handling of respiratory secretions is due to a compromising condition."} ;; "respiratory secretions compromised by condition"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Non-exhaustive examples imply umbrella term (respiratory function compromise)
(assert
(! (=> (or patient_has_finding_of_severe_cognitive_dysfunction_now
          patient_has_finding_of_spinal_cord_injury_now
          patient_has_finding_of_neuromuscular_disorder_now)
    patient_has_finding_of_condition_that_can_compromise_respiratory_function_now)
:named REQ2_AUXILIARY0)) ;; "with non-exhaustive examples (severe cognitive dysfunction, spinal cord injury, neuromuscular disorder)" for respiratory function

;; Non-exhaustive examples imply umbrella term (handling of respiratory secretions compromise)
(assert
(! (=> (or patient_has_finding_of_severe_cognitive_dysfunction_now
          patient_has_finding_of_spinal_cord_injury_now
          patient_has_finding_of_neuromuscular_disorder_now)
    patient_has_finding_of_condition_that_can_compromise_handling_of_respiratory_secretions_now)
:named REQ2_AUXILIARY1)) ;; "with non-exhaustive examples (severe cognitive dysfunction, spinal cord injury, neuromuscular disorder)" for handling of respiratory secretions

;; Qualifier variables imply corresponding stem variables (respiratory function)
(assert
(! (=> patients_respiratory_function_is_abnormal_now@@compromised_by_condition
    patients_respiratory_function_is_abnormal_now)
:named REQ2_AUXILIARY2)) ;; "respiratory function is abnormal and compromised by condition"

;; Qualifier variables imply corresponding stem variables (respiratory secretions)
(assert
(! (=> patients_respiratory_secretion_is_abnormal_now@@compromised_by_condition
    patients_respiratory_secretion_is_abnormal_now)
:named REQ2_AUXILIARY3)) ;; "respiratory secretion handling is abnormal and compromised by condition"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_condition_that_can_compromise_respiratory_function_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a condition that can compromise respiratory function..."

(assert
(! (not patient_has_finding_of_condition_that_can_compromise_handling_of_respiratory_secretions_now)
:named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a condition that can compromise the handling of respiratory secretions..."
