;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_cough_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently presents with cough.","when_to_set_to_false":"Set to false if the patient currently does not present with cough.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently presents with cough.","meaning":"Boolean indicating whether the patient currently presents with cough."} ;; "cough"

(declare-const patient_is_exposed_to_sputum_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently produces or is exposed to sputum.","when_to_set_to_false":"Set to false if the patient currently does not produce or is not exposed to sputum.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently produces or is exposed to sputum.","meaning":"Boolean indicating whether the patient currently produces or is exposed to sputum."} ;; "sputum"

(declare-const patient_is_exposed_to_sputum_now@@purulent Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently produces or is exposed to purulent sputum.","when_to_set_to_false":"Set to false if the patient currently produces or is exposed to sputum that is not purulent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the sputum is purulent.","meaning":"Boolean indicating whether the patient's sputum is purulent."} ;; "purulent sputum production"

(declare-const patient_is_exposed_to_sputum_now@@produced Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently producing sputum (not just exposed to it).","when_to_set_to_false":"Set to false if the patient is not currently producing sputum (but may be exposed to it otherwise).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the sputum is actively produced.","meaning":"Boolean indicating whether the patient's sputum is actively produced."} ;; "sputum produced"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_exposed_to_sputum_now@@purulent
      patient_is_exposed_to_sputum_now)
:named REQ0_AUXILIARY0)) ;; "purulent sputum production"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_exposed_to_sputum_now@@produced
      patient_is_exposed_to_sputum_now)
:named REQ0_AUXILIARY1)) ;; "sputum produced"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion: patient must NOT present with cough AND purulent sputum production
(assert
(! (not (and patient_has_finding_of_cough_now
             patient_is_exposed_to_sputum_now@@purulent))
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient presents with cough) AND (the patient has purulent sputum production)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
;; "cough"
;; Already declared:
;; (declare-const patient_has_finding_of_cough_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently presents with cough.","when_to_set_to_false":"Set to false if the patient currently does not present with cough.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently presents with cough.","meaning":"Boolean indicating whether the patient currently presents with cough."}

(declare-const patient_has_diagnosis_of_tuberculosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of tuberculosis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of tuberculosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of tuberculosis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of tuberculosis."} ;; "known tuberculosis"

(declare-const patient_has_suspicion_of_tuberculosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently is suspected to have tuberculosis.","when_to_set_to_false":"Set to false if the patient currently is not suspected to have tuberculosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently is suspected to have tuberculosis.","meaning":"Boolean indicating whether the patient currently is suspected to have tuberculosis."} ;; "suspected tuberculosis"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (not (and patient_has_finding_of_cough_now
               (or patient_has_diagnosis_of_tuberculosis_now
                   patient_has_suspicion_of_tuberculosis_now)))
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient presents with cough) AND ((the patient has known tuberculosis) OR (the patient has suspected tuberculosis))."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_immunodeficiency_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an immunodeficiency disorder.","when_to_set_to_false":"Set to false if the patient currently does not have an immunodeficiency disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an immunodeficiency disorder.","meaning":"Boolean indicating whether the patient currently has an immunodeficiency disorder."} ;; "immunodeficiency"
(declare-const patient_has_finding_of_immunodeficiency_disorder_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the patient's immunodeficiency disorder is known (confirmed diagnosis).","when_to_set_to_false":"Set to false if the patient's immunodeficiency disorder is not known (not confirmed).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the immunodeficiency disorder is known.","meaning":"Boolean indicating whether the patient's immunodeficiency disorder is known (confirmed)."} ;; "known immunodeficiency"
(declare-const patient_has_finding_of_immunodeficiency_disorder_now@@suspected Bool) ;; {"when_to_set_to_true":"Set to true if the patient's immunodeficiency disorder is suspected (not confirmed).","when_to_set_to_false":"Set to false if the patient's immunodeficiency disorder is not suspected.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the immunodeficiency disorder is suspected.","meaning":"Boolean indicating whether the patient's immunodeficiency disorder is suspected (not confirmed)."} ;; "suspected immunodeficiency"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_immunodeficiency_disorder_now@@known
      patient_has_finding_of_immunodeficiency_disorder_now)
:named REQ2_AUXILIARY0)) ;; "known immunodeficiency"

