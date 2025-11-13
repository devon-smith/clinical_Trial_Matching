;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_chest_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chest pain.","when_to_set_to_false":"Set to false if the patient currently does not have chest pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chest pain.","meaning":"Boolean indicating whether the patient currently has chest pain."}  ;; "chest pain as the primary complaint of the patient"
(declare-const patient_has_finding_of_chest_pain_now@@is_primary_complaint Bool) ;; {"when_to_set_to_true":"Set to true if chest pain is the primary complaint of the patient at the time of inclusion.","when_to_set_to_false":"Set to false if chest pain is present but is not the primary complaint.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether chest pain is the primary complaint.","meaning":"Boolean indicating whether chest pain is the primary complaint of the patient."}  ;; "chest pain as the primary complaint of the patient"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies the stem variable
(assert
  (! (=> patient_has_finding_of_chest_pain_now@@is_primary_complaint
         patient_has_finding_of_chest_pain_now)
     :named REQ0_AUXILIARY0)) ;; "chest pain as the primary complaint of the patient"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_finding_of_chest_pain_now@@is_primary_complaint
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "chest pain as the primary complaint of the patient"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const acute_pain_episode_duration_value_recorded_before_admission_in_days Real) ;; {"when_to_set_to_value":"Set to the number of days of the patient's acute episode of pain before admission, if known and documented.","when_to_set_to_null":"Set to null if the duration in days of the patient's acute episode of pain before admission is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the duration in days of the patient's acute episode of pain before admission."} ;; "duration < 7 days before admission"
(declare-const patient_has_finding_of_acute_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an acute episode of pain.","when_to_set_to_false":"Set to false if the patient currently does not have an acute episode of pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an acute episode of pain.","meaning":"Boolean indicating whether the patient currently has an acute episode of pain."} ;; "acute episode of pain"
(declare-const patient_has_finding_of_acute_pain_now@@temporalcontext_within7days_before_admission Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current acute episode of pain has a duration less than 7 days before admission.","when_to_set_to_false":"Set to false if the patient's current acute episode of pain does not have a duration less than 7 days before admission.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the duration of the acute pain episode is less than 7 days before admission.","meaning":"Boolean indicating whether the patient's current acute episode of pain has a duration less than 7 days before admission."} ;; "acute episode of pain of duration < 7 days before admission"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Definition: The qualifier variable is true iff the patient has an acute episode of pain AND the duration is less than 7 days before admission.
(assert
  (! (= patient_has_finding_of_acute_pain_now@@temporalcontext_within7days_before_admission
        (and patient_has_finding_of_acute_pain_now
             (< acute_pain_episode_duration_value_recorded_before_admission_in_days 7.0)))
     :named REQ1_AUXILIARY0)) ;; "acute episode of pain of duration < 7 days before admission"

;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_finding_of_acute_pain_now@@temporalcontext_within7days_before_admission
         patient_has_finding_of_acute_pain_now)
     :named REQ1_AUXILIARY1)) ;; "acute episode of pain of duration < 7 days before admission"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_finding_of_acute_pain_now@@temporalcontext_within7days_before_admission
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have an acute episode of pain of duration < 7 days before admission."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_consented_to_standardized_evaluation_program_at_chest_pain_clinic Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided consent to participate in the standardized evaluation program at the chest pain clinic.","when_to_set_to_false":"Set to false if the patient has not provided consent to participate in the standardized evaluation program at the chest pain clinic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided consent to participate in the standardized evaluation program at the chest pain clinic.","meaning":"Boolean indicating whether the patient has provided consent to participate in the standardized evaluation program at the chest pain clinic."} ;; "the patient must consent to (the standardized evaluation program at the chest pain clinic)"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_consented_to_standardized_evaluation_program_at_chest_pain_clinic
     :named REQ2_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must consent to (the standardized evaluation program at the chest pain clinic)"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_finding_of_neck_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of pain in the neck.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of pain in the neck.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pain in the neck.","meaning":"Boolean indicating whether the patient currently has pain in the neck."} ;; "pain in the neck"

;; ===================== Constraint Assertions (REQ 3) =====================
;; To be included, the patient must have (pain in the thorax OR pain in the neck).
(assert
  (! (or patient_has_finding_of_chest_pain_now
         patient_has_finding_of_neck_pain_now)
     :named REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have (pain in the thorax OR pain in the neck)."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_is_able_to_read_danish_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to read Danish.","when_to_set_to_false":"Set to false if the patient is currently not able to read Danish.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to read Danish.","meaning":"Boolean indicating whether the patient is currently able to read Danish."} ;; "the patient must be able to read Danish"
(declare-const patient_is_able_to_understand_danish_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to understand Danish.","when_to_set_to_false":"Set to false if the patient is currently not able to understand Danish.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to understand Danish.","meaning":"Boolean indicating whether the patient is currently able to understand Danish."} ;; "the patient must be able to understand Danish"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! patient_is_able_to_read_danish_now
     :named REQ4_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be able to read Danish."

(assert
  (! patient_is_able_to_understand_danish_now
     :named REQ4_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be able to understand Danish."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "aged ≥ 18 years AND aged ≤ 75 years"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Component 0: To be included, the patient must be aged ≥ 18 years.
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "aged ≥ 18 years"

;; Component 1: To be included, the patient must be aged ≤ 75 years.
(assert
  (! (<= patient_age_value_recorded_now_in_years 75)
     :named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "aged ≤ 75 years"

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_is_resident_of_funen_county_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a resident of Funen County.","when_to_set_to_false":"Set to false if the patient is currently not a resident of Funen County.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a resident of Funen County.","meaning":"Boolean indicating whether the patient is currently a resident of Funen County."} ;; "the patient must be a resident of Funen County"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! patient_is_resident_of_funen_county_now
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must be a resident of Funen County"
