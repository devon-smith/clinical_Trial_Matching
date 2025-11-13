;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "age > 18 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (> patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be (age > 18 years)."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_suspicion_of_appendicitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has clinical suspicion of appendicitis.","when_to_set_to_false":"Set to false if the patient currently does not have clinical suspicion of appendicitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has clinical suspicion of appendicitis.","meaning":"Boolean indicating whether the patient currently has clinical suspicion of appendicitis."}  ;; "clinical suspicion of appendicitis"
(declare-const patient_has_suspicion_of_appendicitis_now@@primary_diagnosis Bool) ;; {"when_to_set_to_true":"Set to true if the clinical suspicion of appendicitis is as the primary diagnosis.","when_to_set_to_false":"Set to false if the clinical suspicion of appendicitis is not as the primary diagnosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the suspicion is as the primary diagnosis.","meaning":"Boolean indicating whether the clinical suspicion of appendicitis is as the primary diagnosis."}  ;; "clinical suspicion of appendicitis as the primary diagnosis"
(declare-const patient_has_suspicion_of_appendicitis_now@@differential_diagnosis Bool) ;; {"when_to_set_to_true":"Set to true if the clinical suspicion of appendicitis is as the differential diagnosis.","when_to_set_to_false":"Set to false if the clinical suspicion of appendicitis is not as the differential diagnosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the suspicion is as the differential diagnosis.","meaning":"Boolean indicating whether the clinical suspicion of appendicitis is as the differential diagnosis."}  ;; "clinical suspicion of appendicitis as the differential diagnosis"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_suspicion_of_appendicitis_now@@primary_diagnosis
         patient_has_suspicion_of_appendicitis_now)
     :named REQ1_AUXILIARY0)) ;; "clinical suspicion of appendicitis as the primary diagnosis" implies "clinical suspicion of appendicitis"

(assert
  (! (=> patient_has_suspicion_of_appendicitis_now@@differential_diagnosis
         patient_has_suspicion_of_appendicitis_now)
     :named REQ1_AUXILIARY1)) ;; "clinical suspicion of appendicitis as the differential diagnosis" implies "clinical suspicion of appendicitis"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (or patient_has_suspicion_of_appendicitis_now@@primary_diagnosis
         patient_has_suspicion_of_appendicitis_now@@differential_diagnosis)
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have (clinical suspicion of appendicitis as the primary diagnosis) OR (clinical suspicion of appendicitis as the differential diagnosis)."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_is_able_to_provide_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to provide informed consent.","when_to_set_to_false":"Set to false if the patient is currently unable to provide informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to provide informed consent.","meaning":"Boolean indicating whether the patient is currently able to provide informed consent."}  ;; "the patient must be able to provide informed consent"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_is_able_to_provide_informed_consent_now
     :named REQ2_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must be able to provide informed consent"