(assert
(! (=> patient_has_finding_of_immunodeficiency_disorder_now@@suspected
      patient_has_finding_of_immunodeficiency_disorder_now)
:named REQ2_AUXILIARY1)) ;; "suspected immunodeficiency"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Exclusion: patient presents with cough AND (known immunodeficiency OR suspected immunodeficiency)
(assert
(! (not (and patient_has_finding_of_cough_now
             (or patient_has_finding_of_immunodeficiency_disorder_now@@known
                 patient_has_finding_of_immunodeficiency_disorder_now@@suspected)))
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient presents with cough) AND ((the patient has known immunodeficiency) OR (the patient has suspected immunodeficiency))."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_congestive_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a known diagnosis of congestive heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have a known diagnosis of congestive heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a known diagnosis of congestive heart failure.","meaning":"Boolean indicating whether the patient currently has a known diagnosis of congestive heart failure."} ;; "known congestive heart failure"
(declare-const patient_has_suspicion_of_congestive_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has suspected congestive heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have suspected congestive heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has suspected congestive heart failure.","meaning":"Boolean indicating whether the patient currently has suspected congestive heart failure."} ;; "suspected congestive heart failure"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not (and patient_has_finding_of_cough_now
             (or patient_has_diagnosis_of_congestive_heart_failure_now
                 patient_has_suspicion_of_congestive_heart_failure_now)))
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient presents with cough) AND ((the patient has known congestive heart failure) OR (the patient has suspected congestive heart failure))."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
;; "the patient presents with cough"
;; Already declared in previous SMT program:
;; (declare-const patient_has_finding_of_cough_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently presents with cough.","when_to_set_to_false":"Set to false if the patient currently does not present with cough.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently presents with cough.","meaning":"Boolean indicating whether the patient currently presents with cough."} ;; "cough"

(declare-const patient_has_finding_of_pulmonary_aspiration_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of pulmonary aspiration.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of pulmonary aspiration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of pulmonary aspiration.","meaning":"Boolean indicating whether the patient currently has pulmonary aspiration."} ;; "aspiration"

(declare-const patient_has_finding_of_pulmonary_aspiration_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the pulmonary aspiration is known (confirmed).","when_to_set_to_false":"Set to false if the pulmonary aspiration is not known (i.e., not confirmed or only suspected).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the pulmonary aspiration is known.","meaning":"Boolean indicating whether the pulmonary aspiration is known (confirmed)."} ;; "known foreign body aspiration"

(declare-const patient_has_finding_of_pulmonary_aspiration_now@@foreign_body Bool) ;; {"when_to_set_to_true":"Set to true if the pulmonary aspiration is due to a foreign body.","when_to_set_to_false":"Set to false if the pulmonary aspiration is not due to a foreign body.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the pulmonary aspiration is due to a foreign body.","meaning":"Boolean indicating whether the pulmonary aspiration is due to a foreign body."} ;; "foreign body aspiration"

(declare-const patient_has_finding_of_pulmonary_aspiration_now@@suspected Bool) ;; {"when_to_set_to_true":"Set to true if the pulmonary aspiration is suspected (not confirmed).","when_to_set_to_false":"Set to false if the pulmonary aspiration is not suspected (i.e., confirmed or ruled out).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the pulmonary aspiration is suspected.","meaning":"Boolean indicating whether the pulmonary aspiration is suspected (not confirmed)."} ;; "suspected foreign body aspiration"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_pulmonary_aspiration_now@@known
      patient_has_finding_of_pulmonary_aspiration_now)
:named REQ4_AUXILIARY0)) ;; "known foreign body aspiration""

(assert
(! (=> patient_has_finding_of_pulmonary_aspiration_now@@suspected
      patient_has_finding_of_pulmonary_aspiration_now)
:named REQ4_AUXILIARY1)) ;; "suspected foreign body aspiration""

(assert
(! (=> patient_has_finding_of_pulmonary_aspiration_now@@foreign_body
      patient_has_finding_of_pulmonary_aspiration_now)
:named REQ4_AUXILIARY2)) ;; "foreign body aspiration""

;; ===================== Constraint Assertions (REQ 4) =====================
;; The exclusion criterion is: (patient presents with cough) AND ((known foreign body aspiration) OR (suspected foreign body aspiration))
(assert
(! (not (and patient_has_finding_of_cough_now
             (or (and patient_has_finding_of_pulmonary_aspiration_now@@known
                      patient_has_finding_of_pulmonary_aspiration_now@@foreign_body)
                 (and patient_has_finding_of_pulmonary_aspiration_now@@suspected
                      patient_has_finding_of_pulmonary_aspiration_now@@foreign_body))))
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient presents with cough) AND ((the patient has known foreign body aspiration) OR (the patient has suspected foreign body aspiration))."
