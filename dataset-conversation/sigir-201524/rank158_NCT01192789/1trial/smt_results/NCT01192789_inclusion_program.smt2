;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_months Real) ;; {"when_to_set_to_value":"Set to the patient's current age in months if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in months is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in months."}  ;; "aged ≥ 2 months AND aged ≤ 59 months"
(declare-const patient_has_finding_of_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pneumonia.","meaning":"Boolean indicating whether the patient currently has pneumonia."}  ;; "pneumonia"
(declare-const patient_has_finding_of_pneumonia_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pneumonia and the pneumonia is severe.","when_to_set_to_false":"Set to false if the patient currently has pneumonia but the pneumonia is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the pneumonia is severe.","meaning":"Boolean indicating whether the patient's current pneumonia is severe."}  ;; "severe pneumonia"
(declare-const patient_has_presented_to_lady_health_worker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently presenting to a Lady Health Worker.","when_to_set_to_false":"Set to false if the patient is not currently presenting to a Lady Health Worker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently presenting to a Lady Health Worker.","meaning":"Boolean indicating whether the patient is currently presenting to a Lady Health Worker."}  ;; "present to Lady Health Workers"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable for severe pneumonia implies pneumonia
(assert
  (! (=> patient_has_finding_of_pneumonia_now@@severe
         patient_has_finding_of_pneumonia_now)
     :named REQ0_AUXILIARY0)) ;; "severe pneumonia" implies "pneumonia"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: To be included, the patient must be aged ≥ 2 months.
(assert
  (! (>= patient_age_value_recorded_now_in_months 2)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "aged ≥ 2 months"

;; Component 1: To be included, the patient must be aged ≤ 59 months.
(assert
  (! (<= patient_age_value_recorded_now_in_months 59)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "aged ≤ 59 months"

;; Component 2: To be included, the patient must present to Lady Health Workers with severe pneumonia.
(assert
  (! (and patient_has_presented_to_lady_health_worker_now
          patient_has_finding_of_pneumonia_now@@severe)
     :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "present to Lady Health Workers with severe pneumonia"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_informed_consent_given_by_legal_guardian Bool) ;; {"when_to_set_to_true":"Set to true if the patient has informed consent and the consent was given by a legal guardian.","when_to_set_to_false":"Set to false if the patient does not have informed consent given by a legal guardian.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has informed consent given by a legal guardian.","meaning":"Boolean indicating whether the patient has informed consent given by a legal guardian."}  ;; "the patient must have informed consent given by a legal guardian"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_informed_consent_given_by_legal_guardian
     :named REQ1_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must have informed consent given by a legal guardian"
