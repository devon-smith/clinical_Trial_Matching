;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "patient is less than eighteen years of age"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (< patient_age_value_recorded_now_in_years 18))
    :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is less than eighteen years of age."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_decreased_level_of_consciousness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of decreased level of consciousness.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of decreased level of consciousness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of decreased level of consciousness.","meaning":"Boolean indicating whether the patient currently has decreased level of consciousness."} ;; "decreased level of consciousness"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_decreased_level_of_consciousness_now)
    :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a decreased level of consciousness."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_inability_to_answer_questions_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an inability to answer questions.","when_to_set_to_false":"Set to false if the patient currently does not have an inability to answer questions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an inability to answer questions.","meaning":"Boolean indicating whether the patient currently has an inability to answer questions."} ;; "has an inability to answer questions"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (not patient_has_finding_of_inability_to_answer_questions_now)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an inability to answer questions."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_prisoner_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a prisoner.","when_to_set_to_false":"Set to false if the patient is currently not a prisoner.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a prisoner.","meaning":"Boolean indicating whether the patient is currently a prisoner."} ;; "The patient is excluded if the patient is a prisoner."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (not patient_is_prisoner_now)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a prisoner."
