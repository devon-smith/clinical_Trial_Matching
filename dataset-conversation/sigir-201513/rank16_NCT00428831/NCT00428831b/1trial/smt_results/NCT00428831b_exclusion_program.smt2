;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "pediatric patient"
(declare-const patient_is_pediatric_patient_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently classified as a pediatric patient.","when_to_set_to_false":"Set to false if the patient is currently not classified as a pediatric patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently classified as a pediatric patient.","meaning":"Boolean indicating whether the patient is currently classified as a pediatric patient."} ;; "pediatric patient"
(declare-const patient_is_non_verbal_adult_patient_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently classified as a non-verbal adult patient.","when_to_set_to_false":"Set to false if the patient is currently not classified as a non-verbal adult patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently classified as a non-verbal adult patient.","meaning":"Boolean indicating whether the patient is currently classified as a non-verbal adult patient."} ;; "non-verbal adult patient"
(declare-const patient_is_accompanied_by_caregiver_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently accompanied by a caregiver.","when_to_set_to_false":"Set to false if the patient is currently not accompanied by a caregiver.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently accompanied by a caregiver.","meaning":"Boolean indicating whether the patient is currently accompanied by a caregiver."} ;; "accompanied by a caregiver"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion: patient is a pediatric patient
(assert
(! (not patient_is_pediatric_patient_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a pediatric patient."

;; Exclusion: patient is a non-verbal adult patient AND NOT accompanied by a caregiver
(assert
(! (not (and patient_is_non_verbal_adult_patient_now
             (not patient_is_accompanied_by_caregiver_now)))
:named REQ0_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is a non-verbal adult patient AND the patient is NOT accompanied by a caregiver."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_cannot_be_reached_by_phone_within_seven_to_ten_days Bool) ;; {"when_to_set_to_true":"Set to true if the patient cannot be reached by phone within seven to ten days.","when_to_set_to_false":"Set to false if the patient can be reached by phone within seven to ten days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can be reached by phone within seven to ten days.","meaning":"Boolean indicating whether the patient cannot be reached by phone within seven to ten days."} ;; "the patient cannot be reached by phone within seven to ten days"
(declare-const caregiver_cannot_be_reached_by_phone_within_seven_to_ten_days Bool) ;; {"when_to_set_to_true":"Set to true if the caregiver of the patient cannot be reached by phone within seven to ten days.","when_to_set_to_false":"Set to false if the caregiver of the patient can be reached by phone within seven to ten days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the caregiver of the patient can be reached by phone within seven to ten days.","meaning":"Boolean indicating whether the caregiver of the patient cannot be reached by phone within seven to ten days."} ;; "the caregiver of the patient cannot be reached by phone within seven to ten days"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not (or patient_cannot_be_reached_by_phone_within_seven_to_ten_days
            caregiver_cannot_be_reached_by_phone_within_seven_to_ten_days))
:named REQ1_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if ((the patient cannot be reached by phone within seven to ten days) OR (the caregiver of the patient cannot be reached by phone within seven to ten days))."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_cognitive_dysfunction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of cognitive dysfunction.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of cognitive dysfunction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of cognitive dysfunction.","meaning":"Boolean indicating whether the patient currently has a diagnosis of cognitive dysfunction."} ;; "severe cognitive dysfunction"
(declare-const patient_has_diagnosis_of_spinal_cord_injury_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of spinal cord injury.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of spinal cord injury.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of spinal cord injury.","meaning":"Boolean indicating whether the patient currently has a diagnosis of spinal cord injury."} ;; "spinal cord injury"
(declare-const patient_has_diagnosis_of_myoneural_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of a neuromuscular disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of a neuromuscular disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of a neuromuscular disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of a neuromuscular disorder."} ;; "other neuromuscular disorder"
(declare-const patients_respiratory_function_is_abnormal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's respiratory function is currently abnormal (compromised).","when_to_set_to_false":"Set to false if the patient's respiratory function is currently normal (not compromised).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's respiratory function is currently abnormal.","meaning":"Boolean indicating whether the patient's respiratory function is currently abnormal."} ;; "condition that can compromise respiratory function"
(declare-const patients_respiratory_secretion_is_abnormal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's handling of respiratory secretions is currently abnormal (compromised).","when_to_set_to_false":"Set to false if the patient's handling of respiratory secretions is currently normal (not compromised).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's handling of respiratory secretions is currently abnormal.","meaning":"Boolean indicating whether the patient's handling of respiratory secretions is currently abnormal."} ;; "condition that can compromise the handling of respiratory secretions"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Non-exhaustive examples imply umbrella term: compromise respiratory function
(assert
(! (=> (or patient_has_diagnosis_of_cognitive_dysfunction_now
           patient_has_diagnosis_of_spinal_cord_injury_now
           patient_has_diagnosis_of_myoneural_disorder_now)
       patients_respiratory_function_is_abnormal_now)
   :named REQ2_AUXILIARY0)) ;; "with non-exhaustive examples (severe cognitive dysfunction, spinal cord injury, other neuromuscular disorder)" for respiratory function

;; Non-exhaustive examples imply umbrella term: compromise handling of respiratory secretions
(assert
(! (=> (or patient_has_diagnosis_of_cognitive_dysfunction_now
           patient_has_diagnosis_of_spinal_cord_injury_now
           patient_has_diagnosis_of_myoneural_disorder_now)
       patients_respiratory_secretion_is_abnormal_now)
   :named REQ2_AUXILIARY1)) ;; "with non-exhaustive examples (severe cognitive dysfunction, spinal cord injury, other neuromuscular disorder)" for handling of respiratory secretions

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patients_respiratory_function_is_abnormal_now)
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a condition that can compromise respiratory function..."

(assert
(! (not patients_respiratory_secretion_is_abnormal_now)
   :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a condition that can compromise the handling of respiratory secretions..."
